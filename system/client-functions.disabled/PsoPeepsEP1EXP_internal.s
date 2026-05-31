.meta key="PsoPeepsEP1EXP_internal"
.meta name="INTERNAL GC V3 Episode 1 EXP table template"
.meta client_flag="0x0000200000000000"
.meta description="Internal: 1x GC V3 Episode 1 EXP table template. Server scales rows 0-373 from GCV3EXPMultiplier before sending."

.versions 3OE2

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

  .data     0x811AB7DC
  .data     4
exp_000:
  .binary   00000001

  .data     0x811AB800
  .data     4
exp_001:
  .binary   00000006

  .data     0x811AB824
  .data     4
exp_002:
  .binary   00000005

  .data     0x811AB848
  .data     4
exp_003:
  .binary   00000007

  .data     0x811AB86C
  .data     4
exp_004:
  .binary   0000000a

  .data     0x811AB890
  .data     4
exp_005:
  .binary   00000096

  .data     0x811AB8B4
  .data     4
exp_006:
  .binary   00000019

  .data     0x811AB8D8
  .data     4
exp_007:
  .binary   00000010

  .data     0x811AB8FC
  .data     4
exp_008:
  .binary   00000010

  .data     0x811AB920
  .data     4
exp_009:
  .binary   00000011

  .data     0x811AB944
  .data     4
exp_010:
  .binary   0000001d

  .data     0x811AB968
  .data     4
exp_011:
  .binary   00000004

  .data     0x811AB98C
  .data     4
exp_012:
  .binary   00000004

  .data     0x811AB9B0
  .data     4
exp_013:
  .binary   00000023

  .data     0x811AB9D4
  .data     4
exp_014:
  .binary   00000023

  .data     0x811AB9F8
  .data     4
exp_015:
  .binary   0000037a

  .data     0x811ABA1C
  .data     4
exp_016:
  .binary   0000000a

  .data     0x811ABA40
  .data     4
exp_017:
  .binary   0000000a

  .data     0x811ABA64
  .data     4
exp_018:
  .binary   00000190

  .data     0x811ABA88
  .data     4
exp_019:
  .binary   0000001c

  .data     0x811ABAAC
  .data     4
exp_020:
  .binary   00000000

  .data     0x811ABAD0
  .data     4
exp_021:
  .binary   00000000

  .data     0x811ABAF4
  .data     4
exp_022:
  .binary   00000000

  .data     0x811ABB18
  .data     4
exp_023:
  .binary   00000000

  .data     0x811ABB3C
  .data     4
exp_024:
  .binary   00000004

  .data     0x811ABB60
  .data     4
exp_025:
  .binary   00000064

  .data     0x811ABB84
  .data     4
exp_026:
  .binary   0000000f

  .data     0x811ABBA8
  .data     4
exp_027:
  .binary   00000003

  .data     0x811ABBCC
  .data     4
exp_028:
  .binary   00000012

  .data     0x811ABBF0
  .data     4
exp_029:
  .binary   00000016

  .data     0x811ABC14
  .data     4
exp_030:
  .binary   00000014

  .data     0x811ABC38
  .data     4
exp_031:
  .binary   0000001b

  .data     0x811ABC5C
  .data     4
exp_032:
  .binary   00000006

  .data     0x811ABC80
  .data     4
exp_033:
  .binary   00000000

  .data     0x811ABCA4
  .data     4
exp_034:
  .binary   00000000

  .data     0x811ABCC8
  .data     4
exp_035:
  .binary   00000000

  .data     0x811ABCEC
  .data     4
exp_036:
  .binary   00000000

  .data     0x811ABD10
  .data     4
exp_037:
  .binary   000004e2

  .data     0x811ABD34
  .data     4
exp_038:
  .binary   00000000

  .data     0x811ABD58
  .data     4
exp_039:
  .binary   00000000

  .data     0x811ABD7C
  .data     4
exp_040:
  .binary   00000000

  .data     0x811ABDA0
  .data     4
