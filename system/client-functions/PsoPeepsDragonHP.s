.meta visibility="menu"
.meta key="PsoPeepsDragonHP"
.meta name="PSO Peeps Dragon HP"
.meta description="Sets Normal Dragon HP\nto 1800 for V2 crossplay"

.versions 3OE2 3OP0

entry_ptr:
reloc0:
  .offsetof start

start:
  .include  WriteCodeBlocks

  # GC Plus USA / 3OE2
  # BattleParamEntry_on.dat loaded Normal Dragon row at 0x811ABA48 on 3OE2; testing 0x811A9828 on 3OP0
  # HP field is row + 0x06 = 0x811ABA4E on 3OE2; testing 0x811A982E on 3OP0
  # 2500 = 09 C4; 1800 = 07 08
  .data     <VERS 0x811ABA4E 0x811A982E>
  .data     2
  .binary   0708

  .data     0
  .data     0
