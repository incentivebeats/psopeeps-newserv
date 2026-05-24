.meta key="PsoPeepsEP1EXP_internal"
.meta name="INTERNAL GC V3 Episode 1 EXP table template"
.meta client_flag="0x0000200000000000"
.meta description="Internal: 1x GC V3 Episode 1 EXP table template. Server scales rows 0-373 from GCV3EXPMultiplier before sending."

.versions 3OE2 3OJ5

entry_ptr:
reloc0:
  .offsetof start

start:
  .include  WriteCodeBlocks

  # PSO Peeps GC Plus USA / 3OE2 and JP / 3OJ5
  # Source table: BattleParamEntry_on.dat
  # Active online battle-param table loaded at 0x811AB7C0 USA / 0x811AF300 JP
  # EXP field offset within each 0x24-byte row is +0x1C
  # Generated from clean BattleParamEntry_on.dat; 1x template rows 0-373

  .data     <VERS 0x811AB7DC 0x811AF31C>
  .data     4
exp_000:
  .binary   00000001

  .data     <VERS 0x811AB800 0x811AF340>
  .data     4
exp_001:
  .binary   00000006

  .data     <VERS 0x811AB824 0x811AF364>
  .data     4
exp_002:
  .binary   00000005

  .data     <VERS 0x811AB848 0x811AF388>
  .data     4
exp_003:
  .binary   00000007

  .data     <VERS 0x811AB86C 0x811AF3AC>
  .data     4
exp_004:
  .binary   0000000a

  .data     <VERS 0x811AB890 0x811AF3D0>
  .data     4
exp_005:
  .binary   00000096

  .data     <VERS 0x811AB8B4 0x811AF3F4>
  .data     4
exp_006:
  .binary   00000019

  .data     <VERS 0x811AB8D8 0x811AF418>
  .data     4
exp_007:
  .binary   00000010

  .data     <VERS 0x811AB8FC 0x811AF43C>
  .data     4
exp_008:
  .binary   00000010

  .data     <VERS 0x811AB920 0x811AF460>
  .data     4
exp_009:
  .binary   00000011

  .data     <VERS 0x811AB944 0x811AF484>
  .data     4
exp_010:
  .binary   0000001d

  .data     <VERS 0x811AB968 0x811AF4A8>
  .data     4
exp_011:
  .binary   00000004

  .data     <VERS 0x811AB98C 0x811AF4CC>
  .data     4
exp_012:
  .binary   00000004

  .data     <VERS 0x811AB9B0 0x811AF4F0>
  .data     4
exp_013:
  .binary   00000023

  .data     <VERS 0x811AB9D4 0x811AF514>
  .data     4
exp_014:
  .binary   00000023

  .data     <VERS 0x811AB9F8 0x811AF538>
  .data     4
exp_015:
  .binary   0000037a

  .data     <VERS 0x811ABA1C 0x811AF55C>
  .data     4
exp_016:
  .binary   0000000a

  .data     <VERS 0x811ABA40 0x811AF580>
  .data     4
exp_017:
  .binary   0000000a

  .data     <VERS 0x811ABA64 0x811AF5A4>
  .data     4
exp_018:
  .binary   00000190

  .data     <VERS 0x811ABA88 0x811AF5C8>
  .data     4
exp_019:
  .binary   0000001c

  .data     <VERS 0x811ABAAC 0x811AF5EC>
  .data     4
exp_020:
  .binary   00000000

  .data     <VERS 0x811ABAD0 0x811AF610>
  .data     4
exp_021:
  .binary   00000000

  .data     <VERS 0x811ABAF4 0x811AF634>
  .data     4
exp_022:
  .binary   00000000

  .data     <VERS 0x811ABB18 0x811AF658>
  .data     4
exp_023:
  .binary   00000000

  .data     <VERS 0x811ABB3C 0x811AF67C>
  .data     4
exp_024:
  .binary   00000004

  .data     <VERS 0x811ABB60 0x811AF6A0>
  .data     4
exp_025:
  .binary   00000064

  .data     <VERS 0x811ABB84 0x811AF6C4>
  .data     4
exp_026:
  .binary   0000000f

  .data     <VERS 0x811ABBA8 0x811AF6E8>
  .data     4
exp_027:
  .binary   00000003

  .data     <VERS 0x811ABBCC 0x811AF70C>
  .data     4
exp_028:
  .binary   00000012

  .data     <VERS 0x811ABBF0 0x811AF730>
  .data     4
exp_029:
  .binary   00000016

  .data     <VERS 0x811ABC14 0x811AF754>
  .data     4
exp_030:
  .binary   00000014

  .data     <VERS 0x811ABC38 0x811AF778>
  .data     4
exp_031:
  .binary   0000001b

  .data     <VERS 0x811ABC5C 0x811AF79C>
  .data     4
exp_032:
  .binary   00000006

  .data     <VERS 0x811ABC80 0x811AF7C0>
  .data     4
exp_033:
  .binary   00000000

  .data     <VERS 0x811ABCA4 0x811AF7E4>
  .data     4
exp_034:
  .binary   00000000

  .data     <VERS 0x811ABCC8 0x811AF808>
  .data     4
exp_035:
  .binary   00000000

  .data     <VERS 0x811ABCEC 0x811AF82C>
  .data     4
exp_036:
  .binary   00000000

  .data     <VERS 0x811ABD10 0x811AF850>
  .data     4
exp_037:
  .binary   000004e2

  .data     <VERS 0x811ABD34 0x811AF874>
  .data     4
exp_038:
  .binary   00000000

  .data     <VERS 0x811ABD58 0x811AF898>
  .data     4
