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

; TODO: next time load with DMA and a ROM struct
place_assets::
  ; Bob the rob
  ld hl, $fe00
  ld a, 40
  ld [hl+], a
  ld [hl+], a
  ld [hl], ASSET_ROBOT
  inc hl
  ld [hl], 0
  inc hl
  ld [hl], 32
  inc hl
  ld [hl+], a
  ld [hl], ASSET_HAT
  inc hl
  xor a
  ld [hl+], a
  ; NPC robot
  ld [hl], 100
  inc hl
  ld [hl], 85
  inc hl
  ld [hl], ASSET_DIALOG
  inc hl
  ld [hl], 108
  inc hl
  ld [hl], 77
  inc hl
  ld [hl], ASSET_ROBOT
  inc hl
  ld [hl+], a
  ret

load_text_window::
  ld hl, $9da0  ; Enough space for 3 lines of my font
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

;NOPARAM, RETURN: b
get_input::
  ld c, $00
  ld a, SELECT_JOYPAD
  ld [c], a
  ld a, [c]
  ld a, [c]
  ld a, [c]
  res 4, a
  swap a
  ld b, a

;TODO: runtime functions