exp_041:
  .binary   00000000

  .data     0x811ABDC4
  .data     4
exp_042:
  .binary   00000000

  .data     0x811ABDE8
  .data     4
exp_043:
  .binary   00000000

  .data     0x811ABE0C
  .data     4
exp_044:
  .binary   00000000

  .data     0x811ABE30
  .data     4
exp_045:
  .binary   00000000

  .data     0x811ABE54
  .data     4
exp_046:
  .binary   00000000

  .data     0x811ABE78
  .data     4
exp_047:
  .binary   00000000

  .data     0x811ABE9C
  .data     4
exp_048:
  .binary   0000000a

  .data     0x811ABEC0
  .data     4
exp_049:
  .binary   00000006

  .data     0x811ABEE4
  .data     4
exp_050:
  .binary   00000004

  .data     0x811ABF08
  .data     4
exp_051:
  .binary   00000004

  .data     0x811ABF2C
  .data     4
exp_052:
  .binary   00000096

  .data     0x811ABF50
  .data     4
exp_053:
  .binary   00000005

  .data     0x811ABF74
  .data     4
exp_054:
  .binary   00000000

  .data     0x811ABF98
  .data     4
exp_055:
  .binary   00000bb8

  .data     0x811ABFBC
  .data     4
exp_056:
  .binary   00000000

  .data     0x811ABFE0
  .data     4
exp_057:
  .binary   00000005

  .data     0x811AC004
  .data     4
exp_058:
  .binary   00000000

  .data     0x811AC028
  .data     4
exp_059:
  .binary   00000000

  .data     0x811AC04C
  .data     4
exp_060:
  .binary   00000000

  .data     0x811AC070
  .data     4
exp_061:
  .binary   00000000

  .data     0x811AC094
  .data     4
exp_062:
  .binary   00000000

  .data     0x811AC0B8
  .data     4
exp_063:
  .binary   00000000

  .data     0x811AC0DC
  .data     4
exp_064:
  .binary   00000000

  .data     0x811AC100
  .data     4
exp_065:
  .binary   00000000

  .data     0x811AC124
  .data     4
exp_066:
  .binary   00000000

  .data     0x811AC148
  .data     4
exp_067:
  .binary   00000000

  .data     0x811AC16C
  .data     4
exp_068:
  .binary   00000000

  .data     0x811AC190
  .data     4
exp_069:
  .binary   00000000

  .data     0x811AC1B4
  .data     4
exp_070:
  .binary   00000000

  .data     0x811AC1D8
  .data     4
exp_071:
  .binary   00000000

  .data     0x811AC1FC
  .data     4
exp_072:
  .binary   00000000

  .data     0x811AC220
  .data     4
exp_073:
  .binary   0000000d

  .data     0x811AC244
  .data     4
exp_074:
  .binary   00000064

  .data     0x811AC268
  .data     4
exp_075:
  .binary   00000005

  .data     0x811AC28C
  .data     4
exp_076:
  .binary   00000006

  .data     0x811AC2B0
  .data     4
exp_077:
  .binary   00000007

  .data     0x811AC2D4
  .data     4
exp_078:
  .binary   00000014

  .data     0x811AC2F8
  .data     4
exp_079:
  .binary   0000000a

  .data     0x811AC31C
  .data     4
exp_080:
  .binary   0000000c

  .data     0x811AC340
  .data     4
exp_081:
  .binary   0000000e

  .data     0x811AC364
  .data     4
exp_082:
  .binary   0000001e

  .data     0x811AC388
  .data     4
exp_083:
  .binary   00000016

  .data     0x811AC3AC
  .data     4
exp_084:
  .binary   00000018

  .data     0x811AC3D0
  .data     4
exp_085:
  .binary   0000001a

  .data     0x811AC3F4
  .data     4
exp_086:
  .binary   00000000

  .data     0x811AC418
  .data     4
exp_087:
  .binary   00000000

  .data     0x811AC43C
  .data     4
exp_088:
  .binary   00000000

  .data     0x811AC460
  .data     4
