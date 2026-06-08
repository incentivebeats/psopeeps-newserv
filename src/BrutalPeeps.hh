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
    {1, 100, 1.10f, 1.10f, 1.001},
    {2, 110, 1.15f, 1.15f, 1.002},
    {3, 120, 1.20f, 1.20f, 1.005},
    {4, 130, 1.30f, 1.30f, 1.006},
    {5, 140, 1.40f, 1.40f, 1.008},
    {6, 150, 1.50f, 1.50f, 1.009},
    {7, 160, 1.75f, 1.75f, 1.010},
    {8, 170, 2.00f, 2.00f, 1.020},
    {9, 180, 2.50f, 2.50f, 1.030},
    {10, 190, 3.00f, 3.00f, 1.040},
    {11, 200, 1.00f, 4.00f, 1.050},
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
