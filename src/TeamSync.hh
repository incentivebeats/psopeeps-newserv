#pragma once

#include <cstddef>
#include <cstdint>
#include <functional>
#include <string>

#include <asio.hpp>
#include <phosg/JSON.hh>

namespace TeamSync {

struct Config {
  bool enabled = false;

  std::string source;
  std::string source_region;
  std::string source_ship;
  std::string team_namespace = "bb";

  std::string coordinator_url;
  std::string shared_secret;
  uint64_t request_timeout_usecs = 3000000;
  uint64_t exchange_interval_usecs = 1500000;

  bool relay_team_chat = false;
  bool relay_team_points = false;
  bool relay_team_actions = false;
};

void configure(const Config& cfg);
void configure_from_json(const phosg::JSON& json);

bool enabled();
bool relay_team_chat_enabled();
bool relay_team_points_enabled();
bool relay_team_actions_enabled();

bool enqueue_team_create(const std::string& team_name, uint32_t creator_account_id, const std::string& creator_name);
bool enqueue_team_member_add(uint32_t team_id, uint32_t account_id, const std::string& name);
bool enqueue_team_member_update(uint32_t account_id, const std::string& name, int64_t points_delta);
bool enqueue_team_member_remove(uint32_t account_id);
bool enqueue_team_rename(uint32_t team_id, const std::string& new_name);
bool enqueue_team_disband(uint32_t team_id);
bool enqueue_team_member_flags_update(uint32_t account_id, uint8_t flags);
bool enqueue_team_master_transfer(uint32_t master_account_id, uint32_t new_master_account_id);
bool enqueue_team_reward_purchase(uint32_t team_id, const std::string& key, uint32_t points, uint32_t reward_flag);
bool enqueue_team_flag_update(uint32_t team_id, const void* flag_data, size_t size);
asio::awaitable<bool> exchange_once_now();

using CanonicalTeamStateCallback = std::function<void(const phosg::JSON&)>;
void set_canonical_team_state_callback(CanonicalTeamStateCallback cb);

void start_exchange_task(asio::io_context& io_context);

} // namespace TeamSync
