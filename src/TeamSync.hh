#pragma once

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
bool relay_team_actions_enabled();

void enqueue_team_create(const std::string& team_name, uint32_t creator_account_id, const std::string& creator_name);

using CanonicalTeamStateCallback = std::function<void(const phosg::JSON&)>;
void set_canonical_team_state_callback(CanonicalTeamStateCallback cb);

void start_exchange_task(asio::io_context& io_context);

} // namespace TeamSync
