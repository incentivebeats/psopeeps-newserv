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
  # Idempotent:
  # - base table => multiply by 10
  # - 5x table   => multiply by 2
  # - 10x table  => do nothing

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
  add     r6, 2
  mov.w   r5, [r6]

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
