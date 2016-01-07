TitleKernel_scrolling: SUBROUTINE
; variables
.topDelay    = temp1
.bottomDelay = temp2
.loopCount   = temp3
.temp        = temp4
.logoColor   = temp5
.logoColorUpdatedLastFrame = temp6 ; update color of logo every other frame

.logoLinesToDraw                 = temp7
.logoLinesToDrawUpdatedLastFrame = temp8

; constants
FINAL_LOGO_TOP_DELAY = 35 ; -1 of actual delay since vdels are set


.KernelInit
; set Vertical Delay for players
    LDA #1
    STA VDELP0
    STA VDELP1
    
    ; set players to the display option of "3 copies close"
    LDA #PLAYER_THREE_COPIES_CLOSE
    STA NUSIZ0
    STA NUSIZ1
    
    
    LDA #0
    STA .logoLinesToDrawUpdatedLastFrame ; clear flag
    LDA #GREEN
    ; set colors for player sprites
    STA .logoColor
    
    
    ; load pointers to logo image
    SET_POINTER s1, GalagaLogo1
    SET_POINTER s2, GalagaLogo2
    SET_POINTER s3, GalagaLogo3
    SET_POINTER s4, GalagaLogo4
    SET_POINTER s5, GalagaLogo5
    SET_Pointer s6, GalagaLogo6
    
    STA WSYNC
    
    SLEEP 37
    STA RESP0
    STA RESP1
    LDA #$10
    STA HMP0
    LDA #$20
    STA HMP1
    STA WSYNC
    STA HMOVE
    STA WSYNC
    LDA #BLACK
    STA COLUBK
    
    ; set the initial top delay
    LDA #189
    ;LDA #35
    STA .topDelay
    
    ; set the initial number of lines to draw count
    ;LDA #$FF ; -1 of the line offset
    LDA #[GALAGA_LOGO_HEIGHT-2]
    STA .logoLinesToDraw ; actually the last line to draw



    
    LDA #2
    STA VBLANK
    
.NewScreen:

; Overscan (30 lines, 2280 cycles)
    ; start timer
    ; remember the 8 cycles chewed up at the
    ;   before jumping back here!
    LDA #OVERSCAN_TIME ; 2
    STA TIM64T         ; 3
    ; code goes here, 2248 cycles max
    
    
    
    ; loop + lda + wsync chews up 16 cycles worst case
.OverscanLoop:
    LDA INTIM         ; 3
    BNE .OverscanLoop ; 3 if taken, 2 otherwise
    
    LDA #2            ; 2
    STA WSYNC         ; 3
; Vsync (3 lines, 228 cycles)
    ;turn on vsync
    STA VSYNC ; 3
    
    ; start timer
    LDA #VSYNC_TIME ; 2
    STA TIM8T       ; 3
    ; code goes here, 206 cycles max
    
    
    
    
    ; loop + wsync chews up 14 cycles worst case
.VsyncLoop:
    LDA INTIM      ; 3
    BNE .VsyncLoop ; 3 if taken, 2 otherwise
    
    STA WSYNC      ; 3
; Vblank (37 lines, 2812 cycles)
    ; turn off vsync
    STA VSYNC ; 3
    
    ; start timer
    LDA #VBLANK_TIME ; 2
    STA TIM64T       ; 3
    ; code goes here, 2790 cycles max
    
    
    LDA .logoColor
    STA COLUP0
    STA COLUP1
    
    ; check the reset switch
    LDA #%00000001 ; 2
    BIT SWCHB      ; 3
    BNE .resetNotPressed ; 2 if not taken, 3 if taken
    ; branch if it is not pressed
    ; else it is pressed
    JMP (Reset) ; reset the game
.resetNotPressed:


.ButtonCheck:
    LDA INPT4
    BMI .ButtonNotPressed
 
.ButtonPressed:
    LDA buttonPressedPreviousFrame
    BNE .ButtonNotPressed ; if nonzero, it was pressed the previous frame
    
    LDA #1
    STA buttonPressedPreviousFrame ; mark it as pressed
    
    JMP TitleScreenKernel_stationary
    