exp_089:
  .binary   00000000

  .data     0x811AC484
  .data     4
exp_090:
  .binary   00000000

  .data     0x811AC4A8
  .data     4
exp_091:
  .binary   00000000

  .data     0x811AC4CC
  .data     4
exp_092:
  .binary   00000000

  .data     0x811AC4F0
  .data     4
exp_093:
  .binary   00000000

  .data     0x811AC514
  .data     4
exp_094:
  .binary   00000000

  .data     0x811AC538
  .data     4
exp_095:
  .binary   00000000

  .data     0x811AC55C
  .data     4
exp_096:
  .binary   00000024

  .data     0x811AC580
  .data     4
exp_097:
  .binary   0000002b

  .data     0x811AC5A4
  .data     4
exp_098:
  .binary   0000002a

  .data     0x811AC5C8
  .data     4
exp_099:
  .binary   0000002d

  .data     0x811AC5EC
  .data     4
exp_100:
  .binary   00000031

  .data     0x811AC610
  .data     4
exp_101:
  .binary   00000103

  .data     0x811AC634
  .data     4
exp_102:
  .binary   00000046

  .data     0x811AC658
  .data     4
exp_103:
  .binary   0000003a

  .data     0x811AC67C
  .data     4
exp_104:
  .binary   0000003a

  .data     0x811AC6A0
  .data     4
exp_105:
  .binary   0000003c

  .data     0x811AC6C4
  .data     4
exp_106:
  .binary   0000004e

  .data     0x811AC6E8
  .data     4
exp_107:
  .binary   00000028

  .data     0x811AC70C
  .data     4
exp_108:
  .binary   00000028

  .data     0x811AC730
  .data     4
exp_109:
  .binary   00000061

  .data     0x811AC754
  .data     4
exp_110:
  .binary   00000054

  .data     0x811AC778
  .data     4
exp_111:
  .binary   00000c80

  .data     0x811AC79C
  .data     4
exp_112:
  .binary   00000019

  .data     0x811AC7C0
  .data     4
exp_113:
  .binary   00000004

  .data     0x811AC7E4
  .data     4
exp_114:
  .binary   00000960

  .data     0x811AC808
  .data     4
exp_115:
  .binary   0000004b

  .data     0x811AC82C
  .data     4
exp_116:
  .binary   00000000

  .data     0x811AC850
  .data     4
exp_117:
  .binary   00000000

  .data     0x811AC874
  .data     4
exp_118:
  .binary   00000000

  .data     0x811AC898
  .data     4
exp_119:
  .binary   00000000

  .data     0x811AC8BC
  .data     4
exp_120:
  .binary   00000028

  .data     0x811AC8E0
  .data     4
exp_121:
  .binary   000000b8

  .data     0x811AC904
  .data     4
exp_122:
  .binary   00000039

  .data     0x811AC928
  .data     4
exp_123:
  .binary   0000000b

  .data     0x811AC94C
  .data     4
exp_124:
  .binary   0000003d

  .data     0x811AC970
  .data     4
exp_125:
  .binary   00000043

  .data     0x811AC994
  .data     4
exp_126:
  .binary   00000040

  .data     0x811AC9B8
  .data     4
exp_127:
  .binary   0000004d

  .data     0x811AC9DC
  .data     4
exp_128:
  .binary   0000002b

  .data     0x811ACA00
  .data     4
exp_129:
  .binary   00000000

  .data     0x811ACA24
  .data     4
exp_130:
  .binary   00000000

  .data     0x811ACA48
  .data     4
exp_131:
  .binary   00000000

  .data     0x811ACA6C
  .data     4
exp_132:
  .binary   00000000

  .data     0x811ACA90
  .data     4
exp_133:
  .binary   00000ed8

  .data     0x811ACAB4
  .data     4
exp_134:
  .binary   00000000

  .data     0x811ACAD8
  .data     4
exp_135:
  .binary   00000000

  .data     0x811ACAFC
  .data     4
