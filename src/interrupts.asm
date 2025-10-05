include "definitions/io.inc"

SECTION "Interrupts", ROM0[$40]
; vblank
reti
ds 7, 0

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
  ;NOPARAM, USE: hl
  handle_joypad:
    ld hl, rBUTTONS
    ld [hl], SELECT_JOYPAD
    ld a, [hl]
    ; TODO: are buttons pressed
    reti
