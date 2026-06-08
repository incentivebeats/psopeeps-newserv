#pragma once

#include <cstddef>
#include <cstdint>
#include <string>

#include <phosg/JSON.hh>

namespace AccountSync {

struct Config {
  bool enabled = false;
  std::string region;
  std::string coordinator_url;
  std::string shared_secret;
  uint64_t request_timeout_usecs = 3000000;
  bool fail_open = false;
  bool notify_account_saves = true;
  bool notify_player_saves = true;
  bool notify_backup_saves = true;
  bool enable_login_locks = false;
};

void configure(const Config& cfg);
void configure_from_json(const phosg::JSON& json);

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
