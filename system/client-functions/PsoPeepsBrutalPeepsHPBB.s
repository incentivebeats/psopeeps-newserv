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

  jmp    get_data_ptr

get_data_ptr_ret:
  pop    ebx                                  # ebx = suffix payload

  mov    esi, [ebx]                           # scan_start, scans for signature address, not table base

scan_again:
  mov    edx, [ebx + 4]                       # scan_end
  mov    ecx, [ebx + 12]                      # signature_size
  sub    edx, ecx                             # scan limit = end - sig_size
  cmp    esi, edx
  ja     not_found

  xor    ebp, ebp
  lea    edi, [ebx + 20]                      # signature ptr

compare_again:
  cmp    ebp, ecx
  jae    found_signature

  mov    al, [esi + ebp]
  cmp    al, [edi + ebp]
  jne    next_candidate

  inc    ebp
  jmp    compare_again

next_candidate:
  inc    esi
  jmp    scan_again

found_signature:
  # esi = signature address; table base = esi - signature_offset
  mov    ebp, esi
  sub    ebp, [ebx + 8]                       # ebp = BattleParam table base

  mov    ecx, [ebx + 16]                      # patch entry count
  mov    edi, [ebx + 12]                      # signature_size
  lea    edi, [ebx + edi + 20]                # patch entries after header+signature

patch_again:
  test   ecx, ecx
  jz     done

  mov    edx, [edi]                           # offset from table base
  mov    al, [edi + 4]                        # byte value
  mov    [ebp + edx], al

  add    edi, 5
  dec    ecx
  jmp    patch_again

done:
  mov    eax, ebp                             # return found table base
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

# Server suffix starts here:
#   uint32_t scan_start
#   uint32_t scan_end
#   uint32_t signature_offset
#   uint32_t signature_size
#   uint32_t patch_entry_count
#   signature bytes from table+signature_offset
#   repeated patch entries:
#     uint32_t offset
#     uint8_t value