exp_136:
  .binary   00000000

  .data     0x811ACB20
  .data     4
exp_137:
  .binary   00000000

  .data     0x811ACB44
  .data     4
exp_138:
  .binary   00000000

  .data     0x811ACB68
  .data     4
exp_139:
  .binary   00000000

  .data     0x811ACB8C
  .data     4
exp_140:
  .binary   00000000

  .data     0x811ACBB0
  .data     4
exp_141:
  .binary   00000000

  .data     0x811ACBD4
  .data     4
exp_142:
  .binary   00000000

  .data     0x811ACBF8
  .data     4
exp_143:
  .binary   00000000

  .data     0x811ACC1C
  .data     4
exp_144:
  .binary   00000031

  .data     0x811ACC40
  .data     4
exp_145:
  .binary   0000001a

  .data     0x811ACC64
  .data     4
exp_146:
  .binary   00000017

  .data     0x811ACC88
  .data     4
exp_147:
  .binary   00000017

  .data     0x811ACCAC
  .data     4
exp_148:
  .binary   00000103

  .data     0x811ACCD0
  .data     4
exp_149:
  .binary   00000005

  .data     0x811ACCF4
  .data     4
exp_150:
  .binary   00000000

  .data     0x811ACD18
  .data     4
exp_151:
  .binary   00000000

  .data     0x811ACD3C
  .data     4
exp_152:
  .binary   00001f40

  .data     0x811ACD60
  .data     4
exp_153:
  .binary   00000005

  .data     0x811ACD84
  .data     4
exp_154:
  .binary   00000000

  .data     0x811ACDA8
  .data     4
exp_155:
  .binary   00000000

  .data     0x811ACDCC
  .data     4
exp_156:
  .binary   00000000

  .data     0x811ACDF0
  .data     4
exp_157:
  .binary   00000000

  .data     0x811ACE14
  .data     4
exp_158:
  .binary   00000000

  .data     0x811ACE38
  .data     4
exp_159:
  .binary   00000000

  .data     0x811ACE5C
  .data     4
exp_160:
  .binary   00000000

  .data     0x811ACE80
  .data     4
exp_161:
  .binary   00000000

  .data     0x811ACEA4
  .data     4
exp_162:
  .binary   00000000

  .data     0x811ACEC8
  .data     4
exp_163:
  .binary   00000000

  .data     0x811ACEEC
  .data     4
exp_164:
  .binary   00000000

  .data     0x811ACF10
  .data     4
exp_165:
  .binary   00000000

  .data     0x811ACF34
  .data     4
exp_166:
  .binary   00000000

  .data     0x811ACF58
  .data     4
exp_167:
  .binary   00000000

  .data     0x811ACF7C
  .data     4
exp_168:
  .binary   00000000

  .data     0x811ACFA0
  .data     4
exp_169:
  .binary   00000038

  .data     0x811ACFC4
  .data     4
exp_170:
  .binary   000000b8

  .data     0x811ACFE8
  .data     4
exp_171:
  .binary   0000002a

  .data     0x811AD00C
  .data     4
exp_172:
  .binary   0000002b

  .data     0x811AD030
  .data     4
exp_173:
  .binary   0000002d

  .data     0x811AD054
  .data     4
exp_174:
  .binary   00000040

  .data     0x811AD078
  .data     4
exp_175:
  .binary   00000031

  .data     0x811AD09C
  .data     4
exp_176:
  .binary   00000034

  .data     0x811AD0C0
  .data     4
exp_177:
  .binary   00000037

  .data     0x811AD0E4
  .data     4
exp_178:
  .binary   00000051

  .data     0x811AD108
  .data     4
exp_179:
  .binary   00000043

  .data     0x811AD12C
  .data     4
exp_180:
  .binary   00000046

  .data     0x811AD150
  .data     4
exp_181:
  .binary   00000049

  .data     0x811AD174
  .data     4
exp_182:
  .binary   00000000

  .data     0x811AD198
  .data     4
exp_183:
  .binary   00000000

  .data     0x811AD1BC
  .data     4
