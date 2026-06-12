#include "TeamSync.hh"

#include "AsyncUtils.hh"

#include <algorithm>
#include <atomic>
#include <chrono>
#include <deque>
#include <cctype>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <format>
#include <functional>
#include <memory>
#include <mutex>
#include <random>
#include <stdexcept>
#include <string>

namespace TeamSync {

static std::mutex config_mutex;
static Config current_config;
static std::atomic<bool> exchange_task_started(false);

struct ExchangeState {
  bool bootstrapped = false;
  uint64_t cursor = 0;
  uint64_t next_seq = 1;
  uint64_t consecutive_failures = 0;
};

struct OutboundEvent {
  uint64_t seq = 0;
  std::string type;

  uint32_t team_id = 0;
  uint32_t account_id = 0;
  std::string name;

  std::string team_name;
  uint32_t creator_account_id = 0;
  std::string creator_name;
};

static constexpr size_t MAX_OUTBOUND_EVENTS = 256;

static std::mutex exchange_state_mutex;
static ExchangeState exchange_state;
static std::deque<OutboundEvent> outbound_events;

static std::mutex canonical_team_state_callback_mutex;
static CanonicalTeamStateCallback canonical_team_state_callback;

static std::string source_label(const Config& cfg) {
  if (!cfg.source.empty()) {
    return cfg.source;
  }
  if (!cfg.source_region.empty() && !cfg.source_ship.empty()) {
    return cfg.source_region + "-" + cfg.source_ship;
  }
  if (!cfg.source_ship.empty()) {
    return cfg.source_ship;
  }
  return cfg.source_region;
}

static Config get_config() {
  std::lock_guard<std::mutex> g(config_mutex);
  return current_config;
}

static ExchangeState get_exchange_state() {
  std::lock_guard<std::mutex> g(exchange_state_mutex);
  return exchange_state;
}

static void reset_exchange_state() {
  std::lock_guard<std::mutex> g(exchange_state_mutex);
  exchange_state = ExchangeState();
}

static bool exchange_enabled(const Config& cfg) {
  return cfg.enabled && (cfg.relay_team_chat || cfg.relay_team_points || cfg.relay_team_actions);
}

static uint64_t exchange_sleep_usecs(const Config& cfg, uint64_t consecutive_failures) {
  uint64_t base = cfg.exchange_interval_usecs;
  if (consecutive_failures) {
    uint64_t multiplier = 1ULL << std::min<uint64_t>(consecutive_failures, 5);
    base = std::min<uint64_t>(30000000, base * multiplier);
  }

  static std::mutex jitter_mutex;
  static std::mt19937_64 rng(std::random_device{}());
  std::lock_guard<std::mutex> g(jitter_mutex);
  std::uniform_int_distribution<uint64_t> dist(0, std::max<uint64_t>(1, base / 5));
  return base + dist(rng);
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

static std::string json_escape(const std::string& s) {
  std::string ret;
  ret.reserve(s.size() + 2);
  for (char ch : s) {
    if (ch == '\\') {
      ret += "\\\\";
    } else if (ch == '"') {
      ret += "\\\"";
    } else if (ch == '\n') {
      ret += "\\n";
    } else if (ch == '\r') {
      ret += "\\r";
    } else if (ch == '\t') {
      ret += "\\t";
    } else {
      ret += ch;
    }
  }
  return ret;
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
        "X-Psopeeps-Team-Sync-Secret: {}\r\n"
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

    if (content_length > 0x100000) {
      throw std::runtime_error("coordinator response is too large");
    }

    std::string response_body = co_await read_http_data(*sock, pending_data, content_length);

    if (response_code != 200) {
      throw std::runtime_error(std::format(
          "coordinator returned HTTP {} body={}",
          response_code,
          response_body));
    }

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

void configure(const Config& cfg) {
  Config old_cfg;
  {
    std::lock_guard<std::mutex> g(config_mutex);
    old_cfg = current_config;
    current_config = cfg;
  }

  if ((old_cfg.source_region != cfg.source_region) ||
      (old_cfg.source_ship != cfg.source_ship) ||
      (old_cfg.team_namespace != cfg.team_namespace)) {
    reset_exchange_state();
  }

  if (cfg.enabled) {
    std::fprintf(stderr,
        "[TeamSync] config enabled source=%s source_region=%s source_ship=%s team_namespace=%s coordinator_url=%s exchange_interval_usecs=%llu relay_team_chat=%s relay_team_points=%s relay_team_actions=%s\n",
        source_label(cfg).c_str(),
        cfg.source_region.c_str(),
        cfg.source_ship.c_str(),
        cfg.team_namespace.c_str(),
        cfg.coordinator_url.c_str(),
        static_cast<unsigned long long>(cfg.exchange_interval_usecs),
        cfg.relay_team_chat ? "true" : "false",
        cfg.relay_team_points ? "true" : "false",
        cfg.relay_team_actions ? "true" : "false");
  } else {
    std::fprintf(stderr, "[TeamSync] config disabled\n");
  }
}

void configure_from_json(const phosg::JSON& json) {
  Config cfg;
  cfg.enabled = json.get_bool("Enabled", false);

  const std::string legacy_region = json.get_string("Region", "");
  cfg.source = json.get_string("Source", legacy_region);
  cfg.source_region = json.get_string("SourceRegion", "");
  cfg.source_ship = json.get_string("SourceShip", "");

  const std::string identity_source = !cfg.source.empty() ? cfg.source : legacy_region;
  if (cfg.source_region.empty() && cfg.source_ship.empty() && !identity_source.empty()) {
    size_t dash_offset = identity_source.find('-');
    if (dash_offset != std::string::npos) {
      cfg.source_region = identity_source.substr(0, dash_offset);
      cfg.source_ship = identity_source.substr(dash_offset + 1);
    } else {
      cfg.source_region = identity_source;
    }
  }

  cfg.team_namespace = json.get_string("TeamNamespace", "bb");
  cfg.coordinator_url = json.get_string("CoordinatorURL", "");
  cfg.shared_secret = json.get_string("SharedSecret", "");

  int64_t request_timeout_usecs = json.get_int("RequestTimeoutUsecs", 3000000);
  if (request_timeout_usecs < 100000) {
    request_timeout_usecs = 100000;
  } else if (request_timeout_usecs > 30000000) {
    request_timeout_usecs = 30000000;
  }
  cfg.request_timeout_usecs = static_cast<uint64_t>(request_timeout_usecs);

  int64_t exchange_interval_usecs = json.get_int("ExchangeIntervalUsecs", 1500000);
  if (exchange_interval_usecs < 250000) {
    exchange_interval_usecs = 250000;
  } else if (exchange_interval_usecs > 30000000) {
    exchange_interval_usecs = 30000000;
  }
  cfg.exchange_interval_usecs = static_cast<uint64_t>(exchange_interval_usecs);

  cfg.relay_team_chat = json.get_bool("RelayTeamChat", false);
  cfg.relay_team_points = json.get_bool("RelayTeamPoints", false);
  cfg.relay_team_actions = json.get_bool("RelayTeamActions", false);

  if (cfg.enabled && (cfg.source_region.empty() || cfg.source_ship.empty())) {
    throw std::runtime_error("TeamSync requires SourceRegion and SourceShip, or Source/Region in region-ship form");
  }
  if (cfg.enabled && cfg.team_namespace.empty()) {
    throw std::runtime_error("TeamSync requires non-empty TeamNamespace");
  }

  configure(cfg);
}

bool enabled() {
  return get_config().enabled;
}

bool relay_team_chat_enabled() {
  auto cfg = get_config();
  return cfg.enabled && cfg.relay_team_chat;
}

bool relay_team_actions_enabled() {
  auto cfg = get_config();
  return cfg.enabled && cfg.relay_team_actions;
}

bool enqueue_team_create(const std::string& team_name, uint32_t creator_account_id, const std::string& creator_name) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.relay_team_actions) {
    return false;
  }
  if (team_name.empty() || creator_account_id == 0 || creator_name.empty()) {
    return false;
  }

  std::lock_guard<std::mutex> g(exchange_state_mutex);
  if (outbound_events.size() >= MAX_OUTBOUND_EVENTS) {
    std::fprintf(stderr,
        "[TeamSync] warning outbound_event_dropped reason=queue_full source=%s team_namespace=%s type=team_create\n",
        source_label(cfg).c_str(),
        cfg.team_namespace.c_str());
    return false;
  }

  OutboundEvent ev;
  ev.type = "team_create";
  ev.team_name = team_name;
  ev.creator_account_id = creator_account_id;
  ev.creator_name = creator_name;
  outbound_events.emplace_back(std::move(ev));
  return true;
}

bool enqueue_team_member_add(uint32_t team_id, uint32_t account_id, const std::string& name) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.relay_team_actions) {
    return false;
  }
  if (team_id == 0 || account_id == 0 || name.empty()) {
    return false;
  }

  std::lock_guard<std::mutex> g(exchange_state_mutex);
  if (outbound_events.size() >= MAX_OUTBOUND_EVENTS) {
    std::fprintf(stderr,
        "[TeamSync] warning outbound_event_dropped reason=queue_full source=%s team_namespace=%s type=team_member_add\n",
        source_label(cfg).c_str(),
        cfg.team_namespace.c_str());
    return false;
  }

  OutboundEvent ev;
  ev.type = "team_member_add";
  ev.team_id = team_id;
  ev.account_id = account_id;
  ev.name = name;
  outbound_events.emplace_back(std::move(ev));
  return true;
}

bool enqueue_team_member_remove(uint32_t account_id) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.relay_team_actions) {
    return false;
  }
  if (account_id == 0) {
    return false;
  }

  std::lock_guard<std::mutex> g(exchange_state_mutex);
  if (outbound_events.size() >= MAX_OUTBOUND_EVENTS) {
    std::fprintf(stderr,
        "[TeamSync] warning outbound_event_dropped reason=queue_full source=%s team_namespace=%s type=team_member_remove\n",
        source_label(cfg).c_str(),
        cfg.team_namespace.c_str());
    return false;
  }

  OutboundEvent ev;
  ev.type = "team_member_remove";
  ev.account_id = account_id;
  outbound_events.emplace_back(std::move(ev));
  return true;
}

void set_canonical_team_state_callback(CanonicalTeamStateCallback cb) {
  std::lock_guard<std::mutex> g(canonical_team_state_callback_mutex);
  canonical_team_state_callback = std::move(cb);
}

static void apply_canonical_team_state(const phosg::JSON& canonical_team_state) {
  CanonicalTeamStateCallback cb;
  {
    std::lock_guard<std::mutex> g(canonical_team_state_callback_mutex);
    cb = canonical_team_state_callback;
  }
  if (cb) {
    cb(canonical_team_state);
  }
}

static std::string exchange_body_for_current_state(const Config& cfg) {
  std::lock_guard<std::mutex> g(exchange_state_mutex);

  std::string events_json = "[]";
  if (exchange_state.bootstrapped) {
    std::string parts;
    bool first = true;

    for (auto& ev : outbound_events) {
      if (ev.seq == 0) {
        ev.seq = exchange_state.next_seq++;
      }

      if (!first) {
        parts += ",";
      }
      first = false;

      if (ev.type == "team_create") {
        parts += std::format(
            "{{\"seq\":{},\"type\":\"team_create\",\"team_namespace\":\"{}\",\"creator_account_id\":{},\"creator_name\":\"{}\",\"team_name\":\"{}\"}}",
            ev.seq,
            json_escape(cfg.team_namespace),
            ev.creator_account_id,
            json_escape(ev.creator_name),
            json_escape(ev.team_name));

      } else if (ev.type == "team_member_add") {
        parts += std::format(
            "{{\"seq\":{},\"type\":\"team_member_add\",\"team_namespace\":\"{}\",\"team_id\":{},\"account_id\":{},\"name\":\"{}\"}}",
            ev.seq,
            json_escape(cfg.team_namespace),
            ev.team_id,
            ev.account_id,
            json_escape(ev.name));

      } else if (ev.type == "team_member_remove") {
        parts += std::format(
            "{{\"seq\":{},\"type\":\"team_member_remove\",\"team_namespace\":\"{}\",\"account_id\":{}}}",
            ev.seq,
            json_escape(cfg.team_namespace),
            ev.account_id);
      }
    }

    events_json = "[" + parts + "]";
  }

  if (exchange_state.bootstrapped) {
    return std::format(
        "{{\"source\":\"{}\",\"source_region\":\"{}\",\"source_ship\":\"{}\",\"team_namespace\":\"{}\",\"cursor\":{},\"events\":{}}}",
        json_escape(source_label(cfg)),
        json_escape(cfg.source_region),
        json_escape(cfg.source_ship),
        json_escape(cfg.team_namespace),
        exchange_state.cursor,
        events_json);
  }

  return std::format(
      "{{\"source\":\"{}\",\"source_region\":\"{}\",\"source_ship\":\"{}\",\"team_namespace\":\"{}\",\"cursor\":\"\",\"events\":[]}}",
      json_escape(source_label(cfg)),
      json_escape(cfg.source_region),
      json_escape(cfg.source_ship),
      json_escape(cfg.team_namespace));
}