.ButtonNotPressed:
    LDA #0
    STA buttonPressedPreviousFrame


   

    LDA .logoLinesToDraw
    BMI .topDelayUpdate ; check if done updating lines to draw

    LDA .logoLinesToDrawUpdatedLastFrame ; load flag
    BEQ .noLinesToDrawUpdate ; if zero, don't update
    ; else, update
    DEC .logoLinesToDraw
    DEC .logoLinesToDrawUpdatedLastFrame ; clear flag
    JMP .topDelayUpdate
    
.noLinesToDrawUpdate:
    INC .logoLinesToDrawUpdatedLastFrame ; set flag
    
.topDelayUpdate:
    LDA .topDelay
    CMP #FINAL_LOGO_TOP_DELAY
    BNE .noJumpToNextKernel
    JMP TitleScreenKernel_stationary ; done scrolling, onto the stationary kernel
.noJumpToNextKernel:
    DEC .topDelay
.topDelayUpdateDone:
    
    
    ; loop + wsync chews up 14 cycles worst case
.VblankLoop:
    LDA INTIM       ; 3
    BNE .VblankLoop ; 3 if taken, 2 otherwise
    
    STA WSYNC       ; 3
; frame (192 lines)
    STA VBLANK ; 3, turn off Vblank
    
    ; skip the top scan lines
    LDX .topDelay
.topDelayLoop:
    STA WSYNC
    DEX               ; 2
    BNE .topDelayLoop ; 2 if not taken, 3 if taken
    
    ; time waster, 56 cycles
    LDY #10
.wasteTime2:
    DEY
    BPL .wasteTime2
    
    SLEEP 3
    LDA #[GALAGA_LOGO_HEIGHT-1]
    STA .loopCount
.drawLoop_Logo:
    ;SLEEP 6
    
    LDY .loopCount ; 3
    LDA (s1),Y     ; 5
    STA GRP0       ; 3
    LDA (s2),Y     ; 5
    STA GRP1       ; 3
    LDA (s3),Y     ; 5
    STA GRP0       ; 3
    LDA (s6),Y     ; 5
    STA .temp      ; 3
    LDA (s5),Y     ; 3
    TAX            ; 2
    LDA (s4),Y     ; 5
    LDY .temp      ; 3
    STA GRP1       ; 3
    STX GRP0       ; 3
    STY GRP1       ; 3
    STA GRP0       ; 3
    
    ; Start: take out for single line resolution
    ; need 13 cycles
    SLEEP 14
    
    LDY .loopCount ; 3
    LDA (s1),Y     ; 5
    STA GRP0       ; 3
    LDA (s2),Y     ; 5
    STA GRP1       ; 3
    LDA (s3),Y     ; 5
    STA GRP0       ; 3
    LDA (s6),Y     ; 5
    STA .temp      ; 3
    LDA (s5),Y     ; 3
    TAX            ; 2
    LDA (s4),Y     ; 5
    LDY .temp      ; 3
    STA GRP1       ; 3
    STX GRP0       ; 3
    STY GRP1       ; 3
    STA GRP0       ; 3
    ; End: take out for single line resolution
    
    DEC .loopCount       ; 5
    LDA .loopCount       ; 3
    CMP .logoLinesToDraw ; 3
    BNE .drawLoop_Logo   ; 2 if not taken, 3 if taken
    
    LDA #0
    STA GRP0
    STA GRP1
    STA GRP0
    STA GRP1
    

; calculate remaining scanlines
    SEC                         ; 2
    LDA #[GALAGA_LOGO_HEIGHT-1] ; 2
    SBC .logoLinesToDraw        ; 3
    SHIFT_LEFT 1                ; 2
    CLC                         ; 2
    ADC .topDelay               ; 3
    STA .temp                   ; 3
    LDA #191                    ; 2
    SEC                         ; 2
    SBC .temp                   ; 3
    
    ; if there are 0 scanlines left, skip the bottom delay loop
    BEQ .noScanlinesToSkip ; 2 if not taken, 3 if taken
    
    TAX                     ; 2
.bottomDelayLoop:
    STA WSYNC
    DEX
    BNE .bottomDelayLoop

    BEQ .scanLinesWereSkipped ; unconditional
.noScanlinesToSkip

    LDA #2
    STA VBLANK
    
    LDA #[OVERSCAN_TIME-1]
    STA TIM64T
    JMP .OverscanLoop

.scanLinesWereSkipped
; frame over
    LDA #2         ; 2
    STA VBLANK     ; 3, turn on Vblank
    JMP .NewScreen ; 3
    
    
