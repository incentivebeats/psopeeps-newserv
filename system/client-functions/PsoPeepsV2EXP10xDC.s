.meta visibility="menu"
.meta key="PsoPeepsV2EXP10xDC"
.meta name="V2 10x"
.meta description="Dreamcast V2 EXP"

.versions 2OEF

entry_ptr:
reloc0:
  .offsetof start

start:
  # Active DC V2 online EXP table copy.
  # Index 2 sentinels observed:
  # Normal    0x0005
  # Hard      0x002A
  # Very Hard 0x005A
  # Ultimate  0x0104
  #
  # This patch is idempotent:
  # - base table => multiply by 10
  # - 5x table   => multiply by 2
  # - 10x table  => do nothing

  mova    r0, [active_table_addr]
  mov.l   r8, [r0]

  # r9 = sentinel at index 2: active_table + (2 * 0x24)
  mov     r12, r8
  add     r12, 0x48
  mov.w   r9, [r12]
  mova    r0, [factor_table]
  mov     r10, r0
  mov     r11, 8

find_factor:
  mov.w   r0, [r10]
  cmpeq   r0, r9
  bt      factor_found
  add     r10, 4
  dt      r11
  bf      find_factor
  rets
  nop

factor_found:
  mov.w   r9, [r10 + 2]

  # r10 = 212 entries
  mov     r10, 0x0D
  shl     r10, 4
  add     r10, 4

  # r11 = stride
  mov     r11, 0x24

multiply_loop:
  mov.w   r0, [r8]
  mulu.w  r9, r0
  sts     macl, r0
  mov.w   [r8], r0
  add     r8, r11
  dt      r10
  bf      multiply_loop
  rets
  nop

  .align 4

active_table_addr:
  .data   0x8CD313DC

factor_table:
  # base -> 10x
  .binary 05000a00
  .binary 2a000a00
  .binary 5a000a00
  .binary 04010a00

  # 5x -> 10x
  .binary 19000200
  .binary d2000200
  .binary c2010200
  .binary 14050200