exp_039:
  .binary   00000000

  .data     <VERS 0x811ABD7C 0x811AF8BC>
  .data     4
exp_040:
  .binary   00000000

  .data     <VERS 0x811ABDA0 0x811AF8E0>
  .data     4
exp_041:
  .binary   00000000

  .data     <VERS 0x811ABDC4 0x811AF904>
  .data     4
exp_042:
  .binary   00000000

  .data     <VERS 0x811ABDE8 0x811AF928>
  .data     4
exp_043:
  .binary   00000000

  .data     <VERS 0x811ABE0C 0x811AF94C>
  .data     4
exp_044:
  .binary   00000000

  .data     <VERS 0x811ABE30 0x811AF970>
  .data     4
exp_045:
  .binary   00000000

  .data     <VERS 0x811ABE54 0x811AF994>
  .data     4
exp_046:
  .binary   00000000

  .data     <VERS 0x811ABE78 0x811AF9B8>
  .data     4
exp_047:
  .binary   00000000

  .data     <VERS 0x811ABE9C 0x811AF9DC>
  .data     4
exp_048:
  .binary   0000000a

  .data     <VERS 0x811ABEC0 0x811AFA00>
  .data     4
exp_049:
  .binary   00000006

  .data     <VERS 0x811ABEE4 0x811AFA24>
  .data     4
exp_050:
  .binary   00000004

  .data     <VERS 0x811ABF08 0x811AFA48>
  .data     4
exp_051:
  .binary   00000004

  .data     <VERS 0x811ABF2C 0x811AFA6C>
  .data     4
exp_052:
  .binary   00000096

  .data     <VERS 0x811ABF50 0x811AFA90>
  .data     4
exp_053:
  .binary   00000005

  .data     <VERS 0x811ABF74 0x811AFAB4>
  .data     4
exp_054:
  .binary   00000000

  .data     <VERS 0x811ABF98 0x811AFAD8>
  .data     4
exp_055:
  .binary   00000bb8

  .data     <VERS 0x811ABFBC 0x811AFAFC>
  .data     4
exp_056:
  .binary   00000000

  .data     <VERS 0x811ABFE0 0x811AFB20>
  .data     4
exp_057:
  .binary   00000005

  .data     <VERS 0x811AC004 0x811AFB44>
  .data     4
exp_058:
  .binary   00000000

  .data     <VERS 0x811AC028 0x811AFB68>
  .data     4
exp_059:
  .binary   00000000

  .data     <VERS 0x811AC04C 0x811AFB8C>
  .data     4
exp_060:
  .binary   00000000

  .data     <VERS 0x811AC070 0x811AFBB0>
  .data     4
exp_061:
  .binary   00000000

  .data     <VERS 0x811AC094 0x811AFBD4>
  .data     4
exp_062:
  .binary   00000000

  .data     <VERS 0x811AC0B8 0x811AFBF8>
  .data     4
exp_063:
  .binary   00000000

  .data     <VERS 0x811AC0DC 0x811AFC1C>
  .data     4
exp_064:
  .binary   00000000

  .data     <VERS 0x811AC100 0x811AFC40>
  .data     4
exp_065:
  .binary   00000000

  .data     <VERS 0x811AC124 0x811AFC64>
  .data     4
exp_066:
  .binary   00000000

  .data     <VERS 0x811AC148 0x811AFC88>
  .data     4
exp_067:
  .binary   00000000

  .data     <VERS 0x811AC16C 0x811AFCAC>
  .data     4
exp_068:
  .binary   00000000

  .data     <VERS 0x811AC190 0x811AFCD0>
  .data     4
exp_069:
  .binary   00000000

  .data     <VERS 0x811AC1B4 0x811AFCF4>
  .data     4
exp_070:
  .binary   00000000

  .data     <VERS 0x811AC1D8 0x811AFD18>
  .data     4
exp_071:
  .binary   00000000

  .data     <VERS 0x811AC1FC 0x811AFD3C>
  .data     4
exp_072:
  .binary   00000000

  .data     <VERS 0x811AC220 0x811AFD60>
  .data     4
exp_073:
  .binary   0000000d

  .data     <VERS 0x811AC244 0x811AFD84>
  .data     4
exp_074:
  .binary   00000064

  .data     <VERS 0x811AC268 0x811AFDA8>
  .data     4
exp_075:
  .binary   00000005

  .data     <VERS 0x811AC28C 0x811AFDCC>
  .data     4
exp_076:
  .binary   00000006

  .data     <VERS 0x811AC2B0 0x811AFDF0>
  .data     4
exp_077:
  .binary   00000007

  .data     <VERS 0x811AC2D4 0x811AFE14>
  .data     4
exp_078:
  .binary   00000014

  .data     <VERS 0x811AC2F8 0x811AFE38>
  .data     4
exp_079:
  .binary   0000000a

  .data     <VERS 0x811AC31C 0x811AFE5C>
  .data     4
exp_080:
  .binary   0000000c

  .data     <VERS 0x811AC340 0x811AFE80>
  .data     4
exp_081:
  .binary   0000000e

  .data     <VERS 0x811AC364 0x811AFEA4>
  .data     4
exp_082:
  .binary   0000001e

  .data     <VERS 0x811AC388 0x811AFEC8>
  .data     4
exp_083:
  .binary   00000016

  .data     <VERS 0x811AC3AC 0x811AFEEC>
  .data     4
exp_084:
  .binary   00000018

  .data     <VERS 0x811AC3D0 0x811AFF10>
  .data     4
exp_085:
  .binary   0000001a

  .data     <VERS 0x811AC3F4 0x811AFF34>
  .data     4
