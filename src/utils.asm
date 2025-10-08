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
  ldh a, [$44]
  cp 144
  jr c, wait_vblank
  cp 152
  jr nc, wait_vblank
  ret

lcd_off::
  call wait_vblank
  xor a
  ldh [$40], a
  ret

;NOPARAM, USE: hl, b
clean_oam::
  ld hl, $fe00
  xor a
  ld b, 128
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

place_assets::
  ld hl, $fe00
  ld a, 40
  ld [hl+], a
  ld [hl+], a
  ld [hl], VRAM_ASSET_ROBOT
  inc hl
  ;TODO: flags to zero
  ld [hl], 32
  inc hl
  ld [hl+], a
