include "definitions/io.inc"

SECTION "Interrupts", ROM0[$40]
; vblank
jp draw_game
ds 5, 0

; LCD status (STAT HBlank)
reti
ds 7, 0

; Timer (not for now)
ds 8, 0

; Serial (no need unless multiplayer)
ds 8, 0

; Joypad
jp handle_joypad
ds 5, 0


SECTION "Interrupt handlers", ROM0
  ;NOPARAM, USE: c
  handle_joypad:
    ld c, rP1
    ld a, SELECT_JOYPAD
    ld [c], a
    ld a, [c]
    ; TODO: this should just be used for menus
    reti


  ;NOPARAM
  draw_game:
    reti