exp_086:
  .binary   00000000

  .data     <VERS 0x811AC418 0x811AFF58>
  .data     4
exp_087:
  .binary   00000000

  .data     <VERS 0x811AC43C 0x811AFF7C>
  .data     4
exp_088:
  .binary   00000000

  .data     <VERS 0x811AC460 0x811AFFA0>
  .data     4
exp_089:
  .binary   00000000

  .data     <VERS 0x811AC484 0x811AFFC4>
  .data     4
exp_090:
  .binary   00000000

  .data     <VERS 0x811AC4A8 0x811AFFE8>
  .data     4
exp_091:
  .binary   00000000

  .data     <VERS 0x811AC4CC 0x811B000C>
  .data     4
exp_092:
  .binary   00000000

  .data     <VERS 0x811AC4F0 0x811B0030>
  .data     4
exp_093:
  .binary   00000000

  .data     <VERS 0x811AC514 0x811B0054>
  .data     4
exp_094:
  .binary   00000000

  .data     <VERS 0x811AC538 0x811B0078>
  .data     4
exp_095:
  .binary   00000000

  .data     <VERS 0x811AC55C 0x811B009C>
  .data     4
exp_096:
  .binary   00000024

  .data     <VERS 0x811AC580 0x811B00C0>
  .data     4
exp_097:
  .binary   0000002b

  .data     <VERS 0x811AC5A4 0x811B00E4>
  .data     4
exp_098:
  .binary   0000002a

  .data     <VERS 0x811AC5C8 0x811B0108>
  .data     4
exp_099:
  .binary   0000002d

  .data     <VERS 0x811AC5EC 0x811B012C>
  .data     4
exp_100:
  .binary   00000031

  .data     <VERS 0x811AC610 0x811B0150>
  .data     4
exp_101:
  .binary   00000103

  .data     <VERS 0x811AC634 0x811B0174>
  .data     4
exp_102:
  .binary   00000046

  .data     <VERS 0x811AC658 0x811B0198>
  .data     4
exp_103:
  .binary   0000003a

  .data     <VERS 0x811AC67C 0x811B01BC>
  .data     4
exp_104:
  .binary   0000003a

  .data     <VERS 0x811AC6A0 0x811B01E0>
  .data     4
exp_105:
  .binary   0000003c

  .data     <VERS 0x811AC6C4 0x811B0204>
  .data     4
exp_106:
  .binary   0000004e

  .data     <VERS 0x811AC6E8 0x811B0228>
  .data     4
exp_107:
  .binary   00000028

  .data     <VERS 0x811AC70C 0x811B024C>
  .data     4
exp_108:
  .binary   00000028

  .data     <VERS 0x811AC730 0x811B0270>
  .data     4
exp_109:
  .binary   00000061

  .data     <VERS 0x811AC754 0x811B0294>
  .data     4
exp_110:
  .binary   00000054

  .data     <VERS 0x811AC778 0x811B02B8>
  .data     4
exp_111:
  .binary   00000c80

  .data     <VERS 0x811AC79C 0x811B02DC>
  .data     4
exp_112:
  .binary   00000019

  .data     <VERS 0x811AC7C0 0x811B0300>
  .data     4
exp_113:
  .binary   00000004

  .data     <VERS 0x811AC7E4 0x811B0324>
  .data     4
exp_114:
  .binary   00000960

  .data     <VERS 0x811AC808 0x811B0348>
  .data     4
exp_115:
  .binary   0000004b

  .data     <VERS 0x811AC82C 0x811B036C>
  .data     4
exp_116:
  .binary   00000000

  .data     <VERS 0x811AC850 0x811B0390>
  .data     4
exp_117:
  .binary   00000000

  .data     <VERS 0x811AC874 0x811B03B4>
  .data     4
exp_118:
  .binary   00000000

  .data     <VERS 0x811AC898 0x811B03D8>
  .data     4
exp_119:
  .binary   00000000

  .data     <VERS 0x811AC8BC 0x811B03FC>
  .data     4
exp_120:
  .binary   00000028

  .data     <VERS 0x811AC8E0 0x811B0420>
  .data     4
exp_121:
  .binary   000000b8

  .data     <VERS 0x811AC904 0x811B0444>
  .data     4
exp_122:
  .binary   00000039

  .data     <VERS 0x811AC928 0x811B0468>
  .data     4
exp_123:
  .binary   0000000b

  .data     <VERS 0x811AC94C 0x811B048C>
  .data     4
exp_124:
  .binary   0000003d

  .data     <VERS 0x811AC970 0x811B04B0>
  .data     4
exp_125:
  .binary   00000043

  .data     <VERS 0x811AC994 0x811B04D4>
  .data     4
exp_126:
  .binary   00000040

  .data     <VERS 0x811AC9B8 0x811B04F8>
  .data     4
exp_127:
  .binary   0000004d

  .data     <VERS 0x811AC9DC 0x811B051C>
  .data     4
exp_128:
  .binary   0000002b

  .data     <VERS 0x811ACA00 0x811B0540>
  .data     4
exp_129:
  .binary   00000000

  .data     <VERS 0x811ACA24 0x811B0564>
  .data     4
exp_130:
  .binary   00000000

  .data     <VERS 0x811ACA48 0x811B0588>
  .data     4
exp_131:
  .binary   00000000

  .data     <VERS 0x811ACA6C 0x811B05AC>
  .data     4
exp_132:
  .binary   00000000

  .data     <VERS 0x811ACA90 0x811B05D0>
  .data     4
exp_133:
  .binary   00000ed8

  .data     <VERS 0x811ACAB4 0x811B05F4>
  .data     4