exp_184:
  .binary   00000000

  .data     0x811AD1E0
  .data     4
exp_185:
  .binary   00000000

  .data     0x811AD204
  .data     4
exp_186:
  .binary   00000000

  .data     0x811AD228
  .data     4
exp_187:
  .binary   00000000

  .data     0x811AD24C
  .data     4
exp_188:
  .binary   00000000

  .data     0x811AD270
  .data     4
exp_189:
  .binary   00000000

  .data     0x811AD294
  .data     4
exp_190:
  .binary   00000000

  .data     0x811AD2B8
  .data     4
exp_191:
  .binary   00000000

  .data     0x811AD2DC
  .data     4
exp_192:
  .binary   00000052

  .data     0x811AD300
  .data     4
exp_193:
  .binary   0000005c

  .data     0x811AD324
  .data     4
exp_194:
  .binary   0000005a

  .data     0x811AD348
  .data     4
exp_195:
  .binary   0000005e

  .data     0x811AD36C
  .data     4
exp_196:
  .binary   00000064

  .data     0x811AD390
  .data     4
exp_197:
  .binary   0000017c

  .data     0x811AD3B4
  .data     4
exp_198:
  .binary   00000089

  .data     0x811AD3D8
  .data     4
exp_199:
  .binary   00000070

  .data     0x811AD3FC
  .data     4
exp_200:
  .binary   00000070

  .data     0x811AD420
  .data     4
exp_201:
  .binary   00000072

  .data     0x811AD444
  .data     4
exp_202:
  .binary   00000094

  .data     0x811AD468
  .data     4
exp_203:
  .binary   00000058

  .data     0x811AD48C
  .data     4
exp_204:
  .binary   00000058

  .data     0x811AD4B0
  .data     4
exp_205:
  .binary   00000096

  .data     0x811AD4D4
  .data     4
exp_206:
  .binary   00000090

  .data     0x811AD4F8
  .data     4
exp_207:
  .binary   000021fc

  .data     0x811AD51C
  .data     4
exp_208:
  .binary   0000001e

  .data     0x811AD540
  .data     4
exp_209:
  .binary   00000008

  .data     0x811AD564
  .data     4
exp_210:
  .binary   00001f2c

  .data     0x811AD588
  .data     4
exp_211:
  .binary   0000008f

  .data     0x811AD5AC
  .data     4
exp_212:
  .binary   00000000

  .data     0x811AD5D0
  .data     4
exp_213:
  .binary   00000000

  .data     0x811AD5F4
  .data     4
exp_214:
  .binary   00000000

  .data     0x811AD618
  .data     4
exp_215:
  .binary   00000000

  .data     0x811AD63C
  .data     4
exp_216:
  .binary   00000058

  .data     0x811AD660
  .data     4
exp_217:
  .binary   00000118

  .data     0x811AD684
  .data     4
exp_218:
  .binary   00000078

  .data     0x811AD6A8
  .data     4
exp_219:
  .binary   00000016

  .data     0x811AD6CC
  .data     4
exp_220:
  .binary   00000074

  .data     0x811AD6F0
  .data     4
exp_221:
  .binary   0000007c

  .data     0x811AD714
  .data     4
exp_222:
  .binary   00000078

  .data     0x811AD738
  .data     4
exp_223:
  .binary   00000080

  .data     0x811AD75C
  .data     4
exp_224:
  .binary   0000005c

  .data     0x811AD780
  .data     4
exp_225:
  .binary   00000000

  .data     0x811AD7A4
  .data     4
exp_226:
  .binary   00000000

  .data     0x811AD7C8
  .data     4
exp_227:
  .binary   00000000

  .data     0x811AD7EC
  .data     4
exp_228:
  .binary   00000000

  .data     0x811AD810
  .data     4
exp_229:
  .binary   00002b5c

  .data     0x811AD834
  .data     4
exp_230:
  .binary   00000000

  .data     0x811AD858
  .data     4
