.meta visibility="menu"
.meta key="PsoPeepsEP2EXP5xJP"
.meta name="EP2 5x"
.meta description="Sets EP2 enemy EXP\nto 5x for GC crossplay"

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
  # Generated from clean BattleParamEntry_lab_on.dat; multiplier=5x

  .data     0x811AF31C
  .data     4
  .binary   00000005

  .data     0x811AF340
  .data     4
  .binary   0000001e

  .data     0x811AF364
  .data     4
  .binary   00000032

  .data     0x811AF388
  .data     4
  .binary   0000003c

  .data     0x811AF3AC
  .data     4
  .binary   00000032

  .data     0x811AF3D0
  .data     4
  .binary   000002ee

  .data     0x811AF3F4
  .data     4
  .binary   0000005f

  .data     0x811AF418
  .data     4
  .binary   00000032

  .data     0x811AF43C
  .data     4
  .binary   00000050

  .data     0x811AF460
  .data     4
  .binary   00000055

  .data     0x811AF484
  .data     4
  .binary   00000055

  .data     0x811AF4A8
  .data     4
  .binary   0000000a

  .data     0x811AF4CC
  .data     4
  .binary   0000000a

  .data     0x811AF4F0
  .data     4
  .binary   000000c8

  .data     0x811AF514
  .data     4
  .binary   0000004b

  .data     0x811AF538
  .data     4
  .binary   00000960

  .data     0x811AF55C
  .data     4
  .binary   00000032

  .data     0x811AF580
  .data     4
  .binary   0000000f

  .data     0x811AF5A4
  .data     4
  .binary   0000128e

  .data     0x811AF5C8
  .data     4
  .binary   00000069

  .data     0x811AF67C
  .data     4
  .binary   00000014

  .data     0x811AF6A0
  .data     4
  .binary   00000500

  .data     0x811AF6C4
  .data     4
  .binary   000000ff

  .data     0x811AF6E8
  .data     4
  .binary   0000000a

  .data     0x811AF70C
  .data     4
  .binary   00000037

  .data     0x811AF730
  .data     4
  .binary   0000005f

  .data     0x811AF754
  .data     4
  .binary   00001d4c

  .data     0x811AF808
  .data     4
  .binary   000002a8

  .data     0x811AF850
  .data     4
  .binary   000000f5

  .data     0x811AF874
  .data     4
  .binary   000000e1

  .data     0x811AF94C
  .data     4
  .binary   00004074

  .data     0x811AF9DC
  .data     4
  .binary   00000091

  .data     0x811AFA00
  .data     4
  .binary   0000000f

  .data     0x811AFA24
  .data     4
  .binary   00000023

  .data     0x811AFA48
  .data     4
  .binary   00000028

  .data     0x811AFB44
  .data     4
  .binary   000000eb

  .data     0x811AFB68
  .data     4
  .binary   0000003c

  .data     0x811AFB8C
  .data     4
  .binary   0000004b

  .data     0x811AFBB0
  .data     4
  .binary   00000104

  .data     0x811AFC1C
  .data     4
  .binary   00000096

  .data     0x811AFC40
  .data     4
  .binary   0000003c

  .data     0x811AFC64
  .data     4
  .binary   0000000a

  .data     0x811AFC88
  .data     4
  .binary   000000a0

  .data     0x811AFCAC
  .data     4
  .binary   000000c8

  .data     0x811AFCD0
  .data     4
  .binary   000000fa

  .data     0x811AFCF4
  .data     4
  .binary   00000113

  .data     0x811AFD60
  .data     4
  .binary   00000032

  .data     0x811AFD84
  .data     4
  .binary   000001f4

  .data     0x811AFDA8
  .data     4
  .binary   00000037

  .data     0x811AFDCC
  .data     4
  .binary   00000041

  .data     0x811AFDF0
  .data     4
  .binary   00000023

  .data     0x811AFE14
  .data     4
  .binary   0000003c

  .data     0x811AFE38
  .data     4
  .binary   0000005a

  .data     0x811AFE5C
  .data     4
  .binary   00000069

  .data     0x811AFE80
  .data     4
  .binary   00000046

  .data     0x811AFEA4
  .data     4
  .binary   0000004b

  .data     0x811AFEC8
  .data     4
  .binary   0000001e

  .data     0x811AFEEC
  .data     4
  .binary   00000023

  .data     0x811AFF10
  .data     4
  .binary   00000028

  .data     0x811B009C
  .data     4
  .binary   000000b9

  .data     0x811B00C0
  .data     4
  .binary   000000e1

  .data     0x811B00E4
  .data     4
  .binary   00000104

  .data     0x811B0108
  .data     4
  .binary   00000113

  .data     0x811B012C
  .data     4
  .binary   00000104

  .data     0x811B0150
  .data     4
  .binary   00000587

  .data     0x811B0174
  .data     4
  .binary   0000014a

  .data     0x811B0198
  .data     4
  .binary   00000104

  .data     0x811B01BC
  .data     4
  .binary   00000122

  .data     0x811B01E0
  .data     4
  .binary   0000012c

  .data     0x811B0204
  .data     4
  .binary   0000013b

  .data     0x811B0228
  .data     4
  .binary   000000be

  .data     0x811B024C
  .data     4
  .binary   000000be

  .data     0x811B0270
  .data     4
  .binary   000001f9

  .data     0x811B0294
  .data     4
  .binary   0000012c

  .data     0x811B02B8
  .data     4
  .binary   00003e80

  .data     0x811B02DC
  .data     4
  .binary   0000007d

  .data     0x811B0300
  .data     4
  .binary   00000014

  .data     0x811B0324
  .data     4
  .binary   00004c2c

  .data     0x811B0348
  .data     4
  .binary   0000014a

  .data     0x811B03FC
  .data     4
  .binary   000000d2

  .data     0x811B0420
  .data     4
  .binary   00000a00

  .data     0x811B0444
  .data     4
  .binary   00000253

  .data     0x811B0468
  .data     4
  .binary   00000032

  .data     0x811B048C
  .data     4
  .binary   00000109

  .data     0x811B04B0
  .data     4
  .binary   0000014a

  .data     0x811B04D4
  .data     4
  .binary   000057e4

  .data     0x811B0588
  .data     4
  .binary   0000050f

  .data     0x811B05D0
  .data     4
  .binary   00000244

  .data     0x811B05F4
  .data     4
  .binary   00000221

  .data     0x811B06CC
  .data     4
  .binary   00009664

  .data     0x811B075C
  .data     4
  .binary   0000019f

  .data     0x811B0780
  .data     4
  .binary   000000eb

  .data     0x811B07A4
  .data     4
  .binary   000000eb

  .data     0x811B07C8
  .data     4
  .binary   000000f0

  .data     0x811B08C4
  .data     4
  .binary   00000235

  .data     0x811B08E8
  .data     4
  .binary   00000113

  .data     0x811B090C
  .data     4
  .binary   0000012c

  .data     0x811B0930
  .data     4
  .binary   0000025d

  .data     0x811B099C
  .data     4
  .binary   000001a9

  .data     0x811B09C0
  .data     4
  .binary   00000113

  .data     0x811B09E4
  .data     4
  .binary   000000e1

  .data     0x811B0A08
  .data     4
  .binary   000001b8

  .data     0x811B0A2C
  .data     4
  .binary   000001f9

  .data     0x811B0A50
  .data     4
  .binary   0000024e

  .data     0x811B0A74
  .data     4
  .binary   00000276

  .data     0x811B0ABC
  .data     4
  .binary   00000019

  .data     0x811B0AE0
  .data     4
  .binary   00000104

  .data     0x811B0B04
  .data     4
  .binary   000003e8

  .data     0x811B0B28
  .data     4
  .binary   00000109

  .data     0x811B0B4C
  .data     4
  .binary   00000118

  .data     0x811B0B70
  .data     4
  .binary   000000e1

  .data     0x811B0B94
  .data     4
  .binary   00000113

  .data     0x811B0BB8
  .data     4
  .binary   00000145

  .data     0x811B0BDC
  .data     4
  .binary   0000015e

  .data     0x811B0C00
  .data     4
  .binary   00000113

  .data     0x811B0C24
  .data     4
  .binary   0000012c

  .data     0x811B0C48
  .data     4
  .binary   000000e1

  .data     0x811B0C6C
  .data     4
  .binary   000000eb

  .data     0x811B0C90
  .data     4
  .binary   000000f0

  .data     0x811B0E1C
  .data     4
  .binary   000001b3

  .data     0x811B0E40
  .data     4
  .binary   000001e5

  .data     0x811B0E64
  .data     4
  .binary   0000020d

  .data     0x811B0E88
  .data     4
  .binary   00000221

  .data     0x811B0EAC
  .data     4
  .binary   0000020d

  .data     0x811B0ED0
  .data     4
  .binary   00000785

  .data     0x811B0EF4
  .data     4
  .binary   0000023f

  .data     0x811B0F18
  .data     4
  .binary   0000020d

  .data     0x811B0F3C
  .data     4
  .binary   00000230

  .data     0x811B0F60
  .data     4
  .binary   0000023a

  .data     0x811B0F84
  .data     4
  .binary   00000253

  .data     0x811B0FA8
  .data     4
  .binary   000001bd

  .data     0x811B0FCC
  .data     4
  .binary   000001bd

  .data     0x811B0FF0
  .data     4
  .binary   00000339

  .data     0x811B1014
  .data     4
  .binary   0000023f

  .data     0x811B1038
  .data     4
  .binary   0000abe0

  .data     0x811B105C
  .data     4
  .binary   0000012c

  .data     0x811B1080
  .data     4
  .binary   0000012c

  .data     0x811B10A4
  .data     4
  .binary   0000c350

  .data     0x811B10C8
  .data     4
  .binary   00000267

  .data     0x811B117C
  .data     4
  .binary   000001d1

  .data     0x811B11A0
  .data     4
  .binary   00000ec4

  .data     0x811B11C4
  .data     4
  .binary   000003a7

  .data     0x811B11E8
  .data     4
  .binary   00000096

  .data     0x811B120C
  .data     4
  .binary   00000217

  .data     0x811B1230
  .data     4
  .binary   00000267

  .data     0x811B1254
  .data     4
  .binary   0000f424

  .data     0x811B1308
  .data     4
  .binary   000006f9

  .data     0x811B1350
  .data     4
  .binary   00000393

  .data     0x811B1374
  .data     4
  .binary   0000036b

  .data     0x811B144C
  .data     4
  .binary   000124f8

  .data     0x811B14DC
  .data     4
  .binary   000002cb

  .data     0x811B1500
  .data     4
  .binary   000001c7

  .data     0x811B1524
  .data     4
  .binary   000001ef

  .data     0x811B1548
  .data     4
  .binary   000001f9

  .data     0x811B1644
  .data     4
  .binary   0000037f

  .data     0x811B1668
  .data     4
  .binary   00000221

  .data     0x811B168C
  .data     4
  .binary   0000023f

  .data     0x811B16B0
  .data     4
  .binary   000003b1

  .data     0x811B171C
  .data     4
  .binary   000002d5

  .data     0x811B1740
  .data     4
  .binary   00000221

  .data     0x811B1764
  .data     4
  .binary   000001db

  .data     0x811B1788
  .data     4
  .binary   000002e9

  .data     0x811B17AC
  .data     4
  .binary   00000339

  .data     0x811B17D0
  .data     4
  .binary   0000039d

  .data     0x811B17F4
  .data     4
  .binary   000003cf

  .data     0x811B183C
  .data     4
  .binary   00000019

  .data     0x811B1860
  .data     4
  .binary   0000020d

  .data     0x811B1884
  .data     4
  .binary   00000591

  .data     0x811B18A8
  .data     4
  .binary   00000217

  .data     0x811B18CC
  .data     4
  .binary   0000022b

  .data     0x811B18F0
  .data     4
  .binary   000001d6

  .data     0x811B1914
  .data     4
  .binary   00000221

  .data     0x811B1938
  .data     4
  .binary   0000025d

  .data     0x811B195C
  .data     4
  .binary   0000027b

  .data     0x811B1980
  .data     4
  .binary   0000021c

  .data     0x811B19A4
  .data     4
  .binary   0000023f

  .data     0x811B19C8
  .data     4
  .binary   000001e5

  .data     0x811B19EC
  .data     4
  .binary   000001ef

  .data     0x811B1A10
  .data     4
  .binary   000001f9

  .data     0x811B1B9C
  .data     4
  .binary   000002ee

  .data     0x811B1BC0
  .data     4
  .binary   000005fa

  .data     0x811B1BE4
  .data     4
  .binary   00000672

  .data     0x811B1C08
  .data     4
  .binary   000006ae

  .data     0x811B1C2C
  .data     4
  .binary   00000672

  .data     0x811B1C50
  .data     4
  .binary   000016da

  .data     0x811B1C74
  .data     4
  .binary   00000708

  .data     0x811B1C98
  .data     4
  .binary   00000672

  .data     0x811B1CBC
  .data     4
  .binary   000005f0

  .data     0x811B1CE0
  .data     4
  .binary   00000604

  .data     0x811B1D04
  .data     4
  .binary   00000744

  .data     0x811B1D28
  .data     4
  .binary   000001f4

  .data     0x811B1D4C
  .data     4
  .binary   000001f4

  .data     0x811B1D70
  .data     4
  .binary   000009f6

  .data     0x811B1D94
  .data     4
  .binary   00000708

  .data     0x811B1DB8
  .data     4
  .binary   00015f90

  .data     0x811B1DDC
  .data     4
  .binary   0000012c

  .data     0x811B1E00
  .data     4
  .binary   00000050

  .data     0x811B1E24
  .data     4
  .binary   00019a28

  .data     0x811B1E48
  .data     4
  .binary   00000780

  .data     0x811B1EFC
  .data     4
  .binary   000005be

  .data     0x811B1F20
  .data     4
  .binary   00001400

  .data     0x811B1F44
  .data     4
  .binary   00000b40

  .data     0x811B1F68
  .data     4
  .binary   000000fa

  .data     0x811B1F8C
  .data     4
  .binary   00000690

  .data     0x811B1FB0
  .data     4
  .binary   00000780

  .data     0x811B1FD4
  .data     4
  .binary   0001e26c

  .data     0x811B2088
  .data     4
  .binary   00001536

  .data     0x811B20D0
  .data     4
  .binary   00000b04

  .data     0x811B20F4
  .data     4
  .binary   00000a8c

  .data     0x811B21CC
  .data     4
  .binary   00039fbc

  .data     0x811B225C
  .data     4
  .binary   000008ac

  .data     0x811B2280
  .data     4
  .binary   00000618

  .data     0x811B22A4
  .data     4
  .binary   00000618

  .data     0x811B22C8
  .data     4
  .binary   00000636

  .data     0x811B23C4
  .data     4
  .binary   000006cc

  .data     0x811B23E8
  .data     4
  .binary   000006ae

  .data     0x811B240C
  .data     4
  .binary   00000708

  .data     0x811B2430
  .data     4
  .binary   00000b5e

  .data     0x811B249C
  .data     4
  .binary   000008ca

  .data     0x811B24C0
  .data     4
  .binary   000006ae

  .data     0x811B24E4
  .data     4
  .binary   000003e8

  .data     0x811B2508
  .data     4
  .binary   00000906

  .data     0x811B252C
  .data     4
  .binary   000009f6

  .data     0x811B2550
  .data     4
  .binary   00000b22

  .data     0x811B2574
  .data     4
  .binary   00000bb8

  .data     0x811B25BC
  .data     4
  .binary   00000019

  .data     0x811B25E0
  .data     4
  .binary   00000672

  .data     0x811B2604
  .data     4
  .binary   000010fe

  .data     0x811B2628
  .data     4
  .binary   00000690

  .data     0x811B264C
  .data     4
  .binary   000006cc

  .data     0x811B2670
  .data     4
  .binary   0000053c

  .data     0x811B2694
  .data     4
  .binary   000006ae

  .data     0x811B26B8
  .data     4
  .binary   00000762

  .data     0x811B26DC
  .data     4
  .binary   000007bc

  .data     0x811B2700
  .data     4
  .binary   000005c8

  .data     0x811B2724
  .data     4
  .binary   00000708

  .data     0x811B2748
  .data     4
  .binary   000005fa

  .data     0x811B276C
  .data     4
  .binary   00000618

  .data     0x811B2790
  .data     4
  .binary   00000636

  .data     0
  .data     0