exp_134:
  .binary   00000000

  .data     <VERS 0x811ACAD8 0x811B0618>
  .data     4
exp_135:
  .binary   00000000

  .data     <VERS 0x811ACAFC 0x811B063C>
  .data     4
exp_136:
  .binary   00000000

  .data     <VERS 0x811ACB20 0x811B0660>
  .data     4
exp_137:
  .binary   00000000

  .data     <VERS 0x811ACB44 0x811B0684>
  .data     4
exp_138:
  .binary   00000000

  .data     <VERS 0x811ACB68 0x811B06A8>
  .data     4
exp_139:
  .binary   00000000

  .data     <VERS 0x811ACB8C 0x811B06CC>
  .data     4
exp_140:
  .binary   00000000

  .data     <VERS 0x811ACBB0 0x811B06F0>
  .data     4
exp_141:
  .binary   00000000

  .data     <VERS 0x811ACBD4 0x811B0714>
  .data     4
exp_142:
  .binary   00000000

  .data     <VERS 0x811ACBF8 0x811B0738>
  .data     4
exp_143:
  .binary   00000000

  .data     <VERS 0x811ACC1C 0x811B075C>
  .data     4
exp_144:
  .binary   00000031

  .data     <VERS 0x811ACC40 0x811B0780>
  .data     4
exp_145:
  .binary   0000001a

  .data     <VERS 0x811ACC64 0x811B07A4>
  .data     4
exp_146:
  .binary   00000017

  .data     <VERS 0x811ACC88 0x811B07C8>
  .data     4
exp_147:
  .binary   00000017

  .data     <VERS 0x811ACCAC 0x811B07EC>
  .data     4
exp_148:
  .binary   00000103

  .data     <VERS 0x811ACCD0 0x811B0810>
  .data     4
exp_149:
  .binary   00000005

  .data     <VERS 0x811ACCF4 0x811B0834>
  .data     4
exp_150:
  .binary   00000000

  .data     <VERS 0x811ACD18 0x811B0858>
  .data     4
exp_151:
  .binary   00000000

  .data     <VERS 0x811ACD3C 0x811B087C>
  .data     4
exp_152:
  .binary   00001f40

  .data     <VERS 0x811ACD60 0x811B08A0>
  .data     4
exp_153:
  .binary   00000005

  .data     <VERS 0x811ACD84 0x811B08C4>
  .data     4
exp_154:
  .binary   00000000

  .data     <VERS 0x811ACDA8 0x811B08E8>
  .data     4
exp_155:
  .binary   00000000

  .data     <VERS 0x811ACDCC 0x811B090C>
  .data     4
exp_156:
  .binary   00000000

  .data     <VERS 0x811ACDF0 0x811B0930>
  .data     4
exp_157:
  .binary   00000000

  .data     <VERS 0x811ACE14 0x811B0954>
  .data     4
exp_158:
  .binary   00000000

  .data     <VERS 0x811ACE38 0x811B0978>
  .data     4
exp_159:
  .binary   00000000

  .data     <VERS 0x811ACE5C 0x811B099C>
  .data     4
exp_160:
  .binary   00000000

  .data     <VERS 0x811ACE80 0x811B09C0>
  .data     4
exp_161:
  .binary   00000000

  .data     <VERS 0x811ACEA4 0x811B09E4>
  .data     4
exp_162:
  .binary   00000000

  .data     <VERS 0x811ACEC8 0x811B0A08>
  .data     4
exp_163:
  .binary   00000000

  .data     <VERS 0x811ACEEC 0x811B0A2C>
  .data     4
exp_164:
  .binary   00000000

  .data     <VERS 0x811ACF10 0x811B0A50>
  .data     4
exp_165:
  .binary   00000000

  .data     <VERS 0x811ACF34 0x811B0A74>
  .data     4
exp_166:
  .binary   00000000

  .data     <VERS 0x811ACF58 0x811B0A98>
  .data     4
exp_167:
  .binary   00000000

  .data     <VERS 0x811ACF7C 0x811B0ABC>
  .data     4
exp_168:
  .binary   00000000

  .data     <VERS 0x811ACFA0 0x811B0AE0>
  .data     4
exp_169:
  .binary   00000038

  .data     <VERS 0x811ACFC4 0x811B0B04>
  .data     4
exp_170:
  .binary   000000b8

  .data     <VERS 0x811ACFE8 0x811B0B28>
  .data     4
exp_171:
  .binary   0000002a

  .data     <VERS 0x811AD00C 0x811B0B4C>
  .data     4
exp_172:
  .binary   0000002b

  .data     <VERS 0x811AD030 0x811B0B70>
  .data     4
exp_173:
  .binary   0000002d

  .data     <VERS 0x811AD054 0x811B0B94>
  .data     4
exp_174:
  .binary   00000040

  .data     <VERS 0x811AD078 0x811B0BB8>
  .data     4
exp_175:
  .binary   00000031

  .data     <VERS 0x811AD09C 0x811B0BDC>
  .data     4
exp_176:
  .binary   00000034

  .data     <VERS 0x811AD0C0 0x811B0C00>
  .data     4
exp_177:
  .binary   00000037

  .data     <VERS 0x811AD0E4 0x811B0C24>
  .data     4
exp_178:
  .binary   00000051

  .data     <VERS 0x811AD108 0x811B0C48>
  .data     4
exp_179:
  .binary   00000043

  .data     <VERS 0x811AD12C 0x811B0C6C>
  .data     4
exp_180:
  .binary   00000046

  .data     <VERS 0x811AD150 0x811B0C90>
  .data     4
exp_181:
  .binary   00000049

  .data     <VERS 0x811AD174 0x811B0CB4>
  .data     4
exp_182:
  .binary   00000000

  .data     <VERS 0x811AD198 0x811B0CD8>
  .data     4
exp_183:
  .binary   00000000

  .data     <VERS 0x811AD1BC 0x811B0CFC>
  .data     4
exp_184:
  .binary   00000000

  .data     <VERS 0x811AD1E0 0x811B0D20>
  .data     4
exp_185:
  .binary   00000000

  .data     <VERS 0x811AD204 0x811B0D44>
  .data     4
exp_186:
  .binary   00000000

  .data     <VERS 0x811AD228 0x811B0D68>
  .data     4
exp_187:
  .binary   00000000

  .data     <VERS 0x811AD24C 0x811B0D8C>
  .data     4
exp_188:
  .binary   00000000

  .data     <VERS 0x811AD270 0x811B0DB0>
  .data     4
exp_189:
  .binary   00000000

  .data     <VERS 0x811AD294 0x811B0DD4>
  .data     4
exp_190:
  .binary   00000000

  .data     <VERS 0x811AD2B8 0x811B0DF8>
  .data     4
exp_191:
  .binary   00000000

  .data     <VERS 0x811AD2DC 0x811B0E1C>
  .data     4
exp_192:
  .binary   00000052

  .data     <VERS 0x811AD300 0x811B0E40>
  .data     4
exp_193:
  .binary   0000005c

  .data     <VERS 0x811AD324 0x811B0E64>
  .data     4
exp_194:
  .binary   0000005a

  .data     <VERS 0x811AD348 0x811B0E88>
  .data     4
exp_195:
  .binary   0000005e

  .data     <VERS 0x811AD36C 0x811B0EAC>
  .data     4
exp_196:
  .binary   00000064

  .data     <VERS 0x811AD390 0x811B0ED0>
  .data     4
exp_197:
  .binary   0000017c

  .data     <VERS 0x811AD3B4 0x811B0EF4>
  .data     4
exp_198:
  .binary   00000089

  .data     <VERS 0x811AD3D8 0x811B0F18>
  .data     4
exp_199:
  .binary   00000070

  .data     <VERS 0x811AD3FC 0x811B0F3C>
  .data     4
exp_200:
  .binary   00000070

  .data     <VERS 0x811AD420 0x811B0F60>
  .data     4
exp_201:
  .binary   00000072

  .data     <VERS 0x811AD444 0x811B0F84>
  .data     4
exp_202:
  .binary   00000094

  .data     <VERS 0x811AD468 0x811B0FA8>
  .data     4
exp_203:
  .binary   00000058

  .data     <VERS 0x811AD48C 0x811B0FCC>
  .data     4
exp_204:
  .binary   00000058

  .data     <VERS 0x811AD4B0 0x811B0FF0>
  .data     4
exp_205:
  .binary   00000096

  .data     <VERS 0x811AD4D4 0x811B1014>
  .data     4
exp_206:
  .binary   00000090

  .data     <VERS 0x811AD4F8 0x811B1038>
  .data     4
exp_207:
  .binary   000021fc

  .data     <VERS 0x811AD51C 0x811B105C>
  .data     4
exp_208:
  .binary   0000001e

  .data     <VERS 0x811AD540 0x811B1080>
  .data     4
exp_209:
  .binary   00000008

  .data     <VERS 0x811AD564 0x811B10A4>
  .data     4
exp_210:
  .binary   00001f2c

  .data     <VERS 0x811AD588 0x811B10C8>
  .data     4
exp_211:
  .binary   0000008f

  .data     <VERS 0x811AD5AC 0x811B10EC>
  .data     4
exp_212:
  .binary   00000000

  .data     <VERS 0x811AD5D0 0x811B1110>
  .data     4
exp_213:
  .binary   00000000

  .data     <VERS 0x811AD5F4 0x811B1134>
  .data     4
exp_214:
  .binary   00000000

  .data     <VERS 0x811AD618 0x811B1158>
  .data     4
exp_215:
  .binary   00000000

  .data     <VERS 0x811AD63C 0x811B117C>
  .data     4
exp_216:
  .binary   00000058

  .data     <VERS 0x811AD660 0x811B11A0>
  .data     4
exp_217:
  .binary   00000118

  .data     <VERS 0x811AD684 0x811B11C4>
  .data     4
exp_218:
  .binary   00000078

  .data     <VERS 0x811AD6A8 0x811B11E8>
  .data     4
exp_219:
  .binary   00000016

  .data     <VERS 0x811AD6CC 0x811B120C>
  .data     4
exp_220:
  .binary   00000074

  .data     <VERS 0x811AD6F0 0x811B1230>
  .data     4
exp_221:
  .binary   0000007c

  .data     <VERS 0x811AD714 0x811B1254>
  .data     4
exp_222:
  .binary   00000078

  .data     <VERS 0x811AD738 0x811B1278>
  .data     4
exp_223:
  .binary   00000080

  .data     <VERS 0x811AD75C 0x811B129C>
  .data     4
exp_224:
  .binary   0000005c

  .data     <VERS 0x811AD780 0x811B12C0>
  .data     4
exp_225:
  .binary   00000000

  .data     <VERS 0x811AD7A4 0x811B12E4>
  .data     4
exp_226:
  .binary   00000000

  .data     <VERS 0x811AD7C8 0x811B1308>
  .data     4
exp_227:
  .binary   00000000

  .data     <VERS 0x811AD7EC 0x811B132C>
  .data     4
exp_228:
  .binary   00000000

  .data     <VERS 0x811AD810 0x811B1350>
  .data     4
exp_229:
  .binary   00002b5c

  .data     <VERS 0x811AD834 0x811B1374>
  .data     4
