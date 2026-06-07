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
  pop    ebx

  mov    esi, [ebx + scan_start - data]       # candidate ptr
  mov    edx, [ebx + scan_end - data]         # scan end
  mov    ecx, [ebx + signature_size - data]   # signature size
  sub    edx, ecx                             # scan limit = end - sig_size
  lea    edi, [ebx + payload - data]          # signature ptr

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
  # esi = BattleParamEntry_on.dat base
  mov    ecx, [ebx + patch_count - data]
  mov    edi, [ebx + signature_size - data]
  lea    edi, [ebx + payload - data + edi]    # patch entry ptr after signature

patch_again:
  test   ecx, ecx
  jz     done

  mov    edx, [edi]       # offset from table base
  mov    al, [edi + 4]    # byte value
  mov    [esi + edx], al

  add    edi, 5
  dec    ecx
  jmp    patch_again

done:
  mov    eax, esi         # return found table base
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

data:
scan_start:
  .data  0
scan_end:
  .data  0
signature_size:
  .data  0
patch_count:
  .data  0
payload:
  # Server suffix:
  #   signature bytes
  #   repeated patch entries:
  #     uint32_t offset
  #     uint8_t value
