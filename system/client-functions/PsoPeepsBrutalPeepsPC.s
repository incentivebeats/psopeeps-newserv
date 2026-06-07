.meta key="PsoPeepsBrutalPeepsPC"
.meta name="Brutal Peeps PC"
.meta description="Applies Brutal Peeps\nPC ATP/HP/EXP scaling"
.meta show_return_value

.versions 2OJW 2OJZ

entry_ptr:
reloc0:
  .offsetof start

start:
  push   ebx
  push   esi
  push   edi
  push   ebp

  jmp    get_data_ptr

get_data_ptr_ret:
  pop    ebx                                  # ebx = suffix payload

  mov    esi, [ebx]                           # scan_start
  mov    edx, [ebx + 4]                       # scan_end
  mov    ecx, [ebx + 8]                       # signature_size
  sub    edx, ecx                             # scan limit = end - sig_size
  lea    edi, [ebx + 16]                      # signature ptr

scan_again:
  cmp    esi, edx
  ja     not_found

  xor    ebp, ebp

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
  # esi = matched Ultimate BattleParam block base
  mov    ecx, [ebx + 12]                      # patch entry count
  mov    edi, [ebx + 8]                       # signature_size
  lea    edi, [ebx + edi + 16]                # patch entries after header+signature

patch_again:
  test   ecx, ecx
  jz     done

  mov    edx, [edi]                           # offset from matched block base
  movzx  ebp, byte [edi + 4]                  # byte count
  add    edi, 5                               # edi = source bytes

copy_patch_bytes_again:
  test   ebp, ebp
  jz     patch_entry_done

  mov    al, [edi]
  mov    [esi + edx], al
  inc    edi
  inc    edx
  dec    ebp
  jmp    copy_patch_bytes_again

patch_entry_done:
  dec    ecx
  jmp    patch_again

done:
  mov    eax, esi                             # return found block base
  jmp    return

not_found:
  xor    eax, eax

return:
  pop    ebp
  pop    edi
  pop    esi
  pop    ebx
  ret

get_data_ptr:
  call   get_data_ptr_ret

# Server suffix:
#   uint32_t scan_start
#   uint32_t scan_end
#   uint32_t signature_size
#   uint32_t patch_entry_count
#   signature bytes
#   repeated compact patch entries:
#     uint32_t offset
#     uint8_t size
#     uint8_t data[size]
