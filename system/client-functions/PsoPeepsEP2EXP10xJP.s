.meta visibility="menu"
.meta key="PsoPeepsEP2EXP10xJP"
.meta name="EP2 10x"
.meta description="Sets EP2 enemy EXP\nto 10x for GC crossplay"

.versions 3OJ5

entry_ptr:
reloc0:
  .offsetof start

start:
  .include  WriteCodeBlocks

  # PSO Peeps GC Plus USA / 3OE2
  # Source table: BattleParamEntry_lab_on.dat
  # Active online battle-param table loaded at 0x811AB7C0
  # EXP field offset within each 0x24-byte row is +0x1C
  # Generated from clean BattleParamEntry_lab_on.dat; multiplier=10x

  .data     0x811AF31C
  .data     4
  .binary   0000000a

  .data     0x811AF340
  .data     4
  .binary   0000003c

  .data     0x811AF364
  .data     4
  .binary   00000064

  .data     0x811AF388
  .data     4
  .binary   00000078

  .data     0x811AF3AC
  .data     4
  .binary   00000064

  .data     0x811AF3D0
  .data     4
  .binary   000005dc

  .data     0x811AF3F4
  .data     4
  .binary   000000be

  .data     0x811AF418
  .data     4
  .binary   00000064

  .data     0x811AF43C
  .data     4
  .binary   000000a0

  .data     0x811AF460
  .data     4
  .binary   000000aa

  .data     0x811AF484
  .data     4
  .binary   000000aa

  .data     0x811AF4A8
  .data     4
  .binary   00000014

  .data     0x811AF4CC
  .data     4
  .binary   00000014

  .data     0x811AF4F0
  .data     4
  .binary   00000190

  .data     0x811AF514
  .data     4
  .binary   00000096

  .data     0x811AF538
  .data     4
  .binary   000012c0

  .data     0x811AF55C
  .data     4
  .binary   00000064

  .data     0x811AF580
  .data     4
  .binary   0000001e

  .data     0x811AF5A4
  .data     4
  .binary   0000251c

  .data     0x811AF5C8
  .data     4
  .binary   000000d2

  .data     0x811AF67C
  .data     4
  .binary   00000028

  .data     0x811AF6A0
  .data     4
  .binary   00000a00

  .data     0x811AF6C4
  .data     4
  .binary   000001fe

  .data     0x811AF6E8
  .data     4
  .binary   00000014

  .data     0x811AF70C
  .data     4
  .binary   0000006e

  .data     0x811AF730
  .data     4
  .binary   000000be

  .data     0x811AF754
  .data     4
  .binary   00003a98

  .data     0x811AF808
  .data     4
  .binary   00000550

  .data     0x811AF850
  .data     4
  .binary   000001ea

  .data     0x811AF874
  .data     4
  .binary   000001c2

  .data     0x811AF94C
  .data     4
  .binary   000080e8

  .data     0x811AF9DC
  .data     4
  .binary   00000122

  .data     0x811AFA00
  .data     4
  .binary   0000001e

  .data     0x811AFA24
  .data     4
  .binary   00000046

  .data     0x811AFA48
  .data     4
  .binary   00000050

  .data     0x811AFB44
  .data     4
  .binary   000001d6

  .data     0x811AFB68
  .data     4
  .binary   00000078

  .data     0x811AFB8C
  .data     4
  .binary   00000096

  .data     0x811AFBB0
  .data     4
  .binary   00000208

  .data     0x811AFC1C
  .data     4
  .binary   0000012c

  .data     0x811AFC40
  .data     4
  .binary   00000078

  .data     0x811AFC64
  .data     4
  .binary   00000014

  .data     0x811AFC88
  .data     4
  .binary   00000140

  .data     0x811AFCAC
  .data     4
  .binary   00000190

  .data     0x811AFCD0
  .data     4
  .binary   000001f4

  .data     0x811AFCF4
  .data     4
  .binary   00000226

  .data     0x811AFD60
  .data     4
  .binary   00000064

  .data     0x811AFD84
  .data     4
  .binary   000003e8

  .data     0x811AFDA8
  .data     4
  .binary   0000006e

  .data     0x811AFDCC
  .data     4
  .binary   00000082

  .data     0x811AFDF0
  .data     4
  .binary   00000046

  .data     0x811AFE14
  .data     4
  .binary   00000078

  .data     0x811AFE38
  .data     4
  .binary   000000b4

  .data     0x811AFE5C
  .data     4
  .binary   000000d2

  .data     0x811AFE80
  .data     4
  .binary   0000008c

  .data     0x811AFEA4
  .data     4
  .binary   00000096

  .data     0x811AFEC8
  .data     4
  .binary   0000003c

  .data     0x811AFEEC
  .data     4
  .binary   00000046

  .data     0x811AFF10
  .data     4
  .binary   00000050

  .data     0x811B009C
  .data     4
  .binary   00000172

  .data     0x811B00C0
  .data     4
  .binary   000001c2

  .data     0x811B00E4
  .data     4
  .binary   00000208

  .data     0x811B0108
  .data     4
  .binary   00000226

  .data     0x811B012C
  .data     4
  .binary   00000208

  .data     0x811B0150
  .data     4
  .binary   00000b0e

  .data     0x811B0174
  .data     4
  .binary   00000294

  .data     0x811B0198
  .data     4
  .binary   00000208

  .data     0x811B01BC
  .data     4
  .binary   00000244

  .data     0x811B01E0
  .data     4
  .binary   00000258

  .data     0x811B0204
  .data     4
  .binary   00000276

  .data     0x811B0228
  .data     4
  .binary   0000017c

  .data     0x811B024C
  .data     4
  .binary   0000017c

  .data     0x811B0270
  .data     4
  .binary   000003f2

  .data     0x811B0294
  .data     4
  .binary   00000258

  .data     0x811B02B8
  .data     4
  .binary   00007d00

  .data     0x811B02DC
  .data     4
  .binary   000000fa

  .data     0x811B0300
  .data     4
  .binary   00000028

  .data     0x811B0324
  .data     4
  .binary   00009858

  .data     0x811B0348
  .data     4
  .binary   00000294

  .data     0x811B03FC
  .data     4
  .binary   000001a4

  .data     0x811B0420
  .data     4
  .binary   00001400

  .data     0x811B0444
  .data     4
  .binary   000004a6

  .data     0x811B0468
  .data     4
  .binary   00000064

  .data     0x811B048C
  .data     4
  .binary   00000212

  .data     0x811B04B0
  .data     4
  .binary   00000294

  .data     0x811B04D4
  .data     4
  .binary   0000afc8

  .data     0x811B0588
  .data     4
  .binary   00000a1e

  .data     0x811B05D0
  .data     4
  .binary   00000488

  .data     0x811B05F4
  .data     4
  .binary   00000442

  .data     0x811B06CC
  .data     4
  .binary   00012cc8

  .data     0x811B075C
  .data     4
  .binary   0000033e

  .data     0x811B0780
  .data     4
  .binary   000001d6

  .data     0x811B07A4
  .data     4
  .binary   000001d6

  .data     0x811B07C8
  .data     4
  .binary   000001e0

  .data     0x811B08C4
  .data     4
  .binary   0000046a

  .data     0x811B08E8
  .data     4
  .binary   00000226

  .data     0x811B090C
  .data     4
  .binary   00000258

  .data     0x811B0930
  .data     4
  .binary   000004ba

  .data     0x811B099C
  .data     4
  .binary   00000352

  .data     0x811B09C0
  .data     4
  .binary   00000226

  .data     0x811B09E4
  .data     4
  .binary   000001c2

  .data     0x811B0A08
  .data     4
  .binary   00000370

  .data     0x811B0A2C
  .data     4
  .binary   000003f2

  .data     0x811B0A50
  .data     4
  .binary   0000049c

  .data     0x811B0A74
  .data     4
  .binary   000004ec

  .data     0x811B0ABC
  .data     4
  .binary   00000032

  .data     0x811B0AE0
  .data     4
  .binary   00000208

  .data     0x811B0B04
  .data     4
  .binary   000007d0

  .data     0x811B0B28
  .data     4
  .binary   00000212

  .data     0x811B0B4C
  .data     4
  .binary   00000230

  .data     0x811B0B70
  .data     4
  .binary   000001c2

  .data     0x811B0B94
  .data     4
  .binary   00000226

  .data     0x811B0BB8
  .data     4
  .binary   0000028a

  .data     0x811B0BDC
  .data     4
  .binary   000002bc

  .data     0x811B0C00
  .data     4
  .binary   00000226

  .data     0x811B0C24
  .data     4
  .binary   00000258

  .data     0x811B0C48
  .data     4
  .binary   000001c2

  .data     0x811B0C6C
  .data     4
  .binary   000001d6

  .data     0x811B0C90
  .data     4
  .binary   000001e0

  .data     0x811B0E1C
  .data     4
  .binary   00000366

  .data     0x811B0E40
  .data     4
  .binary   000003ca

  .data     0x811B0E64
  .data     4
  .binary   0000041a

  .data     0x811B0E88
  .data     4
  .binary   00000442

  .data     0x811B0EAC
  .data     4
  .binary   0000041a

  .data     0x811B0ED0
  .data     4
  .binary   00000f0a

  .data     0x811B0EF4
  .data     4
  .binary   0000047e

  .data     0x811B0F18
  .data     4
  .binary   0000041a

  .data     0x811B0F3C
  .data     4
  .binary   00000460

  .data     0x811B0F60
  .data     4
  .binary   00000474

  .data     0x811B0F84
  .data     4
  .binary   000004a6

  .data     0x811B0FA8
  .data     4
  .binary   0000037a

  .data     0x811B0FCC
  .data     4
  .binary   0000037a

  .data     0x811B0FF0
  .data     4
  .binary   00000672

  .data     0x811B1014
  .data     4
  .binary   0000047e

  .data     0x811B1038
  .data     4
  .binary   000157c0

  .data     0x811B105C
  .data     4
  .binary   00000258

  .data     0x811B1080
  .data     4
  .binary   00000258

  .data     0x811B10A4
  .data     4
  .binary   000186a0

  .data     0x811B10C8
  .data     4
  .binary   000004ce

  .data     0x811B117C
  .data     4
  .binary   000003a2

  .data     0x811B11A0
  .data     4
  .binary   00001d88

  .data     0x811B11C4
  .data     4
  .binary   0000074e

  .data     0x811B11E8
  .data     4
  .binary   0000012c

  .data     0x811B120C
  .data     4
  .binary   0000042e

  .data     0x811B1230
  .data     4
  .binary   000004ce

  .data     0x811B1254
  .data     4
  .binary   0001e848

  .data     0x811B1308
  .data     4
  .binary   00000df2

  .data     0x811B1350
  .data     4
  .binary   00000726

  .data     0x811B1374
  .data     4
  .binary   000006d6

  .data     0x811B144C
  .data     4
  .binary   000249f0

  .data     0x811B14DC
  .data     4
  .binary   00000596

  .data     0x811B1500
  .data     4
  .binary   0000038e

  .data     0x811B1524
  .data     4
  .binary   000003de

  .data     0x811B1548
  .data     4
  .binary   000003f2

  .data     0x811B1644
  .data     4
  .binary   000006fe

  .data     0x811B1668
  .data     4
  .binary   00000442

  .data     0x811B168C
  .data     4
  .binary   0000047e

  .data     0x811B16B0
  .data     4
  .binary   00000762

  .data     0x811B171C
  .data     4
  .binary   000005aa

  .data     0x811B1740
  .data     4
  .binary   00000442

  .data     0x811B1764
  .data     4
  .binary   000003b6

  .data     0x811B1788
  .data     4
  .binary   000005d2

  .data     0x811B17AC
  .data     4
  .binary   00000672

  .data     0x811B17D0
  .data     4
  .binary   0000073a

  .data     0x811B17F4
  .data     4
  .binary   0000079e

  .data     0x811B183C
  .data     4
  .binary   00000032

  .data     0x811B1860
  .data     4
  .binary   0000041a

  .data     0x811B1884
  .data     4
  .binary   00000b22

  .data     0x811B18A8
  .data     4
  .binary   0000042e

  .data     0x811B18CC
  .data     4
  .binary   00000456

  .data     0x811B18F0
  .data     4
  .binary   000003ac

  .data     0x811B1914
  .data     4
  .binary   00000442

  .data     0x811B1938
  .data     4
  .binary   000004ba

  .data     0x811B195C
  .data     4
  .binary   000004f6

  .data     0x811B1980
  .data     4
  .binary   00000438

  .data     0x811B19A4
  .data     4
  .binary   0000047e

  .data     0x811B19C8
  .data     4
  .binary   000003ca

  .data     0x811B19EC
  .data     4
  .binary   000003de

  .data     0x811B1A10
  .data     4
  .binary   000003f2

  .data     0x811B1B9C
  .data     4
  .binary   000005dc

  .data     0x811B1BC0
  .data     4
  .binary   00000bf4

  .data     0x811B1BE4
  .data     4
  .binary   00000ce4

  .data     0x811B1C08
  .data     4
  .binary   00000d5c

  .data     0x811B1C2C
  .data     4
  .binary   00000ce4

  .data     0x811B1C50
  .data     4
  .binary   00002db4

  .data     0x811B1C74
  .data     4
  .binary   00000e10

  .data     0x811B1C98
  .data     4
  .binary   00000ce4

  .data     0x811B1CBC
  .data     4
  .binary   00000be0

  .data     0x811B1CE0
  .data     4
  .binary   00000c08

  .data     0x811B1D04
  .data     4
  .binary   00000e88

  .data     0x811B1D28
  .data     4
  .binary   000003e8

  .data     0x811B1D4C
  .data     4
  .binary   000003e8

  .data     0x811B1D70
  .data     4
  .binary   000013ec

  .data     0x811B1D94
  .data     4
  .binary   00000e10

  .data     0x811B1DB8
  .data     4
  .binary   0002bf20

  .data     0x811B1DDC
  .data     4
  .binary   00000258

  .data     0x811B1E00
  .data     4
  .binary   000000a0

  .data     0x811B1E24
  .data     4
  .binary   00033450

  .data     0x811B1E48
  .data     4
  .binary   00000f00

  .data     0x811B1EFC
  .data     4
  .binary   00000b7c

  .data     0x811B1F20
  .data     4
  .binary   00002800

  .data     0x811B1F44
  .data     4
  .binary   00001680

  .data     0x811B1F68
  .data     4
  .binary   000001f4

  .data     0x811B1F8C
  .data     4
  .binary   00000d20

  .data     0x811B1FB0
  .data     4
  .binary   00000f00

  .data     0x811B1FD4
  .data     4
  .binary   0003c4d8

  .data     0x811B2088
  .data     4
  .binary   00002a6c

  .data     0x811B20D0
  .data     4
  .binary   00001608

  .data     0x811B20F4
  .data     4
  .binary   00001518

  .data     0x811B21CC
  .data     4
  .binary   00073f78

  .data     0x811B225C
  .data     4
  .binary   00001158

  .data     0x811B2280
  .data     4
  .binary   00000c30

  .data     0x811B22A4
  .data     4
  .binary   00000c30

  .data     0x811B22C8
  .data     4
  .binary   00000c6c

  .data     0x811B23C4
  .data     4
  .binary   00000d98

  .data     0x811B23E8
  .data     4
  .binary   00000d5c

  .data     0x811B240C
  .data     4
  .binary   00000e10

  .data     0x811B2430
  .data     4
  .binary   000016bc

  .data     0x811B249C
  .data     4
  .binary   00001194

  .data     0x811B24C0
  .data     4
  .binary   00000d5c

  .data     0x811B24E4
  .data     4
  .binary   000007d0

  .data     0x811B2508
  .data     4
  .binary   0000120c

  .data     0x811B252C
  .data     4
  .binary   000013ec

  .data     0x811B2550
  .data     4
  .binary   00001644

  .data     0x811B2574
  .data     4
  .binary   00001770

  .data     0x811B25BC
  .data     4
  .binary   00000032

  .data     0x811B25E0
  .data     4
  .binary   00000ce4

  .data     0x811B2604
  .data     4
  .binary   000021fc

  .data     0x811B2628
  .data     4
  .binary   00000d20

  .data     0x811B264C
  .data     4
  .binary   00000d98

  .data     0x811B2670
  .data     4
  .binary   00000a78

  .data     0x811B2694
  .data     4
  .binary   00000d5c

  .data     0x811B26B8
  .data     4
  .binary   00000ec4

  .data     0x811B26DC
  .data     4
  .binary   00000f78

  .data     0x811B2700
  .data     4
  .binary   00000b90

  .data     0x811B2724
  .data     4
  .binary   00000e10

  .data     0x811B2748
  .data     4
  .binary   00000bf4

  .data     0x811B276C
  .data     4
  .binary   00000c30

  .data     0x811B2790
  .data     4
  .binary   00000c6c

  .data     0
  .data     0
