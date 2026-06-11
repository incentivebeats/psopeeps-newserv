#pragma once

#include <cstddef>
#include <cstdint>

#include <asio.hpp>
#include <string>

#include <phosg/JSON.hh>

namespace AccountSync {

struct Config {
  bool enabled = false;

  // Source identity. Region is no longer enough because account JSON is shared
  // across live/test/hardcore in a region.
  std::string source;
  std::string source_region;
  std::string source_ship;
  std::string account_store = "shared";

  std::string coordinator_url;
  std::string shared_secret;
  uint64_t request_timeout_usecs = 3000000;
  bool fail_open = false;
  bool notify_account_saves = true;
  bool notify_player_saves = true;
  bool notify_backup_saves = true;
  bool notify_bb_sessions = false;
  bool enable_login_locks = false; // Reserved for future blocking lock behavior
  std::string spool_directory = "system/account-sync-spool";
};

void configure(const Config& cfg);
void configure_from_json(const phosg::JSON& json);

struct LoginLockAcquireResult {
  bool allowed = true;
  bool fail_open_used = false;
  std::string session_nonce;
  std::string message;
  std::string holder_source;
};

asio::awaitable<LoginLockAcquireResult> acquire_login_lock(
    uint32_t account_id,
    const std::string& version_name,
    const std::string& existing_session_nonce);

void notify_login_session_end(
    uint32_t account_id,
    const std::string& session_nonce,
    const std::string& version_name);

void notify_account_saved(uint32_t account_id, const std::string& filename);
void notify_backup_saved(uint32_t account_id, size_t slot, const std::string& filename);

void notify_player_state_saved(
    const char* reason,
    uint32_t account_id,
    const std::string& bb_username,
    const std::string& filename);

void notify_bb_login_start(
    uint32_t account_id,
    const std::string& bb_username,
    int64_t character_slot,
    uint8_t connection_phase);

void notify_bb_login_end(
    uint32_t account_id,
    const std::string& bb_username,
    int64_t character_slot);

} // namespace AccountSync
