; volume si a 4-bit value for the TIA
; $0F gives distorted sound on hardware
; $08 is adequately loud, while not distorting
SOUND_VOLUME = $08

; Music Routine
    LDA voice0noteCount
    CMP #$FF
    BEQ Voice0_Done
    
Voice0_Start:
    TAY
    LDA (voice0ptr),Y ; load length of note in frames
    CMP voice0frameCount ; check to see if the note is through playing
    BNE Voice0_PlayNote
    
Voice0_NextNote:
    INY ; advance to the next note
    INY
    LDA (voice0ptr),Y ; Load length of note in frames
    CMP #$FF ; make sure there is another note
    BNE Voice0_NextNoteExists ; if there is, jump to where to process the note

Voice0_NoMoreNotes:
    ; test whether we are looping
    ; save A in X
    TAX
    LDA voice0loop ; check whether looping
    BNE Voice0_looping ; if voice0loop is not zero, we are looping
                       ; else we are not looping, turn off voice
    STX voice0noteCount ; turn off music
    LDA #0
    STA AUDV0 ; mute volume
    BEQ Voice0_Done ; will always be taken
                    ; 1 less byte than JMP
                    
Voice0_looping:
    LDA #0
    STA voice0noteCount ; reset note counter
    STA voice0frameCount ; reset frame counter
    BEQ Voice0_Start ; always taken, play voice from beginning

Voice0_NextNoteExists:
    LDA #0
    STA voice0frameCount ; Reset the frame counter
    
Voice0_PlayNote:
    STY voice0noteCount ; write the note we're on back to memory
    INY
    LDA (voice0ptr),Y   ; Load the note voice (distortion) and pitch
    TAX                 ; save the voice and pitch in X
    AND #$E0             ; Extract the voice from the byte (top 3 bits)
    CMP #VOICE_REST     ; Check to see if it is a rest
    BNE Voice0_NotARest ; if A != VOICE_REST it is not a rest
                        ; else it is a rest (don't branch)
Voice0_IsARest;
    LDA #0
    STA AUDV0 ; mute the voice
    BEQ Voice0_RestOrNote ; will always be taken,
                          ; 1 less byte than JMP
Voice0_NotARest:

    LSR ; get the voice offset
    LSR 
    LSR 
    LSR 
    LSR 
    TAY ; move to index register 
    LDA DistortionTable,Y ; load what the actual distortion to write is
    STA AUDC0
    
Voice0_WritePitch
    TXA       ; restore voice and pitch
    AND #$1F  ; extract pitch
    STA AUDF0 ; write pitch
    LDA #SOUND_VOLUME  ; turn the volume on
    STA AUDV0 ; write volume
    
Voice0_RestOrNote:
    INC voice0frameCount
    
Voice0_Done:




; Music Routine
    LDA voice1noteCount
    CMP #$FF
    BEQ Voice1_Done
    
Voice1_Start:
    TAY
    LDA (voice1ptr),Y ; load length of note in frames
    CMP voice1frameCount ; check to see if the note is through playing
    BNE Voice1_PlayNote
    
Voice1_NextNote:
    INY ; advance to the next note
    INY
    LDA (voice1ptr),Y ; Load length of note in frames
    CMP #$FF ; make sure there is another note
    BNE Voice1_NextNoteExists ; if there is, jump to where to process the note

Voice1_NoMoreNotes:
    ; test whether we are looping
    ; save A in X
    TAX
    LDA voice1loop ; check whether looping
    BNE Voice1_looping ; if voice1loop is not zero, we are looping
                       ; else we are not looping, turn off voice
    STX voice1noteCount ; turn off music
    LDA #0
    STA AUDV1 ; mute volume
    BEQ Voice1_Done ; will always be taken
                    ; 1 less byte than JMP
                    
Voice1_looping:
    LDA #0
    STA voice1noteCount ; reset note counter
    STA voice1frameCount ; reset frame counter
    BEQ Voice1_Start ; always taken, play voice from beginning

Voice1_NextNoteExists:
    LDA #0
    STA voice1frameCount ; Reset the frame counter
    
Voice1_PlayNote:
    STY voice1noteCount ; write the note we're on back to memory
    INY
    LDA (voice1ptr),Y   ; Load the note voice (distortion) and pitch
    TAX                 ; save the voice and pitch in X
    AND #$E0             ; Extract the voice from the byte (top 3 bits)
    CMP #VOICE_REST     ; Check to see if it is a rest
    BNE Voice1_NotARest ; if A != VOICE_REST it is not a rest
                        ; else it is a rest (don't branch)
Voice1_IsARest;
    LDA #0
    STA AUDV1 ; mute the voice
    BEQ Voice1_RestOrNote ; will always be taken,
                          ; 1 less byte than JMP
Voice1_NotARest:
    LSR ;A ; get the voice offset
    LSR ;A
    LSR ;A
    LSR ;A
    LSR ;A
    TAY ; move to index register 
    LDA DistortionTable,Y ; load what the actual distortion to write is
    STA AUDC1
    
Voice1_WritePitch
    TXA       ; restore voice and pitch
    AND #$1F  ; extract pitch
    STA AUDF1 ; write pitch
    LDA #SOUND_VOLUME  ; turn the volume on
    STA AUDV1 ; write volume
    
Voice1_RestOrNote:
    INC voice1frameCount
    
Voice1_Done:
