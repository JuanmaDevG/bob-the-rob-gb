include "definitions/memory.inc"
include "definitions/mem-macros.inc"
include "definitions/sync.inc"
include "definitions/io.inc"


SECTION "Utils", ROM0
  ;NOPARAM, USE: c
  config_game::
    ld a, INTERRUPT_VBLANK
    ldh [rIE], a
    ld a, %11100100
    ldh [rBGP], a
    ret


  ;PARAM: b = texture count, hl = mem src, de = mem dst, USE c
  load_textures::
    xor a
    cp b
    jr z, .end
    ei
    .wait_vblank: halt
    .load_texture:
      ld a, [rLY]
      cp rLY_VBLANK_END -1
      jr nc, .wait_vblank
      Load4b_hlde
      Load4b_hlde
      Load4b_hlde
      Load4b_hlde
      dec b
      jr nz, .load_texture
    di
    ret

  def INPUT_BIT_DOWN equ    %10000000
  def INPUT_BIT_UP equ      %01000000
  def INPUT_BIT_LEFT equ    %00100000
  def INPUT_BIT_RIGHT equ   %00010000
  def INPUT_BIT_START equ   %00001000
  def INPUT_BIT_SELECT equ  %00000100
  def INPUT_BIT_B equ       %00000010
  def INPUT_BIT_A equ       %00000001

  ;NOPARAM, USE: B, RETURN d
  get_input:
    ld b, $0f
    ld c, rP1
    ld a, SELECT_JOYPAD
    ld [c], a
    ld a, [c]
    ld a, [c]
    and b
    ld d, a
    swap d
    ld a, SELECT_BUTTONS
    ld [c], a
    ld a, [c]
    ld a, [c]
    ld a, [c]
    ld a, [c]
    ld a, [c]
    ld a, [c]
    and b
    or d
    ld d, a
    ret

  ;NOPARAM
  game_logic::
    call get_input
    ; TODO: put rob in a position
    halt
    ret
