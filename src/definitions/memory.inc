if !def(MEMORY_INC)
  def MEMORY_INC

def WRAM equ $c000
def OAM equ $fe00
def VRAM equ $8000
def SCRN0 equ $9800
def SCRN1 equ $9c00

def rSTAT equ $ff41
def rLY equ $ff44
def rBGP equ $ff47
;def rOBP0 equ $ff48

endc ; MEMORY_INC
