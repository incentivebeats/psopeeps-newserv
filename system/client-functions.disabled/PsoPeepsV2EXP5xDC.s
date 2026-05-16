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
  # - 10x table  => halve into 5x
  # - 5x table   => do nothing

  mova    r0, [active_table_addr]
  mov.l   r4, [r0]

  # r5 = sentinel at index 2: active_table + (2 * 0x24)
  mov     r5, r4
  add     r5, 0x48
  mov.w   r5, [r5]

  mova    r0, [factor_table]
  mov     r6, r0
  mov     r7, 8

find_factor:
  mov.w   r0, [r6]
  cmpeq   r0, r5
  bt      factor_found
  add     r6, 4
  add     r7, -1
  cmpgt   r7, 0
  bt      find_factor
  rets
  nop

factor_found:
  mov.w   r5, [r6 + 2]
  test    r5, r5
  bt      halve_table

  # r7 = 212 entries
  mov     r7, 0x0D
  shl     r7, 4
  add     r7, 4

  # r6 = stride
  mov     r6, 0x24

multiply_loop:
  mov.w   r0, [r4]
  mulu.w  r5, r0
  sts     macl, r0
  mov.w   [r4], r0
  add     r4, r6
  add     r7, -1
  cmpgt   r7, 0
  bt      multiply_loop
  rets
  nop

halve_table:
  # r7 = 212 entries
  mov     r7, 0x0D
  shl     r7, 4
  add     r7, 4

  # r6 = stride
  mov     r6, 0x24

halve_loop:
  mov.w   r0, [r4]
  shlr    r0
  mov.w   [r4], r0
  add     r4, r6
  add     r7, -1
  cmpgt   r7, 0
  bt      halve_loop
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
