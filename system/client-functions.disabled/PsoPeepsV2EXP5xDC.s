.meta visibility="menu"
.meta key="PsoPeepsV2EXP5xDC"
.meta name="V2 5x"
.meta description="Dreamcast V2 EXP"

.versions 2OEF

entry_ptr:
reloc0:
  .offsetof start

start:
  # Active DC V2 online EXP table copy.
  # Idempotent:
  # - base table => multiply by 5
  # - 10x table  => divide by 2
  # - 5x table   => do nothing

  mova    r0, [active_table_addr]
  mov.l   r8, [r0]

  # r9 = sentinel at index 2: active_table + (2 * 0x24)
  mov.w   r9, [r8 + 0x48]

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
  test    r9, r9
  bt      halve_table

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

halve_table:
  # r10 = 212 entries
  mov     r10, 0x0D
  shl     r10, 4
  add     r10, 4

  # r11 = stride
  mov     r11, 0x24

halve_loop:
  mov.w   r0, [r8]
  shlr    r0
  mov.w   [r8], r0
  add     r8, r11
  dt      r10
  bf      halve_loop
  rets
  nop

  .align 4

active_table_addr:
  .data   0x8CD313DC

factor_table:
  # base -> 5x
  .binary 05000500
  .binary 2a000500
  .binary 5a000500
  .binary 04010500

  # 10x -> 5x by halving
  .binary 32000000
  .binary a4010000
  .binary 84030000
  .binary 280a0000
