#include "AccountSync.hh"

#include "AsyncUtils.hh"

#include <algorithm>
#include <atomic>
#include <chrono>
#include <cstdio>
#include <inttypes.h>
#include <filesystem>
#include <memory>
#include <format>
#include <fstream>
#include <mutex>
#include <stdexcept>
#include <string>

namespace AccountSync {

static std::mutex config_mutex;
static std::mutex spool_mutex;
static Config current_config;
static std::atomic<bool> heartbeat_task_started(false);
static asio::io_context* login_lock_io_context = nullptr;

static uint64_t now_usecs() {
  using namespace std::chrono;
  return duration_cast<microseconds>(system_clock::now().time_since_epoch()).count();
}

static Config get_config() {
  std::lock_guard<std::mutex> g(config_mutex);
  return current_config;
}

struct ParsedHTTPURL {
  std::string host;
  uint16_t port = 80;
  std::string path = "/";
};

static ParsedHTTPURL parse_http_url(const std::string& url) {
  static const std::string prefix = "http://";
  if (!url.starts_with(prefix)) {
    throw std::runtime_error("only http:// coordinator URLs are supported");
  }

  size_t host_start = prefix.size();
  size_t path_start = url.find('/', host_start);
  std::string host_port = (path_start == std::string::npos)
      ? url.substr(host_start)
      : url.substr(host_start, path_start - host_start);

  ParsedHTTPURL ret;
  ret.path = (path_start == std::string::npos) ? "/" : url.substr(path_start);
  if (host_port.empty()) {
    throw std::runtime_error("coordinator URL has empty host");
  }

  size_t colon_offset = host_port.rfind(':');
  if (colon_offset == std::string::npos) {
    ret.host = host_port;
  } else {
    ret.host = host_port.substr(0, colon_offset);
    std::string port_s = host_port.substr(colon_offset + 1);
    if (ret.host.empty() || port_s.empty()) {
      throw std::runtime_error("coordinator URL has invalid host/port");
    }
    size_t end_offset = 0;
    uint64_t port = std::stoull(port_s, &end_offset, 10);
    if ((end_offset != port_s.size()) || (port == 0) || (port > 0xFFFF)) {
      throw std::runtime_error("coordinator URL has invalid port");
    }
    ret.port = port;
  }

  return ret;
}

static std::string join_url_path(std::string base_path, const std::string& suffix) {
  while ((base_path.size() > 1) && (base_path.back() == '/')) {
    base_path.pop_back();
  }
  if (base_path.empty() || (base_path == "/")) {
    return suffix;
  }
  return base_path + suffix;
}

static std::string lowercase(std::string s) {
  std::transform(s.begin(), s.end(), s.begin(), [](unsigned char ch) -> char {
    return static_cast<char>(std::tolower(ch));
  });
  return s;
}

static void trim_ascii_inplace(std::string& s) {
  while (!s.empty() && ((s.back() == ' ') || (s.back() == '\t') || (s.back() == '\r') || (s.back() == '\n'))) {
    s.pop_back();
  }
  size_t start = 0;
  while ((start < s.size()) && ((s[start] == ' ') || (s[start] == '\t') || (s[start] == '\r') || (s[start] == '\n'))) {
    start++;
  }
  if (start) {
    s = s.substr(start);
  }
}

static asio::awaitable<std::string> read_http_line(
    asio::ip::tcp::socket& sock,
    std::string& pending_data,
    size_t max_length) {
  static const char* delimiter = "\r\n";
  static const size_t delimiter_size = 2;

  size_t delimiter_pos = pending_data.find(delimiter);
  while ((delimiter_pos == std::string::npos) && (pending_data.size() < max_length)) {
    size_t pre_size = pending_data.size();
    pending_data.resize(std::min(max_length, pending_data.size() + 0x400));
    size_t bytes_read = co_await sock.async_read_some(
        asio::buffer(pending_data.data() + pre_size, pending_data.size() - pre_size),
        asio::use_awaitable);
    pending_data.resize(pre_size + bytes_read);
    delimiter_pos = pending_data.find(delimiter, (pre_size >= 1) ? (pre_size - 1) : 0);
  }

  if (delimiter_pos == std::string::npos) {
    throw std::runtime_error("HTTP response line exceeds maximum length");
  }

  std::string ret = pending_data.substr(0, delimiter_pos);
  pending_data = pending_data.substr(delimiter_pos + delimiter_size);
  co_return ret;
}

static asio::awaitable<std::string> read_http_data(
    asio::ip::tcp::socket& sock,
    std::string& pending_data,
    size_t size) {
  std::string ret;
  if (pending_data.size() == size) {
    pending_data.swap(ret);
  } else if (pending_data.size() > size) {
    ret = pending_data.substr(0, size);
    pending_data = pending_data.substr(size);
  } else {
    size_t bytes_to_read = size - pending_data.size();
    pending_data.swap(ret);
    ret.resize(size);
    co_await asio::async_read(
        sock,
        asio::buffer(ret.data() + size - bytes_to_read, bytes_to_read),
        asio::use_awaitable);
  }
  co_return ret;
}

static asio::awaitable<phosg::JSON> post_json_with_timeout(
    const Config& cfg,
    const std::string& path_suffix,
    const std::string& body) {
  ParsedHTTPURL url = parse_http_url(cfg.coordinator_url);
  std::string path = join_url_path(url.path, path_suffix);

  auto executor = co_await asio::this_coro::executor;
  auto resolver = std::make_shared<asio::ip::tcp::resolver>(executor);
  auto sock = std::make_shared<asio::ip::tcp::socket>(executor);
  auto timer = std::make_shared<asio::steady_timer>(executor);
  auto timed_out = std::make_shared<bool>(false);

  timer->expires_after(std::chrono::microseconds(cfg.request_timeout_usecs));
  timer->async_wait([resolver, sock, timed_out](std::error_code ec) -> void {
    if (!ec) {
      *timed_out = true;
      resolver->cancel();
      if (sock->is_open()) {
        sock->close();
      }
    }
  });

  try {
    auto endpoints = co_await resolver->async_resolve(url.host, std::format("{}", url.port), asio::use_awaitable);
    co_await asio::async_connect(*sock, endpoints, asio::use_awaitable);

    std::string host_header = url.host;
    if (url.port != 80) {
      host_header += std::format(":{}", url.port);
    }

    std::string request = std::format(
        "POST {} HTTP/1.1\r\n"
        "Host: {}\r\n"
        "User-Agent: psopeeps-newserv\r\n"
        "Content-Type: application/json\r\n"
        "Accept: application/json\r\n"
        "Connection: close\r\n"
        "X-Psopeeps-Admin-Secret: {}\r\n"
        "Content-Length: {}\r\n"
        "\r\n"
        "{}",
        path,
        host_header,
        cfg.shared_secret,
        body.size(),
        body);

    co_await asio::async_write(*sock, asio::buffer(request), asio::use_awaitable);

    std::string pending_data;
    std::string status_line = co_await read_http_line(*sock, pending_data, 0x1000);
    if (!status_line.starts_with("HTTP/1.")) {
      throw std::runtime_error("invalid HTTP response from coordinator");
    }

    size_t first_space = status_line.find(' ');
    if (first_space == std::string::npos) {
      throw std::runtime_error("invalid HTTP status line from coordinator");
    }
    size_t second_space = status_line.find(' ', first_space + 1);
    std::string code_s = status_line.substr(
        first_space + 1,
        (second_space == std::string::npos) ? std::string::npos : (second_space - first_space - 1));
    int response_code = std::stoi(code_s);

    size_t content_length = 0;
    for (;;) {
      std::string line = co_await read_http_line(*sock, pending_data, 0x10000);
      if (line.empty()) {
        break;
      }
      size_t colon_offset = line.find(':');
      if (colon_offset == std::string::npos) {
        continue;
      }
      std::string name = lowercase(line.substr(0, colon_offset));
      std::string value = line.substr(colon_offset + 1);
      trim_ascii_inplace(value);
      if (name == "content-length") {
        size_t end_offset = 0;
        content_length = std::stoull(value, &end_offset, 10);
        if (end_offset != value.size()) {
          throw std::runtime_error("invalid Content-Length from coordinator");
        }
      }
    }

    if (response_code != 200) {
      throw std::runtime_error(std::format("coordinator returned HTTP {}", response_code));
    }
    if (content_length > 0x100000) {
      throw std::runtime_error("coordinator response is too large");
    }

    std::string response_body = co_await read_http_data(*sock, pending_data, content_length);
    timer->cancel();
    co_return phosg::JSON::parse(response_body);

  } catch (...) {
    timer->cancel();
    if (*timed_out) {
      throw std::runtime_error("coordinator request timed out");
    }
    throw;
  }
}

static std::string source_label(const Config& cfg) {
  if (!cfg.source.empty()) {
    return cfg.source;
  }
  if (!cfg.source_region.empty() && !cfg.source_ship.empty()) {
    return cfg.source_region + "-" + cfg.source_ship;
  }
  if (!cfg.source_region.empty()) {
    return cfg.source_region;
  }
  if (!cfg.source_ship.empty()) {
    return cfg.source_ship;
  }
  return "unknown";
}

static std::string json_escape(const std::string& s) {
  std::string ret;
  ret.reserve(s.size() + 8);
  for (unsigned char ch : s) {
    switch (ch) {
      case '\\':
        ret += "\\\\";
        break;
      case '"':
        ret += "\\\"";
        break;
      case '\b':
        ret += "\\b";
        break;
      case '\f':
        ret += "\\f";
        break;
      case '\n':
        ret += "\\n";
        break;
      case '\r':
        ret += "\\r";
        break;
      case '\t':
        ret += "\\t";
        break;
      default:
        if (ch < 0x20) {
          char buf[8];
          std::snprintf(buf, sizeof(buf), "\\u%04X", ch);
          ret += buf;
        } else {
          ret += static_cast<char>(ch);
        }
    }
  }
  return ret;
}

static void append_spool_line(const Config& cfg, const std::string& line) {
  if (cfg.spool_directory.empty()) {
    return;
  }

  try {
    std::lock_guard<std::mutex> g(spool_mutex);
    std::filesystem::create_directories(cfg.spool_directory);
    std::filesystem::path path = std::filesystem::path(cfg.spool_directory) / "events.jsonl";

    std::ofstream f(path, std::ios::app);
    if (!f) {
      throw std::runtime_error("failed to open spool file");
    }
    f << line << '\n';

  } catch (const std::exception& e) {
    std::fprintf(stderr,
        "[AccountSync] warning failed_to_write_spool directory=%s error=%s\n",
        cfg.spool_directory.c_str(),
        e.what());
  }
}

static std::string base_event_json(const Config& cfg, const char* event, uint32_t account_id) {
  return std::format(
      "{{\"timestamp_usecs\":{},\"producer\":\"newserv\",\"source\":\"{}\",\"source_region\":\"{}\",\"source_ship\":\"{}\",\"account_store\":\"{}\",\"event\":\"{}\",\"account_id\":{},\"account_id_str\":\"{:010}\"",
      now_usecs(),
      json_escape(source_label(cfg)),
      json_escape(cfg.source_region),
      json_escape(cfg.source_ship),
      json_escape(cfg.account_store),
      json_escape(event),
      static_cast<unsigned int>(account_id),
      static_cast<unsigned int>(account_id));
}

void configure(const Config& cfg) {
  {
    std::lock_guard<std::mutex> g(config_mutex);
    current_config = cfg;
  }

  if (cfg.enabled) {
    std::fprintf(stderr,
        "[AccountSync] config enabled source=%s source_region=%s source_ship=%s account_store=%s coordinator_url=%s notify_bb_sessions=%s spool_directory=%s login_locks=%s\n",
        source_label(cfg).c_str(),
        cfg.source_region.c_str(),
        cfg.source_ship.c_str(),
        cfg.account_store.c_str(),
        cfg.coordinator_url.c_str(),
        cfg.notify_bb_sessions ? "true" : "false",
        cfg.spool_directory.c_str(),
        cfg.enable_login_locks ? "true" : "false");
  }
}

void configure_from_json(const phosg::JSON& json) {
  Config cfg;
  cfg.enabled = json.get_bool("Enabled", false);

  const std::string legacy_region = json.get_string("Region", "");
  cfg.source = json.get_string("Source", legacy_region);
  cfg.source_region = json.get_string("SourceRegion", "");
  cfg.source_ship = json.get_string("SourceShip", "");
  cfg.account_store = json.get_string("AccountStore", "shared");

  if (cfg.source_region.empty() && cfg.source_ship.empty() && !legacy_region.empty()) {
    size_t dash_offset = legacy_region.find('-');
    if (dash_offset != std::string::npos) {
      cfg.source_region = legacy_region.substr(0, dash_offset);
      cfg.source_ship = legacy_region.substr(dash_offset + 1);
    } else {
      cfg.source_region = legacy_region;
    }
  }

  cfg.coordinator_url = json.get_string("CoordinatorURL", "");
  cfg.shared_secret = json.get_string("SharedSecret", "");
  cfg.request_timeout_usecs = json.get_int("RequestTimeoutUsecs", 3000000);
  cfg.fail_open = json.get_bool("FailOpen", false);
  cfg.notify_account_saves = json.get_bool("NotifyAccountSaves", true);
  cfg.notify_player_saves = json.get_bool("NotifyPlayerSaves", true);
  cfg.notify_backup_saves = json.get_bool("NotifyBackupSaves", true);
  cfg.enable_login_locks = json.get_bool("EnableLoginLocks", false);
  cfg.login_lock_heartbeat_interval_usecs = json.get_int("LoginLockHeartbeatIntervalUsecs", 60000000);
  cfg.notify_bb_sessions = json.get_bool("NotifyBBSessions", cfg.enable_login_locks);
  cfg.spool_directory = json.get_string("SpoolDirectory", "system/account-sync-spool");
  configure(cfg);
}

static asio::awaitable<void> send_login_lock_heartbeat() {
  auto cfg = get_config();

  if (!cfg.enabled || !cfg.enable_login_locks) {
    co_return;
  }
  if (cfg.coordinator_url.empty()) {
    std::fprintf(stderr,
        "[AccountSync] warning login_lock_heartbeat_skipped reason=coordinator_url_not_configured source=%s\n",
        source_label(cfg).c_str());
    co_return;
  }

  std::string body = std::format(
      "{{\"source\":\"{}\",\"source_region\":\"{}\",\"source_ship\":\"{}\",\"account_store\":\"{}\"}}",
      json_escape(source_label(cfg)),
      json_escape(cfg.source_region),
      json_escape(cfg.source_ship),
      json_escape(cfg.account_store));

  try {
    phosg::JSON response = co_await post_json_with_timeout(cfg, "/account-locks/heartbeat", body);
    bool ok = response.get_bool("ok", response.get_bool("OK", false));
    if (!ok) {
      std::fprintf(stderr,
          "[AccountSync] warning login_lock_heartbeat_rejected source=%s response=%s\n",
          source_label(cfg).c_str(),
          response.serialize().c_str());
      co_return;
    }

    int64_t refreshed = response.get_int("refreshed", 0);
    std::fprintf(stderr,
        "[AccountSync] login_lock_heartbeat_ok source=%s refreshed=%" PRId64 "\n",
        source_label(cfg).c_str(),
        refreshed);

  } catch (const std::exception& e) {
    std::fprintf(stderr,
        "[AccountSync] warning login_lock_heartbeat_failed source=%s error=%s\n",
        source_label(cfg).c_str(),
        e.what());
  }
}

static asio::awaitable<void> login_lock_heartbeat_task() {
  for (;;) {
    auto cfg = get_config();
    uint64_t interval_usecs = cfg.login_lock_heartbeat_interval_usecs;
    if (interval_usecs < 5000000) {
      interval_usecs = 5000000;
    }

    co_await async_sleep(std::chrono::microseconds(interval_usecs));
    co_await send_login_lock_heartbeat();
  }
}

void start_login_lock_heartbeat_task(asio::io_context& io_context) {
  login_lock_io_context = &io_context;

  bool expected = false;
  if (!heartbeat_task_started.compare_exchange_strong(expected, true)) {
    return;
  }

  asio::co_spawn(io_context, login_lock_heartbeat_task(), asio::detached);
  std::fprintf(stderr, "[AccountSync] login lock heartbeat task started\n");
}


asio::awaitable<LoginLockAcquireResult> acquire_login_lock(
    uint32_t account_id,
    const std::string& version_name,
    const std::string& existing_session_nonce) {
  auto cfg = get_config();

  LoginLockAcquireResult ret;
  if (!cfg.enabled || !cfg.enable_login_locks) {
    co_return ret;
  }

  if (!existing_session_nonce.empty()) {
    ret.session_nonce = existing_session_nonce;
    co_return ret;
  }

  std::string proposed_session_nonce = std::format("{}-{}-{}", source_label(cfg), account_id, now_usecs());

  if (cfg.coordinator_url.empty()) {
    std::string message = "account lock coordinator URL is not configured";
    if (cfg.fail_open) {
      ret.allowed = true;
      ret.fail_open_used = true;
      ret.session_nonce = proposed_session_nonce;
      ret.message = message;
      std::fprintf(stderr,
          "[AccountSync] warning login_lock_fail_open reason=%s account_id=%010u source=%s version=%s nonce=%s\n",
          message.c_str(),
          static_cast<unsigned int>(account_id),
          source_label(cfg).c_str(),
          version_name.c_str(),
          ret.session_nonce.c_str());
      co_return ret;
    }

    ret.allowed = false;
    ret.message = "$C6Account lock server\nis unavailable.";
    std::fprintf(stderr,
        "[AccountSync] login_lock_denied reason=%s account_id=%010u source=%s version=%s\n",
        message.c_str(),
        static_cast<unsigned int>(account_id),
        source_label(cfg).c_str(),
        version_name.c_str());
    co_return ret;
  }

  std::string body = std::format(
      "{{\"account_id\":{},\"account_id_str\":\"{:010}\",\"source\":\"{}\",\"source_region\":\"{}\",\"source_ship\":\"{}\",\"account_store\":\"{}\",\"version\":\"{}\",\"session_nonce\":\"{}\"}}",
      static_cast<unsigned int>(account_id),
      static_cast<unsigned int>(account_id),
      json_escape(source_label(cfg)),
      json_escape(cfg.source_region),
      json_escape(cfg.source_ship),
      json_escape(cfg.account_store),
      json_escape(version_name),
      json_escape(proposed_session_nonce));

  try {
    phosg::JSON response = co_await post_json_with_timeout(cfg, "/account-locks/acquire", body);

    ret.allowed = response.get_bool("ok", response.get_bool("OK", false));
    ret.session_nonce = response.get_string("session_nonce", proposed_session_nonce);
    ret.message = response.get_string("message", "");
    ret.holder_source = response.get_string("holder_source", "");

    if (ret.allowed) {
      if (ret.session_nonce.empty()) {
        ret.session_nonce = proposed_session_nonce;
      }
      std::fprintf(stderr,
          "[AccountSync] login_lock_acquired account_id=%010u source=%s version=%s nonce=%s\n",
          static_cast<unsigned int>(account_id),
          source_label(cfg).c_str(),
          version_name.c_str(),
          ret.session_nonce.c_str());
    } else {
      if (ret.message.empty()) {
        ret.message = "$C6Account is already active\non another ship.";
      }
      std::fprintf(stderr,
          "[AccountSync] login_lock_denied account_id=%010u source=%s version=%s holder_source=%s message=%s\n",
          static_cast<unsigned int>(account_id),
          source_label(cfg).c_str(),
          version_name.c_str(),
          ret.holder_source.c_str(),
          ret.message.c_str());
    }

    co_return ret;

  } catch (const std::exception& e) {
    if (cfg.fail_open) {
      ret.allowed = true;
      ret.fail_open_used = true;
      ret.session_nonce = proposed_session_nonce;
      ret.message = e.what();
      std::fprintf(stderr,
          "[AccountSync] warning login_lock_fail_open reason=%s account_id=%010u source=%s version=%s nonce=%s\n",
          e.what(),
          static_cast<unsigned int>(account_id),
          source_label(cfg).c_str(),
          version_name.c_str(),
          ret.session_nonce.c_str());
      co_return ret;
    }

    ret.allowed = false;
    ret.message = "$C6Account lock server\nis unavailable.";
    std::fprintf(stderr,
        "[AccountSync] login_lock_denied reason=%s account_id=%010u source=%s version=%s\n",
        e.what(),
        static_cast<unsigned int>(account_id),
        source_label(cfg).c_str(),
        version_name.c_str());
    co_return ret;
  }
}

static asio::awaitable<void> send_login_lock_session_end(
    uint32_t account_id,
    std::string session_nonce,
    std::string version_name) {
  auto cfg = get_config();

  if (!cfg.enabled || !cfg.enable_login_locks) {
    co_return;
  }
  if (cfg.coordinator_url.empty()) {
    std::fprintf(stderr,
        "[AccountSync] warning login_lock_session_end_skipped reason=coordinator_url_not_configured account_id=%010u source=%s nonce=%s\n",
        static_cast<unsigned int>(account_id),
        source_label(cfg).c_str(),
        session_nonce.c_str());
    co_return;
  }
  if (session_nonce.empty()) {
    std::fprintf(stderr,
        "[AccountSync] warning login_lock_session_end_skipped reason=empty_session_nonce account_id=%010u source=%s version=%s\n",
        static_cast<unsigned int>(account_id),
        source_label(cfg).c_str(),
        version_name.c_str());
    co_return;
  }

  std::string body = std::format(
      "{{\"account_id\":{},\"account_id_str\":\"{:010}\",\"source\":\"{}\",\"source_region\":\"{}\",\"source_ship\":\"{}\",\"account_store\":\"{}\",\"version\":\"{}\",\"session_nonce\":\"{}\"}}",
      static_cast<unsigned int>(account_id),
      static_cast<unsigned int>(account_id),
      json_escape(source_label(cfg)),
      json_escape(cfg.source_region),
      json_escape(cfg.source_ship),
      json_escape(cfg.account_store),
      json_escape(version_name),
      json_escape(session_nonce));

  try {
    phosg::JSON response = co_await post_json_with_timeout(cfg, "/account-locks/session-end", body);
    bool ok = response.get_bool("ok", response.get_bool("OK", false));
    if (!ok) {
      std::fprintf(stderr,
          "[AccountSync] warning login_lock_session_end_rejected account_id=%010u source=%s nonce=%s response=%s\n",
          static_cast<unsigned int>(account_id),
          source_label(cfg).c_str(),
          session_nonce.c_str(),
          response.serialize().c_str());
      co_return;
    }

    std::fprintf(stderr,
        "[AccountSync] login_lock_session_end_ok account_id=%010u source=%s nonce=%s\n",
        static_cast<unsigned int>(account_id),
        source_label(cfg).c_str(),
        session_nonce.c_str());

  } catch (const std::exception& e) {
    std::fprintf(stderr,
        "[AccountSync] warning login_lock_session_end_failed account_id=%010u source=%s nonce=%s error=%s\n",
        static_cast<unsigned int>(account_id),
        source_label(cfg).c_str(),
        session_nonce.c_str(),
        e.what());
  }
}

void notify_login_session_end(
    uint32_t account_id,
    const std::string& session_nonce,
    const std::string& version_name) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.enable_login_locks) {
    return;
  }

  std::fprintf(stderr,
      "[AccountSync] event=login_session_end source=%s source_region=%s source_ship=%s account_store=%s account_id=%010u session_nonce=%s version=%s\n",
      source_label(cfg).c_str(),
      cfg.source_region.c_str(),
      cfg.source_ship.c_str(),
      cfg.account_store.c_str(),
      static_cast<unsigned int>(account_id),
      session_nonce.c_str(),
      version_name.c_str());

  if (login_lock_io_context) {
    asio::co_spawn(
        *login_lock_io_context,
        send_login_lock_session_end(account_id, session_nonce, version_name),
        asio::detached);
  } else {
    std::fprintf(stderr,
        "[AccountSync] warning login_lock_session_end_not_spawned reason=io_context_not_available account_id=%010u source=%s nonce=%s\n",
        static_cast<unsigned int>(account_id),
        source_label(cfg).c_str(),
        session_nonce.c_str());
  }

  auto line = base_event_json(cfg, "login_session_end", account_id) +
      std::format(",\"session_nonce\":\"{}\",\"version\":\"{}\"}}",
          json_escape(session_nonce),
          json_escape(version_name));
  append_spool_line(cfg, line);
}

