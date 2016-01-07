; Blank kernel, used as a template for my other kernels
SoundTestKernel: SUBROUTINE

.selectPressedLastFrame = temp1 ; debounce variable for select switch
.temp = temp2
.tempY = temp3

    LDA #0
    STA .selectPressedLastFrame
    
    STA GRP0
    STA GRP1
    STA GRP0
    STA GRP1
    STA NUSIZ0
    STA NUSIZ1
    LDA #WHITE
    STA COLUP0
    STA COLUP1
    
    
    
    ; silence both of the voices as a formality
    LDA #SOUND_SILENCE
    LOAD_SFX 0
    LDA #SOUND_SILENCE
    LOAD_SFX 1
    RESETNOTEANDFRAMECOUNT 0
    RESETNOTEANDFRAMECOUNT 1
    
    ; jump to the music player (in VBLANK after timer has been turned on)
    JMP .SoundTestKernel_jumpInPoint

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
    
    ; the point to jump into is to start of VBLANK
.SoundTestKernel_jumpInPoint: 
    STA WSYNC
    SLEEP #42
    STA RESP0
    STA RESP1
    STA WSYNC
    STA HMOVE
    
    
    
    ; load up the pointers to the digits for the sounds
    LDA #>ScoreFont ; hi bytes
    STA s1+1
    STA s2+1
    
    LDA currentSound
    AND #$F0
    LSR ; most sig digit * 8. equals the offset from ScoreFont
    CLC
    ADC #<ScoreFont
    STA s1
    
    LDA currentSound
    AND #$0F
    ASL
    ASL
    ASL
    ADC #<ScoreFont
    STA s2
    
    LDA #0
    STA GRP0
    STA GRP1
    STA GRP0
    STA GRP1
    
.resetCheck:
    ; check the reset switch
    LDA #%00000001 ; 2
    BIT SWCHB      ; 3
    BNE .resetNotPressed ; 2 if not taken, 3 if taken
.resetPressed:
    JMP (Reset) ; reset the game
.resetNotPressed:


.selectCheck:
    ; check the select switch
    LDA #%00000010 ; 2
    BIT SWCHB      ; 3
    BNE .selectNotPressed ; 2 if not taken, 3 if taken
.selectPressed:
    LDA .selectPressedLastFrame ; check if it was pressed last frame
    BNE .selectCheckDone ; if nonzero, it was pressed last frame
    ; else, set as pressed
    LDA #1
    STA .selectPressedLastFrame
    
    ; in this sound test kernel, if one voice is looping, the other is too
    LDA voice0loop
    BNE .setToNotLoop
.setToLoop:
    LDA #1
    STA voice0loop
    STA voice1loop
    BNE .selectCheckDone ; unconditional
.setToNotLoop:
    LDA #0
    STA voice0loop
    STA voice1loop
    BEQ .selectCheckDone ; unconditional
.selectNotPressed:
    LDA #0
    STA .selectPressedLastFrame
.selectCheckDone:


.JoystickCheck:
    LDA SWCHA ; read the current input status
    BPL .JoystickRight ; if the msb is not set, right is pressed
    
    LDX #0
    STX joystickRightPreviousFrame ; not pressed
    
    ASL ; shift left
    BPL .JoystickLeft ; check if left is pressed
    
    STX joystickLeftPreviousFrame ; not pressed
    
    BMI .JoystickDone ; unconditional, will always be taken
                     ; if joystick is neither left or right, we're done
    
.JoystickRight:
    LDA joystickRightPreviousFrame
    BNE .JoystickDone ; if nonzero, it was right the previous frame
    
    LDA #1
    STA joystickRightPreviousFrame ; mark that it was pressed
    
    ;INC currentSound
    LDA currentSound
    SED
    CLC
    ADC #1
    CLD
    CMP #NUMTOTALSOUNDS_BCD
    BNE .IncrementSoundWorked
.BackToSoundZero:
    LDA #0
