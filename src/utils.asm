include "definitions/memory.inc"
include "definitions/mem-macros.inc"
include "definitions/sync.inc"


SECTION "Utils", ROM0
  ;NOPARAM
  config_loadtime::
    ld a, %00000001
    ld [rIE], a
    ret

  ;NOPARAM
  config_runtime::
    ld a, %11100100
    ld [rBGP] a
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


  ;NOPARAM
  game_logic::
    ret

  ;NOPARAM
  draw_game::
    ei
    halt
    ret
