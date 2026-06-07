.meta key="PsoPeepsBrutalPeepsHP"
.meta name="Brutal Peeps HP"
.meta description="Applies Brutal Peeps\nenemy HP scaling"
.meta show_return_value

.versions 50YJ 59NJ 59NL

entry_ptr:
reloc0:
  .offsetof start

start:
  push   ebx
  push   esi
  push   edi
  push   ebp
  push   0                                  # [esp] = last matched table base / 0

  jmp    get_data_ptr

get_data_ptr_ret:
  pop    ebx                                # ebx = suffix payload

  mov    esi, [ebx]                         # scan_start

scan_again:
  mov    edx, [ebx + 4]                     # scan_end
  mov    ecx, [ebx + 8]                     # signature_size
  sub    edx, ecx                           # scan limit = end - sig_size
  cmp    esi, edx
  ja     return

  xor    ebp, ebp
  lea    edi, [ebx + 16]                    # signature ptr

compare_again:
  cmp    ebp, ecx
  jae    found_table

  mov    al, [esi + ebp]
  cmp    al, [edi + ebp]
  jne    next_candidate

  inc    ebp
  jmp    compare_again

next_candidate:
  inc    esi
  jmp    scan_again

found_table:
  # esi = one matching BattleParam table base
  mov    [esp], esi                         # remember last match for return_value

  mov    ecx, [ebx + 12]                    # patch entry count
  mov    edi, [ebx + 8]                     # signature_size
  lea    edi, [ebx + edi + 16]              # patch entries after header+signature

patch_again:
  test   ecx, ecx
  jz     after_patch

  mov    edx, [edi]                         # offset from table base
  mov    al, [edi + 4]                      # byte value
  mov    [esi + edx], al

  add    edi, 5
  dec    ecx
  jmp    patch_again

after_patch:
  inc    esi                                # continue scanning after this match
  jmp    scan_again

return:
  mov    eax, [esp]                         # 0 if none found, else last matched base
  add    esp, 4
  pop    ebp
  pop    edi
  pop    esi
  pop    ebx
  ret

get_data_ptr:
  call   get_data_ptr_ret

# Server suffix starts here:
#   uint32_t scan_start
#   uint32_t scan_end
#   uint32_t signature_size
#   uint32_t patch_entry_count
#   signature bytes
#   repeated patch entries:
#     uint32_t offset
#     uint8_t value