exp_231:
  .binary   00000000

  .data     0x811AD87C
  .data     4
exp_232:
  .binary   00000000

  .data     0x811AD8A0
  .data     4
exp_233:
  .binary   00000000

  .data     0x811AD8C4
  .data     4
exp_234:
  .binary   00000000

  .data     0x811AD8E8
  .data     4
exp_235:
  .binary   00000000

  .data     0x811AD90C
  .data     4
exp_236:
  .binary   00000000

  .data     0x811AD930
  .data     4
exp_237:
  .binary   00000000

  .data     0x811AD954
  .data     4
exp_238:
  .binary   00000000

  .data     0x811AD978
  .data     4
exp_239:
  .binary   00000000

  .data     0x811AD99C
  .data     4
exp_240:
  .binary   00000064

  .data     0x811AD9C0
  .data     4
exp_241:
  .binary   00000034

  .data     0x811AD9E4
  .data     4
exp_242:
  .binary   00000030

  .data     0x811ADA08
  .data     4
exp_243:
  .binary   00000030

  .data     0x811ADA2C
  .data     4
exp_244:
  .binary   0000017c

  .data     0x811ADA50
  .data     4
exp_245:
  .binary   00000009

  .data     0x811ADA74
  .data     4
exp_246:
  .binary   00000000

  .data     0x811ADA98
  .data     4
exp_247:
  .binary   00000000

  .data     0x811ADABC
  .data     4
exp_248:
  .binary   00003e80

  .data     0x811ADAE0
  .data     4
exp_249:
  .binary   00000009

  .data     0x811ADB04
  .data     4
exp_250:
  .binary   00000000

  .data     0x811ADB28
  .data     4
exp_251:
  .binary   00000000

  .data     0x811ADB4C
  .data     4
exp_252:
  .binary   00000000

  .data     0x811ADB70
  .data     4
exp_253:
  .binary   00000000

  .data     0x811ADB94
  .data     4
exp_254:
  .binary   00000000

  .data     0x811ADBB8
  .data     4
exp_255:
  .binary   00000000

  .data     0x811ADBDC
  .data     4
exp_256:
  .binary   00000000

  .data     0x811ADC00
  .data     4
exp_257:
  .binary   00000000

  .data     0x811ADC24
  .data     4
exp_258:
  .binary   00000000

  .data     0x811ADC48
  .data     4
exp_259:
  .binary   00000000

  .data     0x811ADC6C
  .data     4
exp_260:
  .binary   00000000

  .data     0x811ADC90
  .data     4
exp_261:
  .binary   00000000

  .data     0x811ADCB4
  .data     4
exp_262:
  .binary   00000000

  .data     0x811ADCD8
  .data     4
exp_263:
  .binary   00000000

  .data     0x811ADCFC
  .data     4
exp_264:
  .binary   00000000

  .data     0x811ADD20
  .data     4
exp_265:
  .binary   0000006f

  .data     0x811ADD44
  .data     4
exp_266:
  .binary   00000118

  .data     0x811ADD68
  .data     4
exp_267:
  .binary   0000005a

  .data     0x811ADD8C
  .data     4
exp_268:
  .binary   0000005c

  .data     0x811ADDB0
  .data     4
exp_269:
  .binary   0000005e

  .data     0x811ADDD4
  .data     4
exp_270:
  .binary   0000007d

  .data     0x811ADDF8
  .data     4
exp_271:
  .binary   00000064

  .data     0x811ADE1C
  .data     4
exp_272:
  .binary   00000068

  .data     0x811ADE40
  .data     4
exp_273:
  .binary   0000006c

  .data     0x811ADE64
  .data     4
exp_274:
  .binary   00000096

  .data     0x811ADE88
  .data     4
exp_275:
  .binary   0000007c

  .data     0x811ADEAC
  .data     4
exp_276:
  .binary   00000080

  .data     0x811ADED0
  .data     4
exp_277:
  .binary   00000084

  .data     0x811ADEF4
  .data     4
exp_278:
  .binary   00000000

  .data     0x811ADF18
  .data     4
exp_279:
  .binary   00000000

  .data     0x811ADF3C
  .data     4
exp_280:
  .binary   00000000

  .data     0x811ADF60
  .data     4
exp_281:
  .binary   00000000

  .data     0x811ADF84
  .data     4
exp_282:
  .binary   00000000

  .data     0x811ADFA8
  .data     4
exp_283:
  .binary   00000000

  .data     0x811ADFCC
  .data     4
exp_284:
  .binary   00000000

  .data     0x811ADFF0
  .data     4
exp_285:
  .binary   00000000

  .data     0x811AE014
  .data     4
exp_286:
  .binary   00000000

  .data     0x811AE038
  .data     4
exp_287:
  .binary   00000000

  .data     0x811AE05C
  .data     4
exp_288:
  .binary   00000091

  .data     0x811AE080
  .data     4
exp_289:
  .binary   0000010e

  .data     0x811AE0A4
  .data     4
exp_290:
  .binary   00000113

  .data     0x811AE0C8
  .data     4
exp_291:
  .binary   00000118

  .data     0x811AE0EC
  .data     4
exp_292:
  .binary   00000127

  .data     0x811AE110
  .data     4
exp_293:
  .binary   00000384

  .data     0x811AE134
  .data     4
exp_294:
  .binary   0000015e

  .data     0x811AE158
  .data     4
exp_295:
  .binary   00000140

  .data     0x811AE17C
  .data     4
exp_296:
  .binary   00000140

  .data     0x811AE1A0
  .data     4
exp_297:
  .binary   00000145

  .data     0x811AE1C4
  .data     4
exp_298:
  .binary   0000016b

  .data     0x811AE1E8
  .data     4
exp_299:
  .binary   00000064

  .data     0x811AE20C
  .data     4
exp_300:
  .binary   00000064

  .data     0x811AE230
  .data     4
exp_301:
  .binary   00000181

  .data     0x811AE254
  .data     4
exp_302:
  .binary   00000174

  .data     0x811AE278
  .data     4
exp_303:
  .binary   00004970

  .data     0x811AE29C
  .data     4
exp_304:
  .binary   0000003c

  .data     0x811AE2C0
  .data     4
exp_305:
  .binary   00000010

  .data     0x811AE2E4
  .data     4
exp_306:
  .binary   00003e1c

  .data     0x811AE308
  .data     4
exp_307:
  .binary   00000158

  .data     0x811AE32C
  .data     4
exp_308:
  .binary   00000000

  .data     0x811AE350
  .data     4
exp_309:
  .binary   00000000

  .data     0x811AE374
  .data     4
exp_310:
  .binary   00000000

  .data     0x811AE398
  .data     4
exp_311:
  .binary   00000000

  .data     0x811AE3BC
  .data     4
exp_312:
  .binary   00000100

  .data     0x811AE3E0
  .data     4
exp_313:
  .binary   000002bc

  .data     0x811AE404
  .data     4
exp_314:
  .binary   00000140

  .data     0x811AE428
  .data     4
exp_315:
  .binary   0000003b

  .data     0x811AE44C
  .data     4
exp_316:
  .binary   00000141

  .data     0x811AE470
  .data     4
exp_317:
  .binary   00000163

  .data     0x811AE494
  .data     4
exp_318:
  .binary   0000014e

  .data     0x811AE4B8
  .data     4
exp_319:
  .binary   0000014e

  .data     0x811AE4DC
  .data     4
exp_320:
  .binary   00000111

  .data     0x811AE500
  .data     4
exp_321:
  .binary   00000000

  .data     0x811AE524
  .data     4
exp_322:
  .binary   00000000

  .data     0x811AE548
  .data     4
exp_323:
  .binary   00000000

  .data     0x811AE56C
  .data     4
exp_324:
  .binary   00000000

  .data     0x811AE590
  .data     4
exp_325:
  .binary   00005bcc

  .data     0x811AE5B4
  .data     4
