if !def(MACROS_INC)
  def MACROS_INC equ 1

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


endc ; MACROS_INC
