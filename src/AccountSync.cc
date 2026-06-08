#include "AccountSync.hh"

#include <cstdio>
#include <mutex>

namespace AccountSync {

static std::mutex config_mutex;
static Config current_config;

static Config get_config() {
  std::lock_guard<std::mutex> g(config_mutex);
  return current_config;
}

void configure(const Config& cfg) {
  {
    std::lock_guard<std::mutex> g(config_mutex);
    current_config = cfg;
  }

  if (cfg.enabled) {
    std::fprintf(stderr,
        "[AccountSync] config enabled region=%s coordinator_url=%s login_locks=%s\n",
        cfg.region.c_str(),
        cfg.coordinator_url.c_str(),
        cfg.enable_login_locks ? "true" : "false");
  }
}

void configure_from_json(const phosg::JSON& json) {
  Config cfg;
  cfg.enabled = json.get_bool("Enabled", false);
  cfg.region = json.get_string("Region", "");
  cfg.coordinator_url = json.get_string("CoordinatorURL", "");
  cfg.shared_secret = json.get_string("SharedSecret", "");
  cfg.request_timeout_usecs = json.get_int("RequestTimeoutUsecs", 3000000);
  cfg.fail_open = json.get_bool("FailOpen", false);
  cfg.notify_account_saves = json.get_bool("NotifyAccountSaves", true);
  cfg.notify_player_saves = json.get_bool("NotifyPlayerSaves", true);
  cfg.notify_backup_saves = json.get_bool("NotifyBackupSaves", true);
  cfg.enable_login_locks = json.get_bool("EnableLoginLocks", false);
  configure(cfg);
}

void notify_account_saved(uint32_t account_id, const std::string& filename) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.notify_account_saves) {
    return;
  }
  std::fprintf(stderr,
      "[AccountSync] event=account_saved region=%s account_id=%010u filename=%s\n",
      cfg.region.c_str(),
      static_cast<unsigned int>(account_id),
      filename.c_str());
}

void notify_backup_saved(uint32_t account_id, size_t slot, const std::string& filename) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.notify_backup_saves) {
    return;
  }
  std::fprintf(stderr,
      "[AccountSync] event=backup_saved region=%s account_id=%010u slot=%zu filename=%s\n",
      cfg.region.c_str(),
      static_cast<unsigned int>(account_id),
      slot,
      filename.c_str());
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
      "[AccountSync] event=player_state_saved region=%s reason=%s account_id=%010u bb_username=%s filename=%s\n",
      cfg.region.c_str(),
      reason,
      static_cast<unsigned int>(account_id),
      bb_username.c_str(),
      filename.c_str());
}

void notify_bb_login_start(
    uint32_t account_id,
    const std::string& bb_username,
    int64_t character_slot,
    uint8_t connection_phase) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.enable_login_locks) {
    return;
  }
  std::fprintf(stderr,
      "[AccountSync] event=bb_login_start region=%s account_id=%010u bb_username=%s character_slot=%lld connection_phase=%u\n",
      cfg.region.c_str(),
      static_cast<unsigned int>(account_id),
      bb_username.c_str(),
      static_cast<long long>(character_slot),
      static_cast<unsigned int>(connection_phase));
}

void notify_bb_login_end(
    uint32_t account_id,
    const std::string& bb_username,
    int64_t character_slot) {
  auto cfg = get_config();
  if (!cfg.enabled || !cfg.enable_login_locks) {
    return;
  }
  std::fprintf(stderr,
      "[AccountSync] event=bb_login_end region=%s account_id=%010u bb_username=%s character_slot=%lld\n",
      cfg.region.c_str(),
      static_cast<unsigned int>(account_id),
      bb_username.c_str(),
      static_cast<long long>(character_slot));
}

} // namespace AccountSync
