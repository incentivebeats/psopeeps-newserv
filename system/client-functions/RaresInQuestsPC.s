.meta visibility="all"
.meta name="Rares in quests PC"
.meta description="PC-only test patch.\nDisables logic that\nprevents items\nabove 8 stars and\nrares from dropping\nin quests."


entry_ptr:
reloc0:
  .offsetof start
start:
  .include  WriteCodeBlocks



  .versions 2OJW

  .data     0x004DFC9A
  .data     2
  nop
  nop

  .data     0x004E03F4
  .data     2
  nop
  nop



  .all_versions

  .data     0x00000000
  .data     0x00000000
