;;----------LICENSE NOTICE-------------------------------------------------------------------------------------------------------;;
;;  This file is part of GBTelera: A Gameboy Development Framework                                                               ;;
;;  Copyright (C) 2024 ronaldo / Cheesetea / ByteRealms (@FranGallegoBR)                                                         ;;
;;                                                                                                                               ;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation    ;;
;; files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy,    ;;
;; modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the         ;;
;; Softwareis furnished to do so, subject to the following conditions:                                                           ;;
;;                                                                                                                               ;;
;; The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.;;
;;                                                                                                                               ;;
;; THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE          ;;
;; WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR         ;;
;; COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,   ;;
;; ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                         ;;
;;-------------------------------------------------------------------------------------------------------------------------------;;

include "definitions.inc"
include "macros.inc"

SECTION "Entry point", ROM0[$150]
main::
  di
  call load_gameplay_data
  call load_game
  .mainloop:
    call update_logic
    call draw_game
  jr .mainloop
  halt

load_gameplay_data:
  ld hl, init_objects ;To just retain bob data
  ld de, _WRAM
  xor a
  ld [de], a          ;General gameplay flags
  inc de
  Load4b_hlde
  Load4b_hlde
  ret

load_game:
  call lcd_off
  call clean_oam
  call clean_screen
  ld hl, font_data
  ld de, $8010
  ld b, 56
  call load_textures
  ld hl, asset_data
  ld de, $8010 + (57 * $10)
  ld b, 11
  call load_textures
  call place_objects
  call load_text_window
  call lcd_on
  call load_default_palette
  ret

update_logic:
  call get_input
  call move_character
  call calculate_interactions
  ret

draw_game:
  call wait_vblank
  call update_objects
  .end_vblank:
    ld a, [rLY]
    cp 0
    jr nz, .end_vblank
  ret
