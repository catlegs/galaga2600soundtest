    processor 6502
    
    include vcs.h
    include macro.h
    
    
;--------------------
; Assembler Switches
;--------------------
NTSC  = 0
PAL   = 1
SECAM = 2

COMPILE_VERSION = PAL


;------------------
; Timing Constants
;------------------

VSYNC_LINES    = 3
; 76 * 3 = 228 machine cycles
; 228 / 64 = 3.5625
VSYNC_TIME     = 3


    IF COMPILE_VERSION = NTSC
VBLANK_LINES   = 37
OVERSCAN_LINES = 30

FPS            = 60

; 76 * 37 = 2812 machine cycles
; 2812 / 64 = 43.9375
VBLANK_TIME    = 43
; 76 * 30 = 2280 machine cycles
; 2280 / 64 = 35.625
OVERSCAN_TIME = 35
    ELSE
; PAL and SECAM share the same timing
VBLANK_LINES   = 63
OVERSCAN_LINES = 54

FPS            = 50

; 76 * 63 = 4788 machine cycles
; 4788 / 64 = 74.8125
VBLANK_TIME    = 74
; 76 * 54 = 4104 machine cycles
; 4104 / 64 = 64.125
OVERSCAN_TIME  = 68
    ENDIF

    
;-------------------
; Color Definitions
--------------------

    IF COMPILE_VERSION = NTSC
BLACK  = $00
WHITE  = $0E
GREEN  = $C6
RED    = $40
YELLOW = $1A
CYAN   = $BE
    ELSE
        IF COMPILE_VERSION = PAL
BLACK  = $00
WHITE  = $0E
;GREEN  = $50
GREEN  = $58
;RED    = $60
RED    = $64
YELLOW = $2A
CYAN   = $7E
        ELSE ;SECAM
BLACK   = $00
BLUE    = $02
RED     = $04
MAGENTA = $06
GREEN   = $08
CYAN    = $0A
YELLOW  = $0C
WHITE   = $0E

PURPLE  = MAGENTA
LT_BLUE = CYAN
        ENDIF
    ENDIF

    
;--------------------------------------------------
; Definitions for distortions, pitches, and tempos
;--------------------------------------------------
        IF COMPILE_VERSION = NTSC
    include vcsSoundsNTSC.h
        ELSE ; PAL and SECAM share the same sounds/timing
    include vcsSoundsPAL.h
        ENDIF
    
    
;---------------------------------
; Definitions for Number and Size
; registers of the sprites.
; regs to use: NUSIZ0 and NUSIZ1
;---------------------------------
; missle size - uses bits 4 and 5
MISSLE_SIZE_1 = $00
MISSLE_SIZE_2 = $10
MISSLE_SIZE_4 = $20
MISSLE_SIZE_8 = $30

; player sprite options - uses bits 0, 1, and 2
PLAYER_ONE_COPY           = $00 ; X
PLAYER_TWO_COPIES_CLOSE   = $01 ; X X
PLAYER_TWO_COPIES_MED     = $02 ; X   X
PLAYER_THREE_COPIES_CLOSE = $03 ; X X X
PLAYER_TWO_COPIES_WIDE    = $04 ; X       X
PLAYER_DOUBLE_SIZE        = $05 ; XX
PLAYER_THREE_COPIES_MED   = $06 ; X   X   X
PLAYER_QUAD_SIZE          = $07 ; XXXX


;-----------------
; ROM definitions
;-----------------
RomStart   = $F000
RomEnd     = $FFFF
IntVectors = $FFFA
SpriteData = $FF00


;---------------------
;Variable Definitions
;---------------------
; RAM starts at $80

; sprite pointers
s1 = $80
s2 = $82
s3 = $84
s4 = $86
s5 = $88
s6 = $8A

; pointers to music/effects data
voice0ptr = $8C
voice1ptr = $8E

; variables defining the frame count, note count
;  and whether or not the voice is looping
voice0noteCount  = $90
voice0frameCount = $91
voice0loop       = $92
voice1noteCount  = $93
voice1frameCount = $94
voice1loop       = $95

; variables storing the joystick state last frame
buttonPressedPreviousFrame = $96
joystickRightPreviousFrame = $97
joystickLeftPreviousFrame  = $98

; what sound we're currently on
currentSound = $99

; temporary variables for use by kernels
temp1 = $9A
temp2 = $9B
temp3 = $9C
temp4 = $9D
temp5 = $9E
temp6 = $9F
temp7 = $A0
temp8 = $A1
temp9 = $A2
temp10 = $A3

;-----------------------
; Inlcude Custom Macros
;-----------------------
    include galagaMacros.h
    
    
;------------------------
; Program Initialization
;------------------------
        ORG RomStart
Cart_Init:
    CLEAN_START

   ;JMP TitleScreenKernel
    
    ;    ORG $F100
    include galagaKernels.asm
    ;include galagaSubroutines.asm


    include galagaSprites.asm
    ; Include the data for sound effects and music
    ; ORG $FBC8
    include galagaSounds.asm
    ; zero bytes free here!
    
;-----------------------------
; 6502 interrupt vector table
;-----------------------------
		ORG	IntVectors
NMI:
    word Cart_Init
Reset:
    word Cart_Init
IRQ:
    word Cart_Init
        
		END