exp_230:
  .binary   00000000

  .data     <VERS 0x811AD858 0x811B1398>
  .data     4
exp_231:
  .binary   00000000

  .data     <VERS 0x811AD87C 0x811B13BC>
  .data     4
exp_232:
  .binary   00000000

  .data     <VERS 0x811AD8A0 0x811B13E0>
  .data     4
exp_233:
  .binary   00000000

  .data     <VERS 0x811AD8C4 0x811B1404>
  .data     4
exp_234:
  .binary   00000000

  .data     <VERS 0x811AD8E8 0x811B1428>
  .data     4
exp_235:
  .binary   00000000

  .data     <VERS 0x811AD90C 0x811B144C>
  .data     4
exp_236:
  .binary   00000000

  .data     <VERS 0x811AD930 0x811B1470>
  .data     4
exp_237:
  .binary   00000000

  .data     <VERS 0x811AD954 0x811B1494>
  .data     4
exp_238:
  .binary   00000000

  .data     <VERS 0x811AD978 0x811B14B8>
  .data     4
exp_239:
  .binary   00000000

  .data     <VERS 0x811AD99C 0x811B14DC>
  .data     4
exp_240:
  .binary   00000064

  .data     <VERS 0x811AD9C0 0x811B1500>
  .data     4
exp_241:
  .binary   00000034

  .data     <VERS 0x811AD9E4 0x811B1524>
  .data     4
exp_242:
  .binary   00000030

  .data     <VERS 0x811ADA08 0x811B1548>
  .data     4
exp_243:
  .binary   00000030

  .data     <VERS 0x811ADA2C 0x811B156C>
  .data     4
exp_244:
  .binary   0000017c

  .data     <VERS 0x811ADA50 0x811B1590>
  .data     4
exp_245:
  .binary   00000009

  .data     <VERS 0x811ADA74 0x811B15B4>
  .data     4
exp_246:
  .binary   00000000

  .data     <VERS 0x811ADA98 0x811B15D8>
  .data     4
exp_247:
  .binary   00000000

  .data     <VERS 0x811ADABC 0x811B15FC>
  .data     4
exp_248:
  .binary   00003e80

  .data     <VERS 0x811ADAE0 0x811B1620>
  .data     4
exp_249:
  .binary   00000009

  .data     <VERS 0x811ADB04 0x811B1644>
  .data     4
exp_250:
  .binary   00000000

  .data     <VERS 0x811ADB28 0x811B1668>
  .data     4
exp_251:
  .binary   00000000

  .data     <VERS 0x811ADB4C 0x811B168C>
  .data     4
exp_252:
  .binary   00000000

  .data     <VERS 0x811ADB70 0x811B16B0>
  .data     4
exp_253:
  .binary   00000000

  .data     <VERS 0x811ADB94 0x811B16D4>
  .data     4
exp_254:
  .binary   00000000

  .data     <VERS 0x811ADBB8 0x811B16F8>
  .data     4
exp_255:
  .binary   00000000

  .data     <VERS 0x811ADBDC 0x811B171C>
  .data     4
exp_256:
  .binary   00000000

  .data     <VERS 0x811ADC00 0x811B1740>
  .data     4
exp_257:
  .binary   00000000

  .data     <VERS 0x811ADC24 0x811B1764>
  .data     4
exp_258:
  .binary   00000000

  .data     <VERS 0x811ADC48 0x811B1788>
  .data     4
exp_259:
  .binary   00000000

  .data     <VERS 0x811ADC6C 0x811B17AC>
  .data     4
exp_260:
  .binary   00000000

  .data     <VERS 0x811ADC90 0x811B17D0>
  .data     4
exp_261:
  .binary   00000000

  .data     <VERS 0x811ADCB4 0x811B17F4>
  .data     4
exp_262:
  .binary   00000000

  .data     <VERS 0x811ADCD8 0x811B1818>
  .data     4
exp_263:
  .binary   00000000

  .data     <VERS 0x811ADCFC 0x811B183C>
  .data     4
exp_264:
  .binary   00000000

  .data     <VERS 0x811ADD20 0x811B1860>
  .data     4
exp_265:
  .binary   0000006f

  .data     <VERS 0x811ADD44 0x811B1884>
  .data     4
exp_266:
  .binary   00000118

  .data     <VERS 0x811ADD68 0x811B18A8>
  .data     4
exp_267:
  .binary   0000005a

  .data     <VERS 0x811ADD8C 0x811B18CC>
  .data     4
exp_268:
  .binary   0000005c

  .data     <VERS 0x811ADDB0 0x811B18F0>
  .data     4
exp_269:
  .binary   0000005e

  .data     <VERS 0x811ADDD4 0x811B1914>
  .data     4
exp_270:
  .binary   0000007d

  .data     <VERS 0x811ADDF8 0x811B1938>
  .data     4
exp_271:
  .binary   00000064

  .data     <VERS 0x811ADE1C 0x811B195C>
  .data     4
exp_272:
  .binary   00000068

  .data     <VERS 0x811ADE40 0x811B1980>
  .data     4
exp_273:
  .binary   0000006c

  .data     <VERS 0x811ADE64 0x811B19A4>
  .data     4
exp_274:
  .binary   00000096

  .data     <VERS 0x811ADE88 0x811B19C8>
  .data     4
exp_275:
  .binary   0000007c

  .data     <VERS 0x811ADEAC 0x811B19EC>
  .data     4
exp_276:
  .binary   00000080

  .data     <VERS 0x811ADED0 0x811B1A10>
  .data     4
exp_277:
  .binary   00000084

  .data     <VERS 0x811ADEF4 0x811B1A34>
  .data     4
