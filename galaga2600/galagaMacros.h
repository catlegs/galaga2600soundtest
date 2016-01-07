;----------------------------------------
; Macro for reseting the note count and frame count of Voice0 or Voice1
; Affects Accumulator and flags.
; Depends zero page variables voice0noteCount, voice0frameCount,
;  voice1noteCount, and voice1frameCount being defined.
;
; Uses 8 cycles, 6 bytes
;----------------------------------------
            MAC RESETNOTEANDFRAMECOUNT  ; usage: RESETNOTEANDFRAMECOUNT n (1 >= n >= 0)
.VOICE    SET {1}

                IF .VOICE = 0 ; 
                    LDA #0                                                       ; 2 cycles, 2 bytes
                    STA voice0noteCount  ; Set note count to $FF (finished)      ; 3 cycles, 2 bytes                                                     ; 2 cycles, 2 bytes
                    STA voice0frameCount ; reset frame count                     ; 3 cycles, 2 bytes
                ELSE
                    IF .VOICE = 1
                        LDA #0                                                       ; 2 cycles, 2 bytes
                        STA voice1noteCount  ; Set note count to $FF (finished)      ; 3 cycles, 2 bytes                                                     ; 2 cycles, 2 bytes
                        STA voice1frameCount ; reset frame count                     ; 3 cycles, 2 bytes
                    ELSE
                        ECHO "MACRO ERROR: 'RESETNOTEANDFRAMECOUNT': Voice must by 0 or 1"
                        ERR
                    ENDIF
                ENDIF
            ENDM
            
            
;----------------------------------------
; Macro for turning off Voice0 or Voice1
; Affects Accumulator and flags.
; Depends zero page variables voice0noteCount, voice0frameCount,
;  voice0loop, voice1noteCount, voice1frameCount, and voice1loop
;  being defined.
;
; Uses 16 cycles, 12 bytes
;----------------------------------------
;            MAC TURNOFFVOICE  ; usage: TURNOFFVOICE n (1 >= n >= 0)
;.VOICE    SET {1}
;
;                IF .VOICE = 0 ; 
;                    LDA #$FF                                                     ; 2 cycles, 2 bytes
;                    STA voice0noteCount  ; Set note count to $FF (finished)      ; 3 cycles, 2 bytes
;                    LDA #0                                                       ; 2 cycles, 2 bytes
;                    STA voice0frameCount ; reset frame count                     ; 3 cycles, 2 bytes
;                    STA voice0loop       ; turn off looping (if it is turned on) ; 3 cycles, 2 bytes
;                    STA AUDV0            ; mute the voice                        ; 3 cycles, 2 bytes
;                ELSE
;                    IF .VOICE = 1
;                        LDA #$FF
;                        STA voice1noteCount  ; Set note count to $FF (finished)
;                        LDA #0
;                        STA voice1frameCount ; reset frame count
;                        STA voice1loop       ; turn off looping (if it is turned on)
;                        STA AUDV1            ; mute the voice
;                    ELSE
;                        ECHO "MACRO ERROR: 'TURNOFFVOICE': Voice must by 0 or 1"
;                        ERR
;                    ENDIF
;                ENDIF
;                
;            ENDM

            
            MAC SHIFT_RIGHT ; usage: SHIFT_RIGHT n (0 < n < 8)
.NUMSHIFTS  SET {1}

                IF .NUMSHIFTS < 1
                    ECHO "MACRO ERROR: 'SHIFT_RIGHT': number of shifts must be > 0"
                    ERR
                ELSE
                    IF .NUMSHIFTS > 7
                        ECHO "MACRO ERROR: 'SHIFT_RIGHT': number of shifts must be < 8"
                        ERR
                    ENDIF
                ENDIF
            
                REPEAT .NUMSHIFTS
                    LSR
                REPEND
            ENDM
            
            MAC SHIFT_LEFT ; usage: SHIFT_LEFT n (0 < n < 8)
.NUMSHIFTS  SET {1}

                IF .NUMSHIFTS < 1
                    ECHO "MACRO ERROR: 'SHIFT_LEFT': number of shifts must be > 0"
                    ERR
                ELSE
                    IF .NUMSHIFTS > 7
                        ECHO "MACRO ERROR: 'SHIFT_LEFT': number of shifts must be < 8"
                        ERR
                    ENDIF
                ENDIF
            
                REPEAT .NUMSHIFTS
                    ASL
                REPEND
            ENDM
            
;---------------------------
; Macros for loading sounds
;---------------------------
;--------------------------------------------------
; Load music into voice pointers.
; A MUST contain the song number in binary format.
; A, X, voice0ptr, and voice1ptr are altered.
;--------------------------------------------------
            MAC LOAD_MUSIC ; usage LOAD_MUSIC (song number MUST be loaded in A)
            
                SHIFT_LEFT 2
                TAX
                LDA MusicPtrTable,X
                STA voice0ptr
                LDA MusicPtrTable+1,X
                STA voice0ptr+1
                LDA MusicPtrTable+2,X
                STA voice1ptr
                LDA MusicPtrTable+3,X
                STA voice1ptr+1
                
            ENDM
            
            
;---------------------------------------------------
; Load sound into voice pointer.
; A MUST contain the sound number in binary format.
; A, X, and (voice0ptr or voice1ptr) are altered.
;---------------------------------------------------
            MAC LOAD_SFX ; usage LOAD_SFX n (n == 1 | 0) (sound number MUST be loaded in A)
.VOICE      SET {1}

                IF .VOICE = 0
                    SHIFT_LEFT 1
                    TAX
                    LDA SFXPtrTable,X
                    STA voice0ptr
                    LDA SFXPtrTable+1,X
                    STA voice0ptr+1
                ELSE
                    IF .VOICE = 1
                        SHIFT_LEFT 1
                        TAX
                        LDA SFXPtrTable,X
                        STA voice1ptr
                        LDA SFXPtrTable+1,X
                        STA voice1ptr+1
                    ELSE
                        ECHO "MACRO ERROR: 'LOAD_SOUND': voice must be 0 or 1"
                        ERR
                    ENDIF
                ENDIF
                
            ENDM
            
            
            
            MAC DEC_BCD ; usage DEC_BCD n (where n is a RAM address)
.LABEL      SET {1}

                
                SED
                LDA .LABEL
                SEC
                SBC #1
                STA .LABEL
                CLD
                
            ENDM
            
            
            MAC INC_BCD ; usage INC_BCD n (where n is a RAM address)
.LABEL      SET {1}

                
                SED
                LDA .LABEL
                CLC
                ADC #1
                STA .LABEL
                CLD
                
            ENDM
            