#pragma once

#include <array>
#include <cstdint>

struct BrutalPeepsTierDefinition {
  int8_t tier;
  uint32_t required_level;
  float exp_multiplier;
  float enemy_hp_multiplier;
  double rare_drop_multiplier;
};

static constexpr std::array<BrutalPeepsTierDefinition, 11> BRUTAL_PEEPS_TIERS = {{
    {1, 100, 1.5f, 1.5f, 1.001},
    {2, 110, 1.7f, 1.7f, 1.002},
    {3, 120, 2.0f, 2.0f, 1.005},
    {4, 130, 2.2f, 2.2f, 1.006},
    {5, 140, 2.5f, 2.5f, 1.008},
    {6, 150, 2.7f, 2.7f, 1.009},
    {7, 160, 3.0f, 3.0f, 1.010},
    {8, 170, 4.0f, 3.5f, 1.020},
    {9, 180, 5.0f, 4.0f, 1.030},
    {10, 190, 6.0f, 4.5f, 1.040},
    {11, 200, 1.0f, 5.0f, 1.050},
}};

static inline const BrutalPeepsTierDefinition* brutal_peeps_tier_definition(int64_t tier) {
  for (const auto& def : BRUTAL_PEEPS_TIERS) {
    if (def.tier == tier) {
      return &def;
    }
  }
  return nullptr;
}

static inline int8_t max_brutal_peeps_tier_for_level(uint32_t level) {
  int8_t ret = -1;
  for (const auto& def : BRUTAL_PEEPS_TIERS) {
    if (level >= def.required_level) {
      ret = def.tier;
    }
  }
  return ret;
}
