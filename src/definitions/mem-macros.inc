macro Load4b_hlde
  ld a, [hl+]
  ld [de], a
  inc de
  ld a, [hl+]
  ld [de], a
  inc de
  ld a, [hl+]
  ld [de], a
  inc de
  ld a, [hl+]
  ld [de], a
  inc de
endm