.IncrementSoundWorked:
    STA currentSound
    
    JMP .JoystickDone

.JoystickLeft:
    LDA joystickLeftPreviousFrame
    BNE .JoystickDone ; if nonzero, it was left the previous frame
    
    LDA #1
    STA joystickLeftPreviousFrame ; mark that it was pressed
    
    ;DEC currentSound
    LDA currentSound
    SED
    SEC
    SBC #1
    BPL .DecrementSoundWorked
.BackToSoundFinal:
    LDA #NUMTOTALSOUNDS_BCD
    SEC
    SBC #1
.DecrementSoundWorked:
    STA currentSound
    CLD

.JoystickDone:


; what sound we're currently on
;currentSound = $99

.ButtonCheck:
    LDA INPT4
    BMI .ButtonNotPressed
 
.ButtonPressed:
    LDA buttonPressedPreviousFrame
    BNE .MusicPlayer ; if nonzero, it was pressed the previous frame
    
    LDA #1
    STA buttonPressedPreviousFrame ; mark it as pressed
    
    LDA currentSound
    
    SED
    SEC
    SBC #NUMMUSICTRACKS
    CLD
    BMI .IsMusic

.IsSoundEffect:
    ; we have the offset to SFXPtr Table in BCD mode in A
    ; convert it to binary
    TAX ; store it in X
    AND #$0F
    TAY ; store the low nibble in Y
    TXA ; restore the original number
    AND #$F0 ; extract the high nibble
    LSR ; shift right by one (binary value is 4/5 of needed value)
    STA temp1 ; store that value
    LSR ; binary val is 1/2 of needed value
    LSR ; binary val is 1/5 of needed value
    ADC temp1 ; get the top decimal digit in binary (carry flag guarenteed not set)
    STY temp1 ; store the low decimal digit in tempvar (also already in binary)
    ADC temp1 ; add them together.
    ; done, converted to binary
    
    LOAD_SFX 0
    LDA #SOUND_SILENCE
    LOAD_SFX 1
    JMP .PlayNewSong
    
    
.IsMusic:
    LDA currentSound
    LOAD_MUSIC
    
.PlayNewSong:
    RESETNOTEANDFRAMECOUNT 0
    RESETNOTEANDFRAMECOUNT 1
    JMP .MusicPlayer
    
.ButtonNotPressed:
    LDA #0
    STA buttonPressedPreviousFrame


   
    
.MusicPlayer:

    include galagaSoundPlayer.asm
    
    


    ; loop + wsync chews up 14 cycles worst case
.VblankLoop:
    LDA INTIM       ; 3
    BNE .VblankLoop ; 3 if taken, 2 otherwise
    
    STA WSYNC       ; 3
; frame (192 lines)
    STA VBLANK ; 3, turn off Vblank
    
    ; set the number of sprites for the words "sound test"
    LDA #PLAYER_THREE_COPIES_CLOSE
    STA NUSIZ0
    LDA #PLAYER_TWO_COPIES_CLOSE
    STA NUSIZ1
    STA HMCLR
    LDA #$E0
    STA HMP0
    LDA #$F0
    STA HMP1
    STA WSYNC
    SLEEP 38
    STA RESP0
    STA RESP1
    STA WSYNC
    STA HMOVE
    ; scanline number 2
    
    LDX #61
.topDelayLoop:
    STA WSYNC
    DEX
    BNE .topDelayLoop
    
    LDY #6
