#include "TeamSync.hh"

#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <mutex>
#include <stdexcept>

namespace TeamSync {

static std::mutex config_mutex;
static Config current_config;

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

void configure(const Config& cfg) {
  {
    std::lock_guard<std::mutex> g(config_mutex);
    current_config = cfg;
  }

  if (cfg.enabled) {
    std::fprintf(stderr,
        "[TeamSync] config enabled source=%s source_region=%s source_ship=%s coordinator_url=%s relay_team_chat=%s relay_team_points=%s relay_team_actions=%s\n",
        source_label(cfg).c_str(),
        cfg.source_region.c_str(),
        cfg.source_ship.c_str(),
        cfg.coordinator_url.c_str(),
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

  cfg.coordinator_url = json.get_string("CoordinatorURL", "");
  cfg.shared_secret = json.get_string("SharedSecret", "");

  int64_t request_timeout_usecs = json.get_int("RequestTimeoutUsecs", 3000000);
  if (request_timeout_usecs < 100000) {
    request_timeout_usecs = 100000;
  } else if (request_timeout_usecs > 30000000) {
    request_timeout_usecs = 30000000;
  }
  cfg.request_timeout_usecs = static_cast<uint64_t>(request_timeout_usecs);

  cfg.relay_team_chat = json.get_bool("RelayTeamChat", false);
  cfg.relay_team_points = json.get_bool("RelayTeamPoints", false);
  cfg.relay_team_actions = json.get_bool("RelayTeamActions", false);

  if (cfg.enabled && (cfg.source_region.empty() || cfg.source_ship.empty())) {
    throw std::runtime_error("TeamSync requires SourceRegion and SourceShip, or Source/Region in region-ship form");
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

} // namespace TeamSync
