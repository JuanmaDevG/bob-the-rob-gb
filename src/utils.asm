include "definitions/memory.inc"

macro Copy4bhlde
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

SECTION "Utils", ROM0
  ; PARAM: bc = bytecount, hl = src, de = vram dst
  load_vram::
    ei
    ld a, c
    cp 16
    jr nc, .big_block
    ld a, b
    cp 0
    jr nz, .big_block
  .small_block
    halt
    .byte_load
      ld a, [rLY]
      
      ld a, [hl+]
      ld [de], a
      inc de
