#include "AccountSync.hh"

#include <chrono>
#include <cstdio>
#include <filesystem>
#include <format>
#include <fstream>
#include <mutex>
#include <stdexcept>
#include <string>

namespace AccountSync {

static std::mutex config_mutex;
static std::mutex spool_mutex;
static Config current_config;

static uint64_t now_usecs() {
  using namespace std::chrono;
  return duration_cast<microseconds>(system_clock::now().time_since_epoch()).count();
}

static Config get_config() {
  std::lock_guard<std::mutex> g(config_mutex);
  return current_config;
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
  cfg.notify_bb_sessions = json.get_bool("NotifyBBSessions", cfg.enable_login_locks);
  cfg.spool_directory = json.get_string("SpoolDirectory", "system/account-sync-spool");
  configure(cfg);
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
