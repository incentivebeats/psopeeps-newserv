.meta visibility="menu"
.meta key="PsoPeepsEP1EXP10x"
.meta name="EP1 10x"
.meta description="Sets EP1 enemy EXP\nto 10x for GC crossplay"

.versions 3OE2 3OJ5

entry_ptr:
reloc0:
  .offsetof start

start:
  .include  WriteCodeBlocks

  # PSO Peeps GC Plus USA / 3OE2
  # Source table: BattleParamEntry_on.dat
  # Active online battle-param table loaded at 0x811AB7C0
  # EXP field offset within each 0x24-byte row is +0x1C
  # Generated from clean BattleParamEntry_on.dat; multiplier=10x

  .data     <VERS 0x811AB7DC 0x811AF31C>
  .data     4
  .binary   0000000a

  .data     <VERS 0x811AB800 0x811AF340>
  .data     4
  .binary   0000003c

  .data     <VERS 0x811AB824 0x811AF364>
  .data     4
  .binary   00000032

  .data     <VERS 0x811AB848 0x811AF388>
  .data     4
  .binary   00000046

  .data     <VERS 0x811AB86C 0x811AF3AC>
  .data     4
  .binary   00000064

  .data     <VERS 0x811AB890 0x811AF3D0>
  .data     4
  .binary   000005dc

  .data     <VERS 0x811AB8B4 0x811AF3F4>
  .data     4
  .binary   000000fa

  .data     <VERS 0x811AB8D8 0x811AF418>
  .data     4
  .binary   000000a0

  .data     <VERS 0x811AB8FC 0x811AF43C>
  .data     4
  .binary   000000a0

  .data     <VERS 0x811AB920 0x811AF460>
  .data     4
  .binary   000000aa

  .data     <VERS 0x811AB944 0x811AF484>
  .data     4
  .binary   00000122

  .data     <VERS 0x811AB968 0x811AF4A8>
  .data     4
  .binary   00000028

  .data     <VERS 0x811AB98C 0x811AF4CC>
  .data     4
  .binary   00000028

  .data     <VERS 0x811AB9B0 0x811AF4F0>
  .data     4
  .binary   0000015e

  .data     <VERS 0x811AB9D4 0x811AF514>
  .data     4
  .binary   0000015e

  .data     <VERS 0x811AB9F8 0x811AF538>
  .data     4
  .binary   000022c4

  .data     <VERS 0x811ABA1C 0x811AF55C>
  .data     4
  .binary   00000064

  .data     <VERS 0x811ABA40 0x811AF580>
  .data     4
  .binary   00000064

  .data     <VERS 0x811ABA64 0x811AF5A4>
  .data     4
  .binary   00000fa0

  .data     <VERS 0x811ABA88 0x811AF5C8>
  .data     4
  .binary   00000118

  .data     <VERS 0x811ABB3C 0x811AF67C>
  .data     4
  .binary   00000028

  .data     <VERS 0x811ABB60 0x811AF6A0>
  .data     4
  .binary   000003e8

  .data     <VERS 0x811ABB84 0x811AF6C4>
  .data     4
  .binary   00000096

  .data     <VERS 0x811ABBA8 0x811AF6E8>
  .data     4
  .binary   0000001e

  .data     <VERS 0x811ABBCC 0x811AF70C>
  .data     4
  .binary   000000b4

  .data     <VERS 0x811ABBF0 0x811AF730>
  .data     4
  .binary   000000dc

  .data     <VERS 0x811ABC14 0x811AF754>
  .data     4
  .binary   000000c8

  .data     <VERS 0x811ABC38 0x811AF778>
  .data     4
  .binary   0000010e

  .data     <VERS 0x811ABC5C 0x811AF79C>
  .data     4
  .binary   0000003c

  .data     <VERS 0x811ABD10 0x811AF850>
  .data     4
  .binary   000030d4

  .data     <VERS 0x811ABE9C 0x811AF9DC>
  .data     4
  .binary   00000064

  .data     <VERS 0x811ABEC0 0x811AFA00>
  .data     4
  .binary   0000003c

  .data     <VERS 0x811ABEE4 0x811AFA24>
  .data     4
  .binary   00000028

  .data     <VERS 0x811ABF08 0x811AFA48>
  .data     4
  .binary   00000028

  .data     <VERS 0x811ABF2C 0x811AFA6C>
  .data     4
  .binary   000005dc

  .data     <VERS 0x811ABF50 0x811AFA90>
  .data     4
  .binary   00000032

  .data     <VERS 0x811ABF98 0x811AFAD8>
  .data     4
  .binary   00007530

  .data     <VERS 0x811ABFE0 0x811AFB20>
  .data     4
  .binary   00000032

  .data     <VERS 0x811AC220 0x811AFD60>
  .data     4
  .binary   00000082

  .data     <VERS 0x811AC244 0x811AFD84>
  .data     4
  .binary   000003e8

  .data     <VERS 0x811AC268 0x811AFDA8>
  .data     4
  .binary   00000032

  .data     <VERS 0x811AC28C 0x811AFDCC>
  .data     4
  .binary   0000003c

  .data     <VERS 0x811AC2B0 0x811AFDF0>
  .data     4
  .binary   00000046

  .data     <VERS 0x811AC2D4 0x811AFE14>
  .data     4
  .binary   000000c8

  .data     <VERS 0x811AC2F8 0x811AFE38>
  .data     4
  .binary   00000064

  .data     <VERS 0x811AC31C 0x811AFE5C>
  .data     4
  .binary   00000078

  .data     <VERS 0x811AC340 0x811AFE80>
  .data     4
  .binary   0000008c

  .data     <VERS 0x811AC364 0x811AFEA4>
  .data     4
  .binary   0000012c

  .data     <VERS 0x811AC388 0x811AFEC8>
  .data     4
  .binary   000000dc

  .data     <VERS 0x811AC3AC 0x811AFEEC>
  .data     4
  .binary   000000f0

  .data     <VERS 0x811AC3D0 0x811AFF10>
  .data     4
  .binary   00000104

  .data     <VERS 0x811AC55C 0x811B009C>
  .data     4
  .binary   00000168

  .data     <VERS 0x811AC580 0x811B00C0>
  .data     4
  .binary   000001ae

  .data     <VERS 0x811AC5A4 0x811B00E4>
  .data     4
  .binary   000001a4

  .data     <VERS 0x811AC5C8 0x811B0108>
  .data     4
  .binary   000001c2

  .data     <VERS 0x811AC5EC 0x811B012C>
  .data     4
  .binary   000001ea

  .data     <VERS 0x811AC610 0x811B0150>
  .data     4
  .binary   00000a1e

  .data     <VERS 0x811AC634 0x811B0174>
  .data     4
  .binary   000002bc

  .data     <VERS 0x811AC658 0x811B0198>
  .data     4
  .binary   00000244

  .data     <VERS 0x811AC67C 0x811B01BC>
  .data     4
  .binary   00000244

  .data     <VERS 0x811AC6A0 0x811B01E0>
  .data     4
  .binary   00000258

  .data     <VERS 0x811AC6C4 0x811B0204>
  .data     4
  .binary   0000030c

  .data     <VERS 0x811AC6E8 0x811B0228>
  .data     4
  .binary   00000190

  .data     <VERS 0x811AC70C 0x811B024C>
  .data     4
  .binary   00000190

  .data     <VERS 0x811AC730 0x811B0270>
  .data     4
  .binary   000003ca

  .data     <VERS 0x811AC754 0x811B0294>
  .data     4
  .binary   00000348

  .data     <VERS 0x811AC778 0x811B02B8>
  .data     4
  .binary   00007d00

  .data     <VERS 0x811AC79C 0x811B02DC>
  .data     4
  .binary   000000fa

  .data     <VERS 0x811AC7C0 0x811B0300>
  .data     4
  .binary   00000028

  .data     <VERS 0x811AC7E4 0x811B0324>
  .data     4
  .binary   00005dc0

  .data     <VERS 0x811AC808 0x811B0348>
  .data     4
  .binary   000002ee

  .data     <VERS 0x811AC8BC 0x811B03FC>
  .data     4
  .binary   00000190

  .data     <VERS 0x811AC8E0 0x811B0420>
  .data     4
  .binary   00000730

  .data     <VERS 0x811AC904 0x811B0444>
  .data     4
  .binary   0000023a

  .data     <VERS 0x811AC928 0x811B0468>
  .data     4
  .binary   0000006e

  .data     <VERS 0x811AC94C 0x811B048C>
  .data     4
  .binary   00000262

  .data     <VERS 0x811AC970 0x811B04B0>
  .data     4
  .binary   0000029e

  .data     <VERS 0x811AC994 0x811B04D4>
  .data     4
  .binary   00000280

  .data     <VERS 0x811AC9B8 0x811B04F8>
  .data     4
  .binary   00000302

  .data     <VERS 0x811AC9DC 0x811B051C>
  .data     4
  .binary   000001ae

  .data     <VERS 0x811ACA90 0x811B05D0>
  .data     4
  .binary   00009470

  .data     <VERS 0x811ACC1C 0x811B075C>
  .data     4
  .binary   000001ea

  .data     <VERS 0x811ACC40 0x811B0780>
  .data     4
  .binary   00000104

  .data     <VERS 0x811ACC64 0x811B07A4>
  .data     4
  .binary   000000e6

  .data     <VERS 0x811ACC88 0x811B07C8>
  .data     4
  .binary   000000e6

  .data     <VERS 0x811ACCAC 0x811B07EC>
  .data     4
  .binary   00000a1e

  .data     <VERS 0x811ACCD0 0x811B0810>
  .data     4
  .binary   00000032

  .data     <VERS 0x811ACD3C 0x811B087C>
  .data     4
  .binary   00013880

  .data     <VERS 0x811ACD60 0x811B08A0>
  .data     4
  .binary   00000032

  .data     <VERS 0x811ACFA0 0x811B0AE0>
  .data     4
  .binary   00000230

  .data     <VERS 0x811ACFC4 0x811B0B04>
  .data     4
  .binary   00000730

  .data     <VERS 0x811ACFE8 0x811B0B28>
  .data     4
  .binary   000001a4

  .data     <VERS 0x811AD00C 0x811B0B4C>
  .data     4
  .binary   000001ae

  .data     <VERS 0x811AD030 0x811B0B70>
  .data     4
  .binary   000001c2

  .data     <VERS 0x811AD054 0x811B0B94>
  .data     4
  .binary   00000280

  .data     <VERS 0x811AD078 0x811B0BB8>
  .data     4
  .binary   000001ea

  .data     <VERS 0x811AD09C 0x811B0BDC>
  .data     4
  .binary   00000208

  .data     <VERS 0x811AD0C0 0x811B0C00>
  .data     4
  .binary   00000226

  .data     <VERS 0x811AD0E4 0x811B0C24>
  .data     4
  .binary   0000032a

  .data     <VERS 0x811AD108 0x811B0C48>
  .data     4
  .binary   0000029e

  .data     <VERS 0x811AD12C 0x811B0C6C>
  .data     4
  .binary   000002bc

  .data     <VERS 0x811AD150 0x811B0C90>
  .data     4
  .binary   000002da

  .data     <VERS 0x811AD2DC 0x811B0E1C>
  .data     4
  .binary   00000334

  .data     <VERS 0x811AD300 0x811B0E40>
  .data     4
  .binary   00000398

  .data     <VERS 0x811AD324 0x811B0E64>
  .data     4
  .binary   00000384

  .data     <VERS 0x811AD348 0x811B0E88>
  .data     4
  .binary   000003ac

  .data     <VERS 0x811AD36C 0x811B0EAC>
  .data     4
  .binary   000003e8

  .data     <VERS 0x811AD390 0x811B0ED0>
  .data     4
  .binary   00000ed8

  .data     <VERS 0x811AD3B4 0x811B0EF4>
  .data     4
  .binary   0000055a

  .data     <VERS 0x811AD3D8 0x811B0F18>
  .data     4
  .binary   00000460

  .data     <VERS 0x811AD3FC 0x811B0F3C>
  .data     4
  .binary   00000460

  .data     <VERS 0x811AD420 0x811B0F60>
  .data     4
  .binary   00000474

  .data     <VERS 0x811AD444 0x811B0F84>
  .data     4
  .binary   000005c8

  .data     <VERS 0x811AD468 0x811B0FA8>
  .data     4
  .binary   00000370

  .data     <VERS 0x811AD48C 0x811B0FCC>
  .data     4
  .binary   00000370

  .data     <VERS 0x811AD4B0 0x811B0FF0>
  .data     4
  .binary   000005dc

  .data     <VERS 0x811AD4D4 0x811B1014>
  .data     4
  .binary   000005a0

  .data     <VERS 0x811AD4F8 0x811B1038>
  .data     4
  .binary   000153d8

  .data     <VERS 0x811AD51C 0x811B105C>
  .data     4
  .binary   0000012c

  .data     <VERS 0x811AD540 0x811B1080>
  .data     4
  .binary   00000050

  .data     <VERS 0x811AD564 0x811B10A4>
  .data     4
  .binary   000137b8

  .data     <VERS 0x811AD588 0x811B10C8>
  .data     4
  .binary   00000596

  .data     <VERS 0x811AD63C 0x811B117C>
  .data     4
  .binary   00000370

  .data     <VERS 0x811AD660 0x811B11A0>
  .data     4
  .binary   00000af0

  .data     <VERS 0x811AD684 0x811B11C4>
  .data     4
  .binary   000004b0

  .data     <VERS 0x811AD6A8 0x811B11E8>
  .data     4
  .binary   000000dc

  .data     <VERS 0x811AD6CC 0x811B120C>
  .data     4
  .binary   00000488

  .data     <VERS 0x811AD6F0 0x811B1230>
  .data     4
  .binary   000004d8

  .data     <VERS 0x811AD714 0x811B1254>
  .data     4
  .binary   000004b0

  .data     <VERS 0x811AD738 0x811B1278>
  .data     4
  .binary   00000500

  .data     <VERS 0x811AD75C 0x811B129C>
  .data     4
  .binary   00000398

  .data     <VERS 0x811AD810 0x811B1350>
  .data     4
  .binary   0001b198

  .data     <VERS 0x811AD99C 0x811B14DC>
  .data     4
  .binary   000003e8

  .data     <VERS 0x811AD9C0 0x811B1500>
  .data     4
  .binary   00000208

  .data     <VERS 0x811AD9E4 0x811B1524>
  .data     4
  .binary   000001e0

  .data     <VERS 0x811ADA08 0x811B1548>
  .data     4
  .binary   000001e0

  .data     <VERS 0x811ADA2C 0x811B156C>
  .data     4
  .binary   00000ed8

  .data     <VERS 0x811ADA50 0x811B1590>
  .data     4
  .binary   0000005a

  .data     <VERS 0x811ADABC 0x811B15FC>
  .data     4
  .binary   00027100

  .data     <VERS 0x811ADAE0 0x811B1620>
  .data     4
  .binary   0000005a

  .data     <VERS 0x811ADD20 0x811B1860>
  .data     4
  .binary   00000456

  .data     <VERS 0x811ADD44 0x811B1884>
  .data     4
  .binary   00000af0

  .data     <VERS 0x811ADD68 0x811B18A8>
  .data     4
  .binary   00000384

  .data     <VERS 0x811ADD8C 0x811B18CC>
  .data     4
  .binary   00000398

  .data     <VERS 0x811ADDB0 0x811B18F0>
  .data     4
  .binary   000003ac

  .data     <VERS 0x811ADDD4 0x811B1914>
  .data     4
  .binary   000004e2

  .data     <VERS 0x811ADDF8 0x811B1938>
  .data     4
  .binary   000003e8

  .data     <VERS 0x811ADE1C 0x811B195C>
  .data     4
  .binary   00000410

  .data     <VERS 0x811ADE40 0x811B1980>
  .data     4
  .binary   00000438

  .data     <VERS 0x811ADE64 0x811B19A4>
  .data     4
  .binary   000005dc

  .data     <VERS 0x811ADE88 0x811B19C8>
  .data     4
  .binary   000004d8

  .data     <VERS 0x811ADEAC 0x811B19EC>
  .data     4
  .binary   00000500

  .data     <VERS 0x811ADED0 0x811B1A10>
  .data     4
  .binary   00000528

  .data     <VERS 0x811AE05C 0x811B1B9C>
  .data     4
  .binary   000005aa

  .data     <VERS 0x811AE080 0x811B1BC0>
  .data     4
  .binary   00000a8c

  .data     <VERS 0x811AE0A4 0x811B1BE4>
  .data     4
  .binary   00000abe

  .data     <VERS 0x811AE0C8 0x811B1C08>
  .data     4
  .binary   00000af0

  .data     <VERS 0x811AE0EC 0x811B1C2C>
  .data     4
  .binary   00000b86

  .data     <VERS 0x811AE110 0x811B1C50>
  .data     4
  .binary   00002328

  .data     <VERS 0x811AE134 0x811B1C74>
  .data     4
  .binary   00000dac

  .data     <VERS 0x811AE158 0x811B1C98>
  .data     4
  .binary   00000c80

  .data     <VERS 0x811AE17C 0x811B1CBC>
  .data     4
  .binary   00000c80

  .data     <VERS 0x811AE1A0 0x811B1CE0>
  .data     4
  .binary   00000cb2

  .data     <VERS 0x811AE1C4 0x811B1D04>
  .data     4
  .binary   00000e2e

  .data     <VERS 0x811AE1E8 0x811B1D28>
  .data     4
  .binary   000003e8

  .data     <VERS 0x811AE20C 0x811B1D4C>
  .data     4
  .binary   000003e8

  .data     <VERS 0x811AE230 0x811B1D70>
  .data     4
  .binary   00000f0a

  .data     <VERS 0x811AE254 0x811B1D94>
  .data     4
  .binary   00000e88

  .data     <VERS 0x811AE278 0x811B1DB8>
  .data     4
  .binary   0002de60

  .data     <VERS 0x811AE29C 0x811B1DDC>
  .data     4
  .binary   00000258

  .data     <VERS 0x811AE2C0 0x811B1E00>
  .data     4
  .binary   000000a0

  .data     <VERS 0x811AE2E4 0x811B1E24>
  .data     4
  .binary   00026d18

  .data     <VERS 0x811AE308 0x811B1E48>
  .data     4
  .binary   00000d70

  .data     <VERS 0x811AE3BC 0x811B1EFC>
  .data     4
  .binary   00000a00

  .data     <VERS 0x811AE3E0 0x811B1F20>
  .data     4
  .binary   00001b58

  .data     <VERS 0x811AE404 0x811B1F44>
  .data     4
  .binary   00000c80

  .data     <VERS 0x811AE428 0x811B1F68>
  .data     4
  .binary   0000024e

  .data     <VERS 0x811AE44C 0x811B1F8C>
  .data     4
  .binary   00000c8a

  .data     <VERS 0x811AE470 0x811B1FB0>
  .data     4
  .binary   00000dde

  .data     <VERS 0x811AE494 0x811B1FD4>
  .data     4
  .binary   00000d0c

  .data     <VERS 0x811AE4B8 0x811B1FF8>
  .data     4
  .binary   00000d0c

  .data     <VERS 0x811AE4DC 0x811B201C>
  .data     4
  .binary   00000aaa

  .data     <VERS 0x811AE590 0x811B20D0>
  .data     4
  .binary   000395f8

  .data     <VERS 0x811AE71C 0x811B225C>
  .data     4
  .binary   00000b54

  .data     <VERS 0x811AE740 0x811B2280>
  .data     4
  .binary   0000079e

  .data     <VERS 0x811AE764 0x811B22A4>
  .data     4
  .binary   00000708

  .data     <VERS 0x811AE788 0x811B22C8>
  .data     4
  .binary   00000708

  .data     <VERS 0x811AE7AC 0x811B22EC>
  .data     4
  .binary   00002260

  .data     <VERS 0x811AE7D0 0x811B2310>
  .data     4
  .binary   000000fa

  .data     <VERS 0x811AE83C 0x811B237C>
  .data     4
  .binary   0007a120

  .data     <VERS 0x811AE860 0x811B23A0>
  .data     4
  .binary   000000c8

  .data     <VERS 0x811AEAA0 0x811B25E0>
  .data     4
  .binary   00000bb8

  .data     <VERS 0x811AEAC4 0x811B2604>
  .data     4
  .binary   00001af4

  .data     <VERS 0x811AEAE8 0x811B2628>
  .data     4
  .binary   00000a96

  .data     <VERS 0x811AEB0C 0x811B264C>
  .data     4
  .binary   00000ac8

  .data     <VERS 0x811AEB30 0x811B2670>
  .data     4
  .binary   00000a78

  .data     <VERS 0x811AEB54 0x811B2694>
  .data     4
  .binary   00000d02

  .data     <VERS 0x811AEB78 0x811B26B8>
  .data     4
  .binary   00000b86

  .data     <VERS 0x811AEB9C 0x811B26DC>
  .data     4
  .binary   00000bd6

  .data     <VERS 0x811AEBC0 0x811B2700>
  .data     4
  .binary   00000c6c

  .data     <VERS 0x811AEBE4 0x811B2724>
  .data     4
  .binary   00000ea6

  .data     <VERS 0x811AEC08 0x811B2748>
  .data     4
  .binary   00000d3e

  .data     <VERS 0x811AEC2C 0x811B276C>
  .data     4
  .binary   00000d7a

  .data     <VERS 0x811AEC50 0x811B2790>
  .data     4
  .binary   00000de8

  .data     0
  .data     0