static asio::awaitable<void> run_empty_exchange_once(const Config& cfg) {
  std::string body = exchange_body_for_current_state(cfg);
  phosg::JSON response = co_await post_json_with_timeout(cfg, "/team-sync/exchange", body);

  if (!response.get_bool("ok", false)) {
    throw std::runtime_error("coordinator returned ok=false");
  }

  uint64_t ack_max_seq = response.get_int("ack_max_seq", 0);
  uint64_t next_cursor = response.get_int("next_cursor", 0);
  bool truncated = response.get_bool("truncated", false);
  size_t inbound_events = response.get("events", phosg::JSON::list()).as_list().size();

  const auto& canonical_team_state = response.get("canonical_team_state", phosg::JSON::dict());
  if (!canonical_team_state.as_dict().empty()) {
    apply_canonical_team_state(canonical_team_state);
  }

  {
    std::lock_guard<std::mutex> g(exchange_state_mutex);

    bool cursor_regressed = exchange_state.bootstrapped && (next_cursor < exchange_state.cursor);
    bool ack_regressed = exchange_state.bootstrapped && (exchange_state.next_seq > 1) && (ack_max_seq < (exchange_state.next_seq - 1));
    if (cursor_regressed || ack_regressed) {
      std::fprintf(stderr,
          "[TeamSync] warning exchange_state_reset_detected source=%s team_namespace=%s old_cursor=%llu new_cursor=%llu old_next_seq=%llu ack_max_seq=%llu\n",
          source_label(cfg).c_str(),
          cfg.team_namespace.c_str(),
          static_cast<unsigned long long>(exchange_state.cursor),
          static_cast<unsigned long long>(next_cursor),
          static_cast<unsigned long long>(exchange_state.next_seq),
          static_cast<unsigned long long>(ack_max_seq));
      for (auto& ev : outbound_events) {
        ev.seq = 0;
      }
      exchange_state = ExchangeState();
      co_return;
    }

    if (!exchange_state.bootstrapped) {
      exchange_state.next_seq = ack_max_seq + 1;
      exchange_state.bootstrapped = true;
      std::fprintf(stderr,
          "[TeamSync] exchange bootstrap source=%s team_namespace=%s ack_max_seq=%llu next_seq=%llu cursor=%llu\n",
          source_label(cfg).c_str(),
          cfg.team_namespace.c_str(),
          static_cast<unsigned long long>(ack_max_seq),
          static_cast<unsigned long long>(exchange_state.next_seq),
          static_cast<unsigned long long>(next_cursor));
    }
    while (!outbound_events.empty() && outbound_events.front().seq && (outbound_events.front().seq <= ack_max_seq)) {
      outbound_events.pop_front();
    }

    exchange_state.cursor = next_cursor;
    exchange_state.consecutive_failures = 0;
  }

  if (inbound_events || truncated) {
    std::fprintf(stderr,
        "[TeamSync] exchange received source=%s team_namespace=%s inbound_events=%zu truncated=%s cursor=%llu\n",
        source_label(cfg).c_str(),
        cfg.team_namespace.c_str(),
        inbound_events,
        truncated ? "true" : "false",
        static_cast<unsigned long long>(next_cursor));
  }

  co_return;
}


asio::awaitable<bool> exchange_once_now() {
  auto cfg = get_config();
  if (!exchange_enabled(cfg) || cfg.coordinator_url.empty()) {
    co_return false;
  }

  try {
    bool was_bootstrapped = get_exchange_state().bootstrapped;
    co_await run_empty_exchange_once(cfg);

    // First exchange after startup only bootstraps cursor/seq. Run once more so
    // newly queued team_create events are actually sent before the client gets
    // success.
    if (!was_bootstrapped) {
      co_await run_empty_exchange_once(cfg);
    }

    co_return true;

  } catch (const std::exception& e) {
    std::fprintf(stderr,
        "[TeamSync] warning exchange_once_failed source=%s team_namespace=%s error=%s\n",
        source_label(cfg).c_str(),
        cfg.team_namespace.c_str(),
        e.what());
    co_return false;
  }
}


static asio::awaitable<void> exchange_task() {
  for (;;) {
    auto cfg = get_config();

    if (!exchange_enabled(cfg)) {
      co_await async_sleep(std::chrono::seconds(5));
      continue;
    }

    if (cfg.coordinator_url.empty()) {
      std::fprintf(stderr,
          "[TeamSync] warning exchange_skipped reason=coordinator_url_not_configured source=%s team_namespace=%s\n",
          source_label(cfg).c_str(),
          cfg.team_namespace.c_str());
      co_await async_sleep(std::chrono::microseconds(exchange_sleep_usecs(cfg, 1)));
      continue;
    }

    try {
      co_await run_empty_exchange_once(cfg);

    } catch (const std::exception& e) {
      uint64_t failures = 0;
      {
        std::lock_guard<std::mutex> g(exchange_state_mutex);
        exchange_state.consecutive_failures++;
        failures = exchange_state.consecutive_failures;
      }

      std::fprintf(stderr,
          "[TeamSync] warning exchange_failed source=%s team_namespace=%s failures=%llu error=%s\n",
          source_label(cfg).c_str(),
          cfg.team_namespace.c_str(),
          static_cast<unsigned long long>(failures),
          e.what());
    }

    co_await async_sleep(std::chrono::microseconds(exchange_sleep_usecs(cfg, get_exchange_state().consecutive_failures)));
  }
}

void start_exchange_task(asio::io_context& io_context) {
  bool expected = false;
  if (!exchange_task_started.compare_exchange_strong(expected, true)) {
    return;
  }

  asio::co_spawn(io_context, exchange_task(), asio::detached);
  std::fprintf(stderr, "[TeamSync] exchange task started\n");
}

} // namespace TeamSync
