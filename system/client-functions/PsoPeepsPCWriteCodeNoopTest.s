.meta visibility="all"
.meta name="PC data noop"
.meta description="PC-only test.\nWrites zeros over\nwritable data."

entry_ptr:
reloc0:
  .offsetof start
start:
  .include  WriteCodeBlocks



  .versions 2OJW

  .data     0x0068854E
  .data     2
  add      [eax], al



  .all_versions

  .data     0x00000000
  .data     0x00000000