.drawSoundTestLoop:
    STA WSYNC
    SLEEP 5
    LDA .word_SoundTest1,Y ; 4
    STA GRP0               ; 3
    LDA .word_SoundTest2,Y ; 4
    STA GRP1               ; 3
    LDA .word_SoundTest5,Y ; 4
    STA .temp              ; 3
    LDA .word_SoundTest3,Y ; 4
    LDX .word_SoundTest4,Y ; 4
    STY .tempY             ; 3
    LDY .temp              ; 3
    STA GRP0               ; 3
    STX GRP1               ; 3
    STY GRP0               ; 3
    STX GRP1               ; 3 
    STY GRP0               ; 3
    LDY .tempY             ; 3
    DEY                    ; 2
    BPL .drawSoundTestLoop ; 3 if taken, 2 if not
    
    STA WSYNC
    ; we're in scanline 70, cycle 57
    LDA #0   ; 2
    STA GRP0 ; 3
    STA GRP1 ; 3
    STA GRP0 ; 3
    STA GRP1 ; 3
    ; cycle 71
    
    STA WSYNC
    SLEEP 42
    STA RESP0
    STA RESP1
    
    LDX #19
.gap1Loop:
    STA WSYNC
    DEX
    BNE .gap1Loop
    
    ; in scanline number 92
    ; change the sprite options to one copy
    LDA #PLAYER_ONE_COPY
    STA NUSIZ0
    STA NUSIZ1
    
    ; just move the sprites with the motion registers
    ;  for the sound number and the word "loop"
    ;STA HMCLR
    LDA #$F0
    STA HMP0
    LDA #$00
    STA HMP1
    
    STA WSYNC
    STA HMOVE ; move the sprites
    ; scanline number 93
    LDY #7
.drawSoundNumberLoop:
    LDA (s2),Y
    TAX
    LDA (s1),Y
    STA GRP0
    STX GRP1
    STA GRP0
    STX GRP1
    STA WSYNC
    DEY
    BPL .drawSoundNumberLoop
    
    LDA #0
    STA GRP0
    STA GRP1
    STA GRP0
    STA GRP1
    
    LDX #5
.gap2Loop:
    STA WSYNC
    DEX
    BNE .gap2Loop
    
    LDA voice0loop
    BEQ .dontDrawLoop ; if zero, branch
    
    LDY #6
.drawLoopLoop:
    LDA .word_Loop1,Y
    LDX .word_Loop2,Y
    STA GRP0
    STX GRP1
    STA GRP0
    STX GRP1
    STA WSYNC
    DEY
    BPL .drawLoopLoop
    
    LDA #0
    STA GRP0
    STA GRP1
    STA GRP0
    STA GRP1
    
    LDX #80
    BPL .bottomDelayLoop ; unconditional
    
.dontDrawLoop:
    LDX #87
    
.bottomDelayLoop:
    STA WSYNC
    DEX
    BNE .bottomDelayLoop
    

; frame over
    LDA #2         ; 2
    STA VBLANK     ; 3, turn on Vblank
    JMP .NewScreen ; 3
    
    
    ORG $F900
    
    ; the word "loop"
.word_Loop1:
    .byte %11101110
    .byte %10001010
    .byte %10001010
    .byte %10001010
    .byte %10001010
    .byte %10001010
    .byte %10000110

    
.word_Loop2:
    .byte %11101000
    .byte %10101000
    .byte %10101000
    .byte %10101000
    .byte %10101110
    .byte %10101010
    .byte %01100110
    
    
    ; the words "sound test"
.word_SoundTest1:
    .byte %11101110
    .byte %00101010
    .byte %00101010
    .byte %00101010
    .byte %01001010
    .byte %10001010
    .byte %11100110

.word_SoundTest2:
    .byte %11101010
    .byte %10101010
    .byte %10101010
    .byte %10101010
    .byte %10101010
    .byte %10101100
    .byte %10101000

.word_SoundTest3:
    .byte %11100000
    .byte %10100000
    .byte %10100000
    .byte %10100000
    .byte %10100000
    .byte %10100000
    .byte %11000001

.word_SoundTest4:
    .byte %10011101
    .byte %10010000
    .byte %10010000
    .byte %10010000
    .byte %10011100
    .byte %10010001
    .byte %11001101

.word_SoundTest5:
    .byte %11001000
    .byte %01001000
    .byte %01001000
    .byte %01001000
    .byte %10001000
    .byte %00001000
    .byte %11011100