exp_278:
  .binary   00000000

  .data     <VERS 0x811ADF18 0x811B1A58>
  .data     4
exp_279:
  .binary   00000000

  .data     <VERS 0x811ADF3C 0x811B1A7C>
  .data     4
exp_280:
  .binary   00000000

  .data     <VERS 0x811ADF60 0x811B1AA0>
  .data     4
exp_281:
  .binary   00000000

  .data     <VERS 0x811ADF84 0x811B1AC4>
  .data     4
exp_282:
  .binary   00000000

  .data     <VERS 0x811ADFA8 0x811B1AE8>
  .data     4
exp_283:
  .binary   00000000

  .data     <VERS 0x811ADFCC 0x811B1B0C>
  .data     4
exp_284:
  .binary   00000000

  .data     <VERS 0x811ADFF0 0x811B1B30>
  .data     4
exp_285:
  .binary   00000000

  .data     <VERS 0x811AE014 0x811B1B54>
  .data     4
exp_286:
  .binary   00000000

  .data     <VERS 0x811AE038 0x811B1B78>
  .data     4
exp_287:
  .binary   00000000

  .data     <VERS 0x811AE05C 0x811B1B9C>
  .data     4
exp_288:
  .binary   00000091

  .data     <VERS 0x811AE080 0x811B1BC0>
  .data     4
exp_289:
  .binary   0000010e

  .data     <VERS 0x811AE0A4 0x811B1BE4>
  .data     4
exp_290:
  .binary   00000113

  .data     <VERS 0x811AE0C8 0x811B1C08>
  .data     4
exp_291:
  .binary   00000118

  .data     <VERS 0x811AE0EC 0x811B1C2C>
  .data     4
exp_292:
  .binary   00000127

  .data     <VERS 0x811AE110 0x811B1C50>
  .data     4
exp_293:
  .binary   00000384

  .data     <VERS 0x811AE134 0x811B1C74>
  .data     4
exp_294:
  .binary   0000015e

  .data     <VERS 0x811AE158 0x811B1C98>
  .data     4
exp_295:
  .binary   00000140

  .data     <VERS 0x811AE17C 0x811B1CBC>
  .data     4
exp_296:
  .binary   00000140

  .data     <VERS 0x811AE1A0 0x811B1CE0>
  .data     4
exp_297:
  .binary   00000145

  .data     <VERS 0x811AE1C4 0x811B1D04>
  .data     4
exp_298:
  .binary   0000016b

  .data     <VERS 0x811AE1E8 0x811B1D28>
  .data     4
exp_299:
  .binary   00000064

  .data     <VERS 0x811AE20C 0x811B1D4C>
  .data     4
exp_300:
  .binary   00000064

  .data     <VERS 0x811AE230 0x811B1D70>
  .data     4
exp_301:
  .binary   00000181

  .data     <VERS 0x811AE254 0x811B1D94>
  .data     4
exp_302:
  .binary   00000174

  .data     <VERS 0x811AE278 0x811B1DB8>
  .data     4
exp_303:
  .binary   00004970

  .data     <VERS 0x811AE29C 0x811B1DDC>
  .data     4
exp_304:
  .binary   0000003c

  .data     <VERS 0x811AE2C0 0x811B1E00>
  .data     4
exp_305:
  .binary   00000010

  .data     <VERS 0x811AE2E4 0x811B1E24>
  .data     4
exp_306:
  .binary   00003e1c

  .data     <VERS 0x811AE308 0x811B1E48>
  .data     4
exp_307:
  .binary   00000158

  .data     <VERS 0x811AE32C 0x811B1E6C>
  .data     4
exp_308:
  .binary   00000000

  .data     <VERS 0x811AE350 0x811B1E90>
  .data     4
exp_309:
  .binary   00000000

  .data     <VERS 0x811AE374 0x811B1EB4>
  .data     4
exp_310:
  .binary   00000000

  .data     <VERS 0x811AE398 0x811B1ED8>
  .data     4
exp_311:
  .binary   00000000

  .data     <VERS 0x811AE3BC 0x811B1EFC>
  .data     4
exp_312:
  .binary   00000100

  .data     <VERS 0x811AE3E0 0x811B1F20>
  .data     4
exp_313:
  .binary   000002bc

  .data     <VERS 0x811AE404 0x811B1F44>
  .data     4
exp_314:
  .binary   00000140

  .data     <VERS 0x811AE428 0x811B1F68>
  .data     4
exp_315:
  .binary   0000003b

  .data     <VERS 0x811AE44C 0x811B1F8C>
  .data     4
exp_316:
  .binary   00000141

  .data     <VERS 0x811AE470 0x811B1FB0>
  .data     4
exp_317:
  .binary   00000163

  .data     <VERS 0x811AE494 0x811B1FD4>
  .data     4
exp_318:
  .binary   0000014e

  .data     <VERS 0x811AE4B8 0x811B1FF8>
  .data     4
exp_319:
  .binary   0000014e

  .data     <VERS 0x811AE4DC 0x811B201C>
  .data     4
exp_320:
  .binary   00000111

  .data     <VERS 0x811AE500 0x811B2040>
  .data     4
exp_321:
  .binary   00000000

  .data     <VERS 0x811AE524 0x811B2064>
  .data     4
exp_322:
  .binary   00000000

  .data     <VERS 0x811AE548 0x811B2088>
  .data     4
exp_323:
  .binary   00000000

  .data     <VERS 0x811AE56C 0x811B20AC>
  .data     4
exp_324:
  .binary   00000000

  .data     <VERS 0x811AE590 0x811B20D0>
  .data     4