exp_326:
  .binary   00000000

  .data     0x811AE5D8
  .data     4
exp_327:
  .binary   00000000

  .data     0x811AE5FC
  .data     4
exp_328:
  .binary   00000000

  .data     0x811AE620
  .data     4
exp_329:
  .binary   00000000

  .data     0x811AE644
  .data     4
exp_330:
  .binary   00000000

  .data     0x811AE668
  .data     4
exp_331:
  .binary   00000000

  .data     0x811AE68C
  .data     4
exp_332:
  .binary   00000000

  .data     0x811AE6B0
  .data     4
exp_333:
  .binary   00000000

  .data     0x811AE6D4
  .data     4
exp_334:
  .binary   00000000

  .data     0x811AE6F8
  .data     4
exp_335:
  .binary   00000000

  .data     0x811AE71C
  .data     4
exp_336:
  .binary   00000122

  .data     0x811AE740
  .data     4
exp_337:
  .binary   000000c3

  .data     0x811AE764
  .data     4
exp_338:
  .binary   000000b4

  .data     0x811AE788
  .data     4
exp_339:
  .binary   000000b4

  .data     0x811AE7AC
  .data     4
exp_340:
  .binary   00000370

  .data     0x811AE7D0
  .data     4
exp_341:
  .binary   00000019

  .data     0x811AE7F4
  .data     4
exp_342:
  .binary   00000000

  .data     0x811AE818
  .data     4
exp_343:
  .binary   00000000

  .data     0x811AE83C
  .data     4
exp_344:
  .binary   0000c350

  .data     0x811AE860
  .data     4
exp_345:
  .binary   00000014

  .data     0x811AE884
  .data     4
exp_346:
  .binary   00000000

  .data     0x811AE8A8
  .data     4
exp_347:
  .binary   00000000

  .data     0x811AE8CC
  .data     4
exp_348:
  .binary   00000000

  .data     0x811AE8F0
  .data     4
exp_349:
  .binary   00000000

  .data     0x811AE914
  .data     4
exp_350:
  .binary   00000000

  .data     0x811AE938
  .data     4
exp_351:
  .binary   00000000

  .data     0x811AE95C
  .data     4
exp_352:
  .binary   00000000

  .data     0x811AE980
  .data     4
exp_353:
  .binary   00000000

  .data     0x811AE9A4
  .data     4
exp_354:
  .binary   00000000

  .data     0x811AE9C8
  .data     4
exp_355:
  .binary   00000000

  .data     0x811AE9EC
  .data     4
exp_356:
  .binary   00000000

  .data     0x811AEA10
  .data     4
exp_357:
  .binary   00000000

  .data     0x811AEA34
  .data     4
exp_358:
  .binary   00000000

  .data     0x811AEA58
  .data     4
exp_359:
  .binary   00000000

  .data     0x811AEA7C
  .data     4
exp_360:
  .binary   00000000

  .data     0x811AEAA0
  .data     4
exp_361:
  .binary   0000012c

  .data     0x811AEAC4
  .data     4
exp_362:
  .binary   000002b2

  .data     0x811AEAE8
  .data     4
exp_363:
  .binary   0000010f

  .data     0x811AEB0C
  .data     4
exp_364:
  .binary   00000114

  .data     0x811AEB30
  .data     4
exp_365:
  .binary   0000010c

  .data     0x811AEB54
  .data     4
exp_366:
  .binary   0000014d

  .data     0x811AEB78
  .data     4
exp_367:
  .binary   00000127

  .data     0x811AEB9C
  .data     4
exp_368:
  .binary   0000012f

  .data     0x811AEBC0
  .data     4
exp_369:
  .binary   0000013e

  .data     0x811AEBE4
  .data     4
exp_370:
  .binary   00000177

  .data     0x811AEC08
  .data     4
exp_371:
  .binary   00000153

  .data     0x811AEC2C
  .data     4
exp_372:
  .binary   00000159

  .data     0x811AEC50
  .data     4
exp_373:
  .binary   00000164
