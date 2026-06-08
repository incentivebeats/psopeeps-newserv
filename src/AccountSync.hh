#pragma once

#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <string>

namespace AccountSync {

inline void notify_account_saved(uint32_t account_id, const std::string& filename) {
  std::fprintf(stderr,
      "[AccountSync] event=account_saved account_id=%010u filename=%s\n",
      static_cast<unsigned int>(account_id),
      filename.c_str());
}

inline void notify_backup_saved(uint32_t account_id, size_t slot, const std::string& filename) {
  std::fprintf(stderr,
      "[AccountSync] event=backup_saved account_id=%010u slot=%zu filename=%s\n",
      static_cast<unsigned int>(account_id),
      slot,
      filename.c_str());
}

inline void notify_player_state_saved(
    const char* reason,
    uint32_t account_id,
    const std::string& bb_username,
    const std::string& filename) {
  std::fprintf(stderr,
      "[AccountSync] event=player_state_saved reason=%s account_id=%010u bb_username=%s filename=%s\n",
      reason,
      static_cast<unsigned int>(account_id),
      bb_username.c_str(),
      filename.c_str());
}

} // namespace AccountSync
