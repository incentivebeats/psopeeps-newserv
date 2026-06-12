#pragma once

#include <cstdint>
#include <string>

#include <phosg/JSON.hh>

namespace TeamSync {

struct Config {
  bool enabled = false;

  std::string source;
  std::string source_region;
  std::string source_ship;

  std::string coordinator_url;
  std::string shared_secret;
  uint64_t request_timeout_usecs = 3000000;

  bool relay_team_chat = false;
  bool relay_team_points = false;
  bool relay_team_actions = false;
};

void configure(const Config& cfg);
void configure_from_json(const phosg::JSON& json);

bool enabled();
bool relay_team_chat_enabled();

} // namespace TeamSync