void notify_account_saved(uint32_t account_id, const std::string& filename) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.notify_account_saves) {
    return;
  }

  std::fprintf(stderr,
      "[AccountSync] event=account_saved source=%s source_region=%s source_ship=%s account_store=%s account_id=%010u filename=%s\n",
      source_label(cfg).c_str(),
      cfg.source_region.c_str(),
      cfg.source_ship.c_str(),
      cfg.account_store.c_str(),
      static_cast<unsigned int>(account_id),
      filename.c_str());

  auto line = base_event_json(cfg, "account_saved", account_id) +
      std::format(",\"filename\":\"{}\"}}", json_escape(filename));
  append_spool_line(cfg, line);
}

void notify_backup_saved(uint32_t account_id, size_t slot, const std::string& filename) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.notify_backup_saves) {
    return;
  }

  std::fprintf(stderr,
      "[AccountSync] event=backup_saved source=%s source_region=%s source_ship=%s account_store=%s account_id=%010u slot=%zu filename=%s\n",
      source_label(cfg).c_str(),
      cfg.source_region.c_str(),
      cfg.source_ship.c_str(),
      cfg.account_store.c_str(),
      static_cast<unsigned int>(account_id),
      slot,
      filename.c_str());

  auto line = base_event_json(cfg, "backup_saved", account_id) +
      std::format(",\"slot\":{},\"filename\":\"{}\"}}", slot, json_escape(filename));
  append_spool_line(cfg, line);
}

