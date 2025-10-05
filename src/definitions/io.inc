if !def(IO_INC)
  def IO_INC

;NOTE: starts from $ffxx high memory region

def rIE equ $ff
def rIF equ $0f

def INTERRUPT_VBLANK equ  %00000001
def INTERRUPT_LCD equ     %00000010
def INTERRUPT_TIMER equ   %00000100
def INTERRUPT_SERIAL equ  %00001000
def INTERRUPT_JOYPAD equ  %00010000

def rBUTTONS equ $ff00
def rP1 equ $00         ; For ldh and reg c

def SELECT_NONE equ     %00000000
def SELECT_BUTTONS equ  %00100000
def SELECT_JOYPAD equ   %00010000

def BUTTON_START equ    %00001000
def BUTTON_SELECT equ   %00000100
def BUTTON_B equ        %00000010
def BUTTON_A equ        %00000001

def JOY_DOWN equ    %00001000
def JOY_UP equ      %00000100
def JOY_LEFT equ    %00000010
def JOY_RIGHT equ   %00000001

endc ; IO_INC