exp_325:
  .binary   00005bcc

  .data     <VERS 0x811AE5B4 0x811B20F4>
  .data     4
exp_326:
  .binary   00000000

  .data     <VERS 0x811AE5D8 0x811B2118>
  .data     4
exp_327:
  .binary   00000000

  .data     <VERS 0x811AE5FC 0x811B213C>
  .data     4
exp_328:
  .binary   00000000

  .data     <VERS 0x811AE620 0x811B2160>
  .data     4
exp_329:
  .binary   00000000

  .data     <VERS 0x811AE644 0x811B2184>
  .data     4
exp_330:
  .binary   00000000

  .data     <VERS 0x811AE668 0x811B21A8>
  .data     4
exp_331:
  .binary   00000000

  .data     <VERS 0x811AE68C 0x811B21CC>
  .data     4
exp_332:
  .binary   00000000

  .data     <VERS 0x811AE6B0 0x811B21F0>
  .data     4
exp_333:
  .binary   00000000

  .data     <VERS 0x811AE6D4 0x811B2214>
  .data     4
exp_334:
  .binary   00000000

  .data     <VERS 0x811AE6F8 0x811B2238>
  .data     4
exp_335:
  .binary   00000000

  .data     <VERS 0x811AE71C 0x811B225C>
  .data     4
exp_336:
  .binary   00000122

  .data     <VERS 0x811AE740 0x811B2280>
  .data     4
exp_337:
  .binary   000000c3

  .data     <VERS 0x811AE764 0x811B22A4>
  .data     4
exp_338:
  .binary   000000b4

  .data     <VERS 0x811AE788 0x811B22C8>
  .data     4
exp_339:
  .binary   000000b4

  .data     <VERS 0x811AE7AC 0x811B22EC>
  .data     4
exp_340:
  .binary   00000370

  .data     <VERS 0x811AE7D0 0x811B2310>
  .data     4
exp_341:
  .binary   00000019

  .data     <VERS 0x811AE7F4 0x811B2334>
  .data     4
exp_342:
  .binary   00000000

  .data     <VERS 0x811AE818 0x811B2358>
  .data     4
exp_343:
  .binary   00000000

  .data     <VERS 0x811AE83C 0x811B237C>
  .data     4
exp_344:
  .binary   0000c350

  .data     <VERS 0x811AE860 0x811B23A0>
  .data     4
exp_345:
  .binary   00000014

  .data     <VERS 0x811AE884 0x811B23C4>
  .data     4
exp_346:
  .binary   00000000

  .data     <VERS 0x811AE8A8 0x811B23E8>
  .data     4
exp_347:
  .binary   00000000

  .data     <VERS 0x811AE8CC 0x811B240C>
  .data     4
exp_348:
  .binary   00000000

  .data     <VERS 0x811AE8F0 0x811B2430>
  .data     4
exp_349:
  .binary   00000000

  .data     <VERS 0x811AE914 0x811B2454>
  .data     4
exp_350:
  .binary   00000000

  .data     <VERS 0x811AE938 0x811B2478>
  .data     4
exp_351:
  .binary   00000000

  .data     <VERS 0x811AE95C 0x811B249C>
  .data     4
exp_352:
  .binary   00000000

  .data     <VERS 0x811AE980 0x811B24C0>
  .data     4
exp_353:
  .binary   00000000

  .data     <VERS 0x811AE9A4 0x811B24E4>
  .data     4
exp_354:
  .binary   00000000

  .data     <VERS 0x811AE9C8 0x811B2508>
  .data     4
exp_355:
  .binary   00000000

  .data     <VERS 0x811AE9EC 0x811B252C>
  .data     4
exp_356:
  .binary   00000000

  .data     <VERS 0x811AEA10 0x811B2550>
  .data     4
exp_357:
  .binary   00000000

  .data     <VERS 0x811AEA34 0x811B2574>
  .data     4
exp_358:
  .binary   00000000

  .data     <VERS 0x811AEA58 0x811B2598>
  .data     4
exp_359:
  .binary   00000000

  .data     <VERS 0x811AEA7C 0x811B25BC>
  .data     4
exp_360:
  .binary   00000000

  .data     <VERS 0x811AEAA0 0x811B25E0>
  .data     4
exp_361:
  .binary   0000012c

  .data     <VERS 0x811AEAC4 0x811B2604>
  .data     4
exp_362:
  .binary   000002b2

  .data     <VERS 0x811AEAE8 0x811B2628>
  .data     4
exp_363:
  .binary   0000010f

  .data     <VERS 0x811AEB0C 0x811B264C>
  .data     4
exp_364:
  .binary   00000114

  .data     <VERS 0x811AEB30 0x811B2670>
  .data     4
exp_365:
  .binary   0000010c

  .data     <VERS 0x811AEB54 0x811B2694>
  .data     4
exp_366:
  .binary   0000014d

  .data     <VERS 0x811AEB78 0x811B26B8>
  .data     4
exp_367:
  .binary   00000127

  .data     <VERS 0x811AEB9C 0x811B26DC>
  .data     4
exp_368:
  .binary   0000012f

  .data     <VERS 0x811AEBC0 0x811B2700>
  .data     4
exp_369:
  .binary   0000013e

  .data     <VERS 0x811AEBE4 0x811B2724>
  .data     4
exp_370:
  .binary   00000177

  .data     <VERS 0x811AEC08 0x811B2748>
  .data     4
exp_371:
  .binary   00000153

  .data     <VERS 0x811AEC2C 0x811B276C>
  .data     4
exp_372:
  .binary   00000159

  .data     <VERS 0x811AEC50 0x811B2790>
  .data     4
exp_373:
  .binary   00000164