void notify_player_state_saved(
    const char* reason,
    uint32_t account_id,
    const std::string& bb_username,
    const std::string& filename) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.notify_player_saves) {
    return;
  }

  std::fprintf(stderr,
      "[AccountSync] event=player_state_saved source=%s source_region=%s source_ship=%s account_store=%s reason=%s account_id=%010u bb_username=%s filename=%s\n",
      source_label(cfg).c_str(),
      cfg.source_region.c_str(),
      cfg.source_ship.c_str(),
      cfg.account_store.c_str(),
      reason,
      static_cast<unsigned int>(account_id),
      bb_username.c_str(),
      filename.c_str());

  auto line = base_event_json(cfg, "player_state_saved", account_id) +
      std::format(",\"reason\":\"{}\",\"bb_username\":\"{}\",\"filename\":\"{}\"}}",
          json_escape(reason),
          json_escape(bb_username),
          json_escape(filename));
  append_spool_line(cfg, line);
}

void notify_bb_login_start(
    uint32_t account_id,
    const std::string& bb_username,
    int64_t character_slot,
    uint8_t connection_phase) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.notify_bb_sessions) {
    return;
  }

  std::fprintf(stderr,
      "[AccountSync] event=bb_login_start source=%s source_region=%s source_ship=%s account_store=%s account_id=%010u bb_username=%s character_slot=%lld connection_phase=%u\n",
      source_label(cfg).c_str(),
      cfg.source_region.c_str(),
      cfg.source_ship.c_str(),
      cfg.account_store.c_str(),
      static_cast<unsigned int>(account_id),
      bb_username.c_str(),
      static_cast<long long>(character_slot),
      static_cast<unsigned int>(connection_phase));

  auto line = base_event_json(cfg, "bb_login_start", account_id) +
      std::format(",\"bb_username\":\"{}\",\"character_slot\":{},\"connection_phase\":{}}}",
          json_escape(bb_username),
          static_cast<long long>(character_slot),
          static_cast<unsigned int>(connection_phase));
  append_spool_line(cfg, line);
}

void notify_bb_login_end(
    uint32_t account_id,
    const std::string& bb_username,
    int64_t character_slot) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.notify_bb_sessions) {
    return;
  }

  std::fprintf(stderr,
      "[AccountSync] event=bb_login_end source=%s source_region=%s source_ship=%s account_store=%s account_id=%010u bb_username=%s character_slot=%lld\n",
      source_label(cfg).c_str(),
      cfg.source_region.c_str(),
      cfg.source_ship.c_str(),
      cfg.account_store.c_str(),
      static_cast<unsigned int>(account_id),
      bb_username.c_str(),
      static_cast<long long>(character_slot));

  auto line = base_event_json(cfg, "bb_login_end", account_id) +
      std::format(",\"bb_username\":\"{}\",\"character_slot\":{}}}",
          json_escape(bb_username),
          static_cast<long long>(character_slot));
  append_spool_line(cfg, line);
}

} // namespace AccountSync
