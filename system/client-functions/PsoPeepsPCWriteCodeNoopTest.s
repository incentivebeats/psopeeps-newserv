.meta visibility="all"
.meta name="PC text noop"
.meta description="PC-only test.\nWrites NOPs over\nexisting code NOPs."

entry_ptr:
reloc0:
  .offsetof start
start:
  .include  WriteCodeBlocks



  .versions 2OJW

  .data     0x004E03DE
  .data     2
  nop
  nop



  .all_versions

  .data     0x00000000
  .data     0x00000000
