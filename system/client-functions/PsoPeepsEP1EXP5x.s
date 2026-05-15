.meta visibility="menu"
.meta key="PsoPeepsEP1EXP5x"
.meta name="PSO Peeps EP1 5x EXP"
.meta description="Sets EP1 enemy EXP\nto 5x for GC crossplay"

.versions 3OE2 3OP0

entry_ptr:
reloc0:
  .offsetof start

start:
  .include  WriteCodeBlocks

  # PSO Peeps GC Plus USA / 3OE2
  # Source table: BattleParamEntry_on.dat
  # Active online battle-param table loaded at 0x811AB7C0 on 3OE2; testing 0x811A95A0 on 3OP0
  # EXP field offset within each 0x24-byte row is +0x1C
  # Generated from clean BattleParamEntry_on.dat; multiplier=5x

  .data     <VERS 0x811AB7DC 0x811A95BC>
  .data     4
  .binary   00000005

  .data     <VERS 0x811AB800 0x811A95E0>
  .data     4
  .binary   0000001e

  .data     <VERS 0x811AB824 0x811A9604>
  .data     4
  .binary   00000019

  .data     <VERS 0x811AB848 0x811A9628>
  .data     4
  .binary   00000023

  .data     <VERS 0x811AB86C 0x811A964C>
  .data     4
  .binary   00000032

  .data     <VERS 0x811AB890 0x811A9670>
  .data     4
  .binary   000002ee

  .data     <VERS 0x811AB8B4 0x811A9694>
  .data     4
  .binary   0000007d

  .data     <VERS 0x811AB8D8 0x811A96B8>
  .data     4
  .binary   00000050

  .data     <VERS 0x811AB8FC 0x811A96DC>
  .data     4
  .binary   00000050

  .data     <VERS 0x811AB920 0x811A9700>
  .data     4
  .binary   00000055

  .data     <VERS 0x811AB944 0x811A9724>
  .data     4
  .binary   00000091

  .data     <VERS 0x811AB968 0x811A9748>
  .data     4
  .binary   00000014

  .data     <VERS 0x811AB98C 0x811A976C>
  .data     4
  .binary   00000014

  .data     <VERS 0x811AB9B0 0x811A9790>
  .data     4
  .binary   000000af

  .data     <VERS 0x811AB9D4 0x811A97B4>
  .data     4
  .binary   000000af

  .data     <VERS 0x811AB9F8 0x811A97D8>
  .data     4
  .binary   00001162

  .data     <VERS 0x811ABA1C 0x811A97FC>
  .data     4
  .binary   00000032

  .data     <VERS 0x811ABA40 0x811A9820>
  .data     4
  .binary   00000032

  .data     <VERS 0x811ABA64 0x811A9844>
  .data     4
  .binary   000007d0

  .data     <VERS 0x811ABA88 0x811A9868>
  .data     4
  .binary   0000008c

  .data     <VERS 0x811ABB3C 0x811A991C>
  .data     4
  .binary   00000014

  .data     <VERS 0x811ABB60 0x811A9940>
  .data     4
  .binary   000001f4

  .data     <VERS 0x811ABB84 0x811A9964>
  .data     4
  .binary   0000004b

  .data     <VERS 0x811ABBA8 0x811A9988>
  .data     4
  .binary   0000000f

  .data     <VERS 0x811ABBCC 0x811A99AC>
  .data     4
  .binary   0000005a

  .data     <VERS 0x811ABBF0 0x811A99D0>
  .data     4
  .binary   0000006e

  .data     <VERS 0x811ABC14 0x811A99F4>
  .data     4
  .binary   00000064

  .data     <VERS 0x811ABC38 0x811A9A18>
  .data     4
  .binary   00000087

  .data     <VERS 0x811ABC5C 0x811A9A3C>
  .data     4
  .binary   0000001e

  .data     <VERS 0x811ABD10 0x811A9AF0>
  .data     4
  .binary   0000186a

  .data     <VERS 0x811ABE9C 0x811A9C7C>
  .data     4
  .binary   00000032

  .data     <VERS 0x811ABEC0 0x811A9CA0>
  .data     4
  .binary   0000001e

  .data     <VERS 0x811ABEE4 0x811A9CC4>
  .data     4
  .binary   00000014

  .data     <VERS 0x811ABF08 0x811A9CE8>
  .data     4
  .binary   00000014

  .data     <VERS 0x811ABF2C 0x811A9D0C>
  .data     4
  .binary   000002ee

  .data     <VERS 0x811ABF50 0x811A9D30>
  .data     4
  .binary   00000019

  .data     <VERS 0x811ABF98 0x811A9D78>
  .data     4
  .binary   00003a98

  .data     <VERS 0x811ABFE0 0x811A9DC0>
  .data     4
  .binary   00000019

  .data     <VERS 0x811AC220 0x811AA000>
  .data     4
  .binary   00000041

  .data     <VERS 0x811AC244 0x811AA024>
  .data     4
  .binary   000001f4

  .data     <VERS 0x811AC268 0x811AA048>
  .data     4
  .binary   00000019

  .data     <VERS 0x811AC28C 0x811AA06C>
  .data     4
  .binary   0000001e

  .data     <VERS 0x811AC2B0 0x811AA090>
  .data     4
  .binary   00000023

  .data     <VERS 0x811AC2D4 0x811AA0B4>
  .data     4
  .binary   00000064

  .data     <VERS 0x811AC2F8 0x811AA0D8>
  .data     4
  .binary   00000032

  .data     <VERS 0x811AC31C 0x811AA0FC>
  .data     4
  .binary   0000003c

  .data     <VERS 0x811AC340 0x811AA120>
  .data     4
  .binary   00000046

  .data     <VERS 0x811AC364 0x811AA144>
  .data     4
  .binary   00000096

  .data     <VERS 0x811AC388 0x811AA168>
  .data     4
  .binary   0000006e

  .data     <VERS 0x811AC3AC 0x811AA18C>
  .data     4
  .binary   00000078

  .data     <VERS 0x811AC3D0 0x811AA1B0>
  .data     4
  .binary   00000082

  .data     <VERS 0x811AC55C 0x811AA33C>
  .data     4
  .binary   000000b4

  .data     <VERS 0x811AC580 0x811AA360>
  .data     4
  .binary   000000d7

  .data     <VERS 0x811AC5A4 0x811AA384>
  .data     4
  .binary   000000d2

  .data     <VERS 0x811AC5C8 0x811AA3A8>
  .data     4
  .binary   000000e1

  .data     <VERS 0x811AC5EC 0x811AA3CC>
  .data     4
  .binary   000000f5

  .data     <VERS 0x811AC610 0x811AA3F0>
  .data     4
  .binary   0000050f

  .data     <VERS 0x811AC634 0x811AA414>
  .data     4
  .binary   0000015e

  .data     <VERS 0x811AC658 0x811AA438>
  .data     4
  .binary   00000122

  .data     <VERS 0x811AC67C 0x811AA45C>
  .data     4
  .binary   00000122

  .data     <VERS 0x811AC6A0 0x811AA480>
  .data     4
  .binary   0000012c

  .data     <VERS 0x811AC6C4 0x811AA4A4>
  .data     4
  .binary   00000186

  .data     <VERS 0x811AC6E8 0x811AA4C8>
  .data     4
  .binary   000000c8

  .data     <VERS 0x811AC70C 0x811AA4EC>
  .data     4
  .binary   000000c8

  .data     <VERS 0x811AC730 0x811AA510>
  .data     4
  .binary   000001e5

  .data     <VERS 0x811AC754 0x811AA534>
  .data     4
  .binary   000001a4

  .data     <VERS 0x811AC778 0x811AA558>
  .data     4
  .binary   00003e80

  .data     <VERS 0x811AC79C 0x811AA57C>
  .data     4
  .binary   0000007d

  .data     <VERS 0x811AC7C0 0x811AA5A0>
  .data     4
  .binary   00000014

  .data     <VERS 0x811AC7E4 0x811AA5C4>
  .data     4
  .binary   00002ee0

  .data     <VERS 0x811AC808 0x811AA5E8>
  .data     4
  .binary   00000177

  .data     <VERS 0x811AC8BC 0x811AA69C>
  .data     4
  .binary   000000c8

  .data     <VERS 0x811AC8E0 0x811AA6C0>
  .data     4
  .binary   00000398

  .data     <VERS 0x811AC904 0x811AA6E4>
  .data     4
  .binary   0000011d

  .data     <VERS 0x811AC928 0x811AA708>
  .data     4
  .binary   00000037

  .data     <VERS 0x811AC94C 0x811AA72C>
  .data     4
  .binary   00000131

  .data     <VERS 0x811AC970 0x811AA750>
  .data     4
  .binary   0000014f

  .data     <VERS 0x811AC994 0x811AA774>
  .data     4
  .binary   00000140

  .data     <VERS 0x811AC9B8 0x811AA798>
  .data     4
  .binary   00000181

  .data     <VERS 0x811AC9DC 0x811AA7BC>
  .data     4
  .binary   000000d7

  .data     <VERS 0x811ACA90 0x811AA870>
  .data     4
  .binary   00004a38

  .data     <VERS 0x811ACC1C 0x811AA9FC>
  .data     4
  .binary   000000f5

  .data     <VERS 0x811ACC40 0x811AAA20>
  .data     4
  .binary   00000082

  .data     <VERS 0x811ACC64 0x811AAA44>
  .data     4
  .binary   00000073

  .data     <VERS 0x811ACC88 0x811AAA68>
  .data     4
  .binary   00000073

  .data     <VERS 0x811ACCAC 0x811AAA8C>
  .data     4
  .binary   0000050f

  .data     <VERS 0x811ACCD0 0x811AAAB0>
  .data     4
  .binary   00000019

  .data     <VERS 0x811ACD3C 0x811AAB1C>
  .data     4
  .binary   00009c40

  .data     <VERS 0x811ACD60 0x811AAB40>
  .data     4
  .binary   00000019

  .data     <VERS 0x811ACFA0 0x811AAD80>
  .data     4
  .binary   00000118

  .data     <VERS 0x811ACFC4 0x811AADA4>
  .data     4
  .binary   00000398

  .data     <VERS 0x811ACFE8 0x811AADC8>
  .data     4
  .binary   000000d2

  .data     <VERS 0x811AD00C 0x811AADEC>
  .data     4
  .binary   000000d7

  .data     <VERS 0x811AD030 0x811AAE10>
  .data     4
  .binary   000000e1

  .data     <VERS 0x811AD054 0x811AAE34>
  .data     4
  .binary   00000140

  .data     <VERS 0x811AD078 0x811AAE58>
  .data     4
  .binary   000000f5

  .data     <VERS 0x811AD09C 0x811AAE7C>
  .data     4
  .binary   00000104

  .data     <VERS 0x811AD0C0 0x811AAEA0>
  .data     4
  .binary   00000113

  .data     <VERS 0x811AD0E4 0x811AAEC4>
  .data     4
  .binary   00000195

  .data     <VERS 0x811AD108 0x811AAEE8>
  .data     4
  .binary   0000014f

  .data     <VERS 0x811AD12C 0x811AAF0C>
  .data     4
  .binary   0000015e

  .data     <VERS 0x811AD150 0x811AAF30>
  .data     4
  .binary   0000016d

  .data     <VERS 0x811AD2DC 0x811AB0BC>
  .data     4
  .binary   0000019a

  .data     <VERS 0x811AD300 0x811AB0E0>
  .data     4
  .binary   000001cc

  .data     <VERS 0x811AD324 0x811AB104>
  .data     4
  .binary   000001c2

  .data     <VERS 0x811AD348 0x811AB128>
  .data     4
  .binary   000001d6

  .data     <VERS 0x811AD36C 0x811AB14C>
  .data     4
  .binary   000001f4

  .data     <VERS 0x811AD390 0x811AB170>
  .data     4
  .binary   0000076c

  .data     <VERS 0x811AD3B4 0x811AB194>
  .data     4
  .binary   000002ad

  .data     <VERS 0x811AD3D8 0x811AB1B8>
  .data     4
  .binary   00000230

  .data     <VERS 0x811AD3FC 0x811AB1DC>
  .data     4
  .binary   00000230

  .data     <VERS 0x811AD420 0x811AB200>
  .data     4
  .binary   0000023a

  .data     <VERS 0x811AD444 0x811AB224>
  .data     4
  .binary   000002e4

  .data     <VERS 0x811AD468 0x811AB248>
  .data     4
  .binary   000001b8

  .data     <VERS 0x811AD48C 0x811AB26C>
  .data     4
  .binary   000001b8

  .data     <VERS 0x811AD4B0 0x811AB290>
  .data     4
  .binary   000002ee

  .data     <VERS 0x811AD4D4 0x811AB2B4>
  .data     4
  .binary   000002d0

  .data     <VERS 0x811AD4F8 0x811AB2D8>
  .data     4
  .binary   0000a9ec

  .data     <VERS 0x811AD51C 0x811AB2FC>
  .data     4
  .binary   00000096

  .data     <VERS 0x811AD540 0x811AB320>
  .data     4
  .binary   00000028

  .data     <VERS 0x811AD564 0x811AB344>
  .data     4
  .binary   00009bdc

  .data     <VERS 0x811AD588 0x811AB368>
  .data     4
  .binary   000002cb

  .data     <VERS 0x811AD63C 0x811AB41C>
  .data     4
  .binary   000001b8

  .data     <VERS 0x811AD660 0x811AB440>
  .data     4
  .binary   00000578

  .data     <VERS 0x811AD684 0x811AB464>
  .data     4
  .binary   00000258

  .data     <VERS 0x811AD6A8 0x811AB488>
  .data     4
  .binary   0000006e

  .data     <VERS 0x811AD6CC 0x811AB4AC>
  .data     4
  .binary   00000244

  .data     <VERS 0x811AD6F0 0x811AB4D0>
  .data     4
  .binary   0000026c

  .data     <VERS 0x811AD714 0x811AB4F4>
  .data     4
  .binary   00000258

  .data     <VERS 0x811AD738 0x811AB518>
  .data     4
  .binary   00000280

  .data     <VERS 0x811AD75C 0x811AB53C>
  .data     4
  .binary   000001cc

  .data     <VERS 0x811AD810 0x811AB5F0>
  .data     4
  .binary   0000d8cc

  .data     <VERS 0x811AD99C 0x811AB77C>
  .data     4
  .binary   000001f4

  .data     <VERS 0x811AD9C0 0x811AB7A0>
  .data     4
  .binary   00000104

  .data     <VERS 0x811AD9E4 0x811AB7C4>
  .data     4
  .binary   000000f0

  .data     <VERS 0x811ADA08 0x811AB7E8>
  .data     4
  .binary   000000f0

  .data     <VERS 0x811ADA2C 0x811AB80C>
  .data     4
  .binary   0000076c

  .data     <VERS 0x811ADA50 0x811AB830>
  .data     4
  .binary   0000002d

  .data     <VERS 0x811ADABC 0x811AB89C>
  .data     4
  .binary   00013880

  .data     <VERS 0x811ADAE0 0x811AB8C0>
  .data     4
  .binary   0000002d

  .data     <VERS 0x811ADD20 0x811ABB00>
  .data     4
  .binary   0000022b

  .data     <VERS 0x811ADD44 0x811ABB24>
  .data     4
  .binary   00000578

  .data     <VERS 0x811ADD68 0x811ABB48>
  .data     4
  .binary   000001c2

  .data     <VERS 0x811ADD8C 0x811ABB6C>
  .data     4
  .binary   000001cc

  .data     <VERS 0x811ADDB0 0x811ABB90>
  .data     4
  .binary   000001d6

  .data     <VERS 0x811ADDD4 0x811ABBB4>
  .data     4
  .binary   00000271

  .data     <VERS 0x811ADDF8 0x811ABBD8>
  .data     4
  .binary   000001f4

  .data     <VERS 0x811ADE1C 0x811ABBFC>
  .data     4
  .binary   00000208

  .data     <VERS 0x811ADE40 0x811ABC20>
  .data     4
  .binary   0000021c

  .data     <VERS 0x811ADE64 0x811ABC44>
  .data     4
  .binary   000002ee

  .data     <VERS 0x811ADE88 0x811ABC68>
  .data     4
  .binary   0000026c

  .data     <VERS 0x811ADEAC 0x811ABC8C>
  .data     4
  .binary   00000280

  .data     <VERS 0x811ADED0 0x811ABCB0>
  .data     4
  .binary   00000294

  .data     <VERS 0x811AE05C 0x811ABE3C>
  .data     4
  .binary   000002d5

  .data     <VERS 0x811AE080 0x811ABE60>
  .data     4
  .binary   00000546

  .data     <VERS 0x811AE0A4 0x811ABE84>
  .data     4
  .binary   0000055f

  .data     <VERS 0x811AE0C8 0x811ABEA8>
  .data     4
  .binary   00000578

  .data     <VERS 0x811AE0EC 0x811ABECC>
  .data     4
  .binary   000005c3

  .data     <VERS 0x811AE110 0x811ABEF0>
  .data     4
  .binary   00001194

  .data     <VERS 0x811AE134 0x811ABF14>
  .data     4
  .binary   000006d6

  .data     <VERS 0x811AE158 0x811ABF38>
  .data     4
  .binary   00000640

  .data     <VERS 0x811AE17C 0x811ABF5C>
  .data     4
  .binary   00000640

  .data     <VERS 0x811AE1A0 0x811ABF80>
  .data     4
  .binary   00000659

  .data     <VERS 0x811AE1C4 0x811ABFA4>
  .data     4
  .binary   00000717

  .data     <VERS 0x811AE1E8 0x811ABFC8>
  .data     4
  .binary   000001f4

  .data     <VERS 0x811AE20C 0x811ABFEC>
  .data     4
  .binary   000001f4

  .data     <VERS 0x811AE230 0x811AC010>
  .data     4
  .binary   00000785

  .data     <VERS 0x811AE254 0x811AC034>
  .data     4
  .binary   00000744

  .data     <VERS 0x811AE278 0x811AC058>
  .data     4
  .binary   00016f30

  .data     <VERS 0x811AE29C 0x811AC07C>
  .data     4
  .binary   0000012c

  .data     <VERS 0x811AE2C0 0x811AC0A0>
  .data     4
  .binary   00000050

  .data     <VERS 0x811AE2E4 0x811AC0C4>
  .data     4
  .binary   0001368c

  .data     <VERS 0x811AE308 0x811AC0E8>
  .data     4
  .binary   000006b8

  .data     <VERS 0x811AE3BC 0x811AC19C>
  .data     4
  .binary   00000500

  .data     <VERS 0x811AE3E0 0x811AC1C0>
  .data     4
  .binary   00000dac

  .data     <VERS 0x811AE404 0x811AC1E4>
  .data     4
  .binary   00000640

  .data     <VERS 0x811AE428 0x811AC208>
  .data     4
  .binary   00000127

  .data     <VERS 0x811AE44C 0x811AC22C>
  .data     4
  .binary   00000645

  .data     <VERS 0x811AE470 0x811AC250>
  .data     4
  .binary   000006ef

  .data     <VERS 0x811AE494 0x811AC274>
  .data     4
  .binary   00000686

  .data     <VERS 0x811AE4B8 0x811AC298>
  .data     4
  .binary   00000686

  .data     <VERS 0x811AE4DC 0x811AC2BC>
  .data     4
  .binary   00000555

  .data     <VERS 0x811AE590 0x811AC370>
  .data     4
  .binary   0001cafc

  .data     <VERS 0x811AE71C 0x811AC4FC>
  .data     4
  .binary   000005aa

  .data     <VERS 0x811AE740 0x811AC520>
  .data     4
  .binary   000003cf

  .data     <VERS 0x811AE764 0x811AC544>
  .data     4
  .binary   00000384

  .data     <VERS 0x811AE788 0x811AC568>
  .data     4
  .binary   00000384

  .data     <VERS 0x811AE7AC 0x811AC58C>
  .data     4
  .binary   00001130

  .data     <VERS 0x811AE7D0 0x811AC5B0>
  .data     4
  .binary   0000007d

  .data     <VERS 0x811AE83C 0x811AC61C>
  .data     4
  .binary   0003d090

  .data     <VERS 0x811AE860 0x811AC640>
  .data     4
  .binary   00000064

  .data     <VERS 0x811AEAA0 0x811AC880>
  .data     4
  .binary   000005dc

  .data     <VERS 0x811AEAC4 0x811AC8A4>
  .data     4
  .binary   00000d7a

  .data     <VERS 0x811AEAE8 0x811AC8C8>
  .data     4
  .binary   0000054b

  .data     <VERS 0x811AEB0C 0x811AC8EC>
  .data     4
  .binary   00000564

  .data     <VERS 0x811AEB30 0x811AC910>
  .data     4
  .binary   0000053c

  .data     <VERS 0x811AEB54 0x811AC934>
  .data     4
  .binary   00000681

  .data     <VERS 0x811AEB78 0x811AC958>
  .data     4
  .binary   000005c3

  .data     <VERS 0x811AEB9C 0x811AC97C>
  .data     4
  .binary   000005eb

  .data     <VERS 0x811AEBC0 0x811AC9A0>
  .data     4
  .binary   00000636

  .data     <VERS 0x811AEBE4 0x811AC9C4>
  .data     4
  .binary   00000753

  .data     <VERS 0x811AEC08 0x811AC9E8>
  .data     4
  .binary   0000069f

  .data     <VERS 0x811AEC2C 0x811ACA0C>
  .data     4
  .binary   000006bd

  .data     <VERS 0x811AEC50 0x811ACA30>
  .data     4
  .binary   000006f4

  .data     0
  .data     0
