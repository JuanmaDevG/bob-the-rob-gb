include "definitions.inc"

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

def INIT_OBJECTS_COUNT equ 4
SECTION "Init objects", ROM0 ; y, x, obj, flags
init_objects::
db 40, 40, ASSET_ROBOT, $00
db 32, 40, ASSET_HAT, $00
db 100, 85, ASSET_DIALOG, $00
db 108, 77, ASSET_ROBOT, $00


SECTION "Functions", ROM0
;NOPARAM
wait_vblank::
  ldh a, [$ff44]
  cp 144
  jr c, wait_vblank
  cp 152
  jr nc, wait_vblank
  ret

lcd_off::
  call wait_vblank
  xor a
  ldh [$ff40], a
  ret

;NOPARAM, USE: hl, b
clean_oam::
  ld hl, $fe00
  xor a
  ld b, 160
  .loop::
    ld [hl+], a
    dec b
    jr nz, .loop
  ret

;NOPARAM, USE: hl, b
clean_screen:
  ld hl, $9800
  ld b, $9c
  .loop:
    xor a
    ld [hl+], a
    ld a, h
    cp b
    jr nz, .loop
  ret

;PARAM: hl = src mem, de = dst mem, b = texture count
load_textures::
  ld a, b
  cp 0
  jr z, .end
  .loop:
    Load4b_hlde
    Load4b_hlde
    Load4b_hlde
    Load4b_hlde
    dec b
    jr nz, .loop
  .end: ret

;NOPARAM, USE: hl, de, b
place_objects::
  ld hl, init_objects
  ld de $fe00
  ld b, INIT_OBJECTS_COUNT
  .loop:
    Load4b_hlde
    dec b
    jr nz, .loop
  ret

;NOPARAM, USE: hl, de, bc
load_text_window::
  ld hl, $9da0  ; Enough screen space for 3 lines of my font
  ld [hl], ASSET_PLOT_UL
  inc hl
  ld a, ASSET_PLOT_U
  ld b, 18
  .upper_bar:
    ld [hl+], a
    dec b
    jr nz, .upper_bar
  ld [hl], ASSET_PLOT_UR
  ld de, 13     ; Row jump
  add hl, de
  ld bc, 19     ; Side jump
  ld a, 3
  .side_bars:
    ld [hl], ASSET_PLOT_L
    add hl, bc
    ld [hl], ASSET_PLOT_R
    add hl, de
    dec a
    jr nz, .side_bars
  ld [hl], ASSET_PLOT_DL
  inc hl
  ld b, 18
  ld a, ASSET_PLOT_D
  .down_bar:
    ld [hl+], a
    dec b
    jr nz, .down_bar
  ld [hl], ASSET_PLOT_DR
  ret

lcd_on::
  ; NOTE: bits described here
  ; LCD PPU on
  ; window area $9c00
  ; window disable
  ; Tile data $8000 - $8fff
  ; BG area $9800
  ; Obj size 8x8
  ; Obj enable
  ; BG & win enable (if this disabled, only able to display objects no matter)
  ld a, %11010011
  ldh [$ff40], a
  ret

load_default_palette::
  ld a, %11100100
  ldh [$ff47], a
  ldh [$ff48], a
  ret

;NOPARAM, USE: b, c, RETURN: a
get_input::
  ld c, $00
  xor a
  set BIT_BUTTONS, a
  ld [c], a
  ld a, [c]
  ld a, [c]
  ld a, [c]
  res 4, a
  ld b, a
  swap b
  xor a
  set BIT_JOYPAD, a
  ld [c], a
  ld a, [c]
  ld a, [c]
  ld a, [c]
  and $0f
  or b
  xor a
  ld [c], a
  ret
