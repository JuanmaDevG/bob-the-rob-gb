if !def(IO_INC)
  def IO_INC

;TODO: better use ldh instead of rBUTTONS
def rBUTTONS equ $ff00

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
