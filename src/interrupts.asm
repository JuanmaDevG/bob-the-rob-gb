
SECTION "Interrupts", ROM0[$40]
; vblank
reti
ds 7, 0

; LCD status (STAT HBlank)
reti
ds 7, 0

; Timer
ds 8, 0

; Serial
ds 8, 0

; Joypad
reti
ds 7, 0
