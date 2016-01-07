TitleScreenKernel_stationary: SUBROUTINE

; variables
.topDelay    = temp1
.bottomDelay = temp2
.loopCount   = temp3
.temp        = temp4
.temp2       = temp9
.logoColor   = temp5
.frameCount_blink = temp6
.pressFireColor = temp9

.logoLinesToDraw                 = temp7
.logoLinesToDrawUpdatedLastFrame = temp8


    LDA #0
    STA .frameCount_blink
    JMP .TitleScreenKernel_stationary_jumpInPoint
    

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
    
    
    
.TitleScreenKernel_stationary_jumpInPoint:
.ButtonCheck:
    LDA INPT4
    BMI .ButtonNotPressed
 
.ButtonPressed:
    LDA buttonPressedPreviousFrame
    BNE .ButtonCheckDone ; if nonzero, it was pressed the previous frame
    
    LDA #1
    STA buttonPressedPreviousFrame ; mark it as pressed
    
    JMP SoundTestKernel
    
.ButtonNotPressed:
    LDA #0
    STA buttonPressedPreviousFrame
.ButtonCheckDone
    
.resetCheck:
    ; check the reset switch
    LDA #%00000001 ; 2
    BIT SWCHB      ; 3
    BNE .resetNotPressed ; 2 if not taken, 3 if taken
.resetPressed:
    JMP (Reset) ; reset the game
.resetNotPressed:
    
    
    ; calculate whether "Press Fire Button" is on or off
.blinkCheck
    LDA .frameCount_blink
    SEC
    SBC #[FPS/2]
    BPL .blink_isOff
.blink_isOn
    LDA #RED
    STA .pressFireColor
    JMP .blinkCheckDone
.blink_isOff
    LDA #BLACK
    STA .pressFireColor
    ; check whether or not to turn it back on next frame
    LDA .frameCount_blink
    SEC
    SBC #[FPS- 1]
    BNE .blinkCheckDone
    LDA #$FF ; upon INC it will be 0
    STA .frameCount_blink
.blinkCheckDone
    INC .frameCount_blink ; increment the frame counter
    
    
    
    ; increment the logo color
    INC .logoColor
    LDA .logoColor
    STA COLUP0
    STA COLUP1
    
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
    
    LDA #PLAYER_THREE_COPIES_CLOSE
    STA NUSIZ0
    STA NUSIZ1
    
    ; loop + wsync chews up 14 cycles worst case
.VblankLoop:
    LDA INTIM       ; 3
    BNE .VblankLoop ; 3 if taken, 2 otherwise
    
    STA WSYNC       ; 3
; frame (192 lines)
    STA VBLANK ; 3, turn off Vblank
    
    
    ; skip the top scan lines
    LDX #FINAL_LOGO_TOP_DELAY
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
    ; need 13 or 14 cycles (depending on page boundaries)
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
    
    SLEEP 3
    DEC .loopCount       ; 5
    LDA .loopCount       ; 3
    ;CMP .logoLinesToDraw ; 3
    BPL .drawLoop_Logo   ; 2 if not taken, 3 if taken
    
    LDA #0
    STA GRP0
    STA GRP1
    STA GRP0
    STA GRP1

    STA WSYNC
    LDA #$90
    STA HMP0
    STA HMP1
    STA HMOVE
    
    LDA .pressFireColor
    STA COLUP0
    STA COLUP1
    
    LDA #PLAYER_TWO_COPIES_CLOSE
    STA NUSIZ1
    
    LDX #[87-[FINAL_LOGO_TOP_DELAY+48]]
.gap1Delay:
    STA WSYNC
    DEX
    BNE .gap1Delay
    
    LDY #[WORD_HEIGHT-1]
.drawPressFireLoop:
    STA WSYNC
    SLEEP 5
    LDA PressFire1,Y ; 4
    STA GRP0         ; 3
    LDA PressFire2,Y ; 4
    STA GRP1         ; 3
    LDA PressFire5,Y ; 4
    STA .temp        ; 3
    LDA PressFire3,Y ; 4
    LDX PressFire4,Y ; 4
    STY .loopCount   ; 3
    LDY .temp        ; 3
    ; 40 cycles in
    STA GRP0         ; 3
    STX GRP1         ; 3
    STY GRP0         ; 3
    STX GRP1         ; 3 
    STY GRP0         ; 3
    LDY .loopCount   ; 3
    DEY              ; 2
    BPL .drawPressFireLoop ; 3 if taken, 2 if not
    
    LDA #0
    STA GRP0
    STA GRP1
    STA GRP0
    STA GRP1
    
    STA WSYNC
    LDA #$A0
    STA HMP0
    STA HMP1
    STA HMOVE
    
    LDA #PLAYER_TWO_COPIES_CLOSE
    STA NUSIZ0
    LDA #PLAYER_ONE_COPY
    STA NUSIZ1
    
    
    LDY #6
.drawButtonLoop:
    STA WSYNC
    SLEEP 20
    LDA Word_Button1,Y ; 4
    STA GRP0           ; 3
    LDX Word_Button2,Y ; 4
    STX GRP1           ; 3
    LDA Word_Button3,Y ; 4
    STY .loopCount     ; 3
    TAY                ; 2
    
    STA GRP0
    STX GRP1           ; 3
    STY GRP0
    STX GRP1
    STY GRP0
    
    LDY .loopCount
    DEY
    BPL .drawButtonLoop 
    
    
    STA WSYNC
    LDA #0
    STA GRP0
    STA GRP1
    STA GRP0
    STA GRP1
    
    LDX #86
.bottomDelayLoop
    STA WSYNC
    DEX
    BNE .bottomDelayLoop
    
    
; frame over
    LDA #2         ; 2
    STA VBLANK     ; 3, turn on Vblank
    JMP .NewScreen ; 3
    