if !def(DEFINITIONS_INC)
  def DEFINITIONS_INC equ 1

;;;;;;;;;;;;;;;;;;;;
; Font definitions ;
;;;;;;;;;;;;;;;;;;;;

def FONT_CHAR_COUNT equ 56
def VRAM_FONT_LOC equ $8010

NEWCHARMAP game_font, main
CHARMAP "A", 1
CHARMAP "B", 2
CHARMAP "C", 3
CHARMAP "D", 4
CHARMAP "E", 5
CHARMAP "F", 6
CHARMAP "G", 7
CHARMAP "H", 8
CHARMAP "I", 9
CHARMAP "J", 10
CHARMAP "K", 11
CHARMAP "L", 12
CHARMAP "M", 13
CHARMAP "N", 14
CHARMAP "O", 15
CHARMAP "P", 16
CHARMAP "Q", 17
CHARMAP "R", 18
CHARMAP "S", 19
CHARMAP "T", 20
CHARMAP "U", 21
CHARMAP "V", 22
CHARMAP "W", 23
CHARMAP "X", 24
CHARMAP "Y", 25
CHARMAP "Z", 26
CHARMAP "a", 27
CHARMAP "b", 28
CHARMAP "c", 29
CHARMAP "d", 30
CHARMAP "e", 31
CHARMAP "f", 32
CHARMAP "g", 33
CHARMAP "h", 34
CHARMAP "i", 35
CHARMAP "j", 36
CHARMAP "k", 37
CHARMAP "l", 38
CHARMAP "m", 39
CHARMAP "n", 40
CHARMAP "o", 41
CHARMAP "p", 42
CHARMAP "q", 43
CHARMAP "r", 44
CHARMAP "s", 45
CHARMAP "t", 46
CHARMAP "u", 47
CHARMAP "v", 48
CHARMAP "w", 49
CHARMAP "x", 50
CHARMAP "y", 51
CHARMAP "z", 52
CHARMAP ",", 53
CHARMAP "!", 54
CHARMAP "'", 55
CHARMAP "?", 56
CHARMAP " ", 57

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Game ASSETS and SPRITES ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

def ASSET_COUNT equ 11
def VRAM_ASSETS_LOC equ (VRAM_FONT_LOC + (FONT_CHAR_COUNT +1) * $10)

def ASSET_DIALOG equ 58
def ASSET_ROBOT equ 59
def ASSET_HAT equ 60
def ASSET_PLOT_U equ 61
def ASSET_PLOT_UR equ 62
def ASSET_PLOT_R equ 63
def ASSET_PLOT_DR equ 64
def ASSET_PLOT_D equ 65
def ASSET_PLOT_DL equ 66
def ASSET_PLOT_L equ 67
def ASSET_PLOT_UL equ 68

;;;;;;;;;;;;;;;;;;
; Memory regions ;
;;;;;;;;;;;;;;;;;;

def _WRAM equ $c000
def _OAM equ $fe00
def _VRAM equ $8000
def _SCRN0 equ $9800
def _SCRN1 equ $9c00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hardware registers at $ff?? ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

def rP1 equ $00
def rLCDC equ $40
def rSTAT equ $41
def rLY equ $44
def rBGP equ $47
def rOBP0 equ $48
def rWY equ $4a
def rWX equ $4b
def rIE equ $ff
def rIF equ $0f

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Values for rIE register ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

def INTERRUPT_VBLANK equ  %00000001
def INTERRUPT_LCD equ     %00000010
def INTERRUPT_TIMER equ   %00000100
def INTERRUPT_SERIAL equ  %00001000
def INTERRUPT_JOYPAD equ  %00010000

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Values for rP1 register ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

def SELECT_NONE equ     %00110000
def SELECT_BUTTONS equ  %00010000
def SELECT_JOYPAD equ   %00100000

def BIT_BUTTONS equ 5
def BIT_JOYPAD equ 4

def BUTTON_START equ    %00001000
def BUTTON_SELECT equ   %00000100
def BUTTON_B equ        %00000010
def BUTTON_A equ        %00000001

def JOY_DOWN equ    %00001000
def JOY_UP equ      %00000100
def JOY_LEFT equ    %00000010
def JOY_RIGHT equ   %00000001

def INPUT_START equ   %10000000
def INPUT_SELECT equ  %01000000
def INPUT_B equ       %00100000
def INPUT_A equ       %00010000
def INPUT_DOWN equ    %00001000
def INPUT_UP equ      %00000100
def INPUT_LEFT equ    %00000010
def INPUT_RIGHT equ   %00000001

def INPUT_BIT_START equ 7
def INPUT_BIT_SELECT equ 6
def INPUT_BIT_B equ 5
def INPUT_BIT_A equ 4
def INPUT_BIT_DOWN equ 3
def INPUT_BIT_UP equ 2
def INPUT_BIT_LEFT equ 1
def INPUT_BIT_RIGHT equ 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; values for rLY register ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

def VBLANK_BEGIN equ 144
def VBLANK_END equ 153

endc ; DEFINITIONS_INC
