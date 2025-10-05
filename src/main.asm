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

include "definitions/memory.inc"
include "definitions/assets.inc"
include "definitions/param-macros.inc"

SECTION "Entry point", ROM0[$150]
main::
  di
  call config_game
  Param_bchlde FONT_COUNT, font_data, VRAM_FONT_LOC
  call load_textures
  Param_bchlde ASSET_COUNT, assets, VRAM_ASSETS_LOC
  call load_textures

  ei
  .game_loop:
    call game_logic
  jr .game_loop
  ; Now gameloop with OAM and move bob, collide with bobby
  
  di
  halt
