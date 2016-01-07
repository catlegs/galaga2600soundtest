NUMTOTALSOUNDS = 19 ; 8+12
NUMTOTALSOUNDS_BCD = $19 ; 19 in BCD

NUMMUSICTRACKS = 8
    ORG $FBC8
;---------------------------------------
; Table of pointers to the music tracks
; uses 56 bytes
;---------------------------------------
MusicPtrTable:
; MUSIC

MainThemePtr_voice0:
    .word MainTheme_Voice0
MainThemePtr_voice1:
    .word MainTheme_Voice1
    
ChallengingStagePtr_voice0:
    .word ChallengingStage_Voice0
ChallengingStagePtr_voice1:
    .word ChallengingStage_Voice1

ChallengingStageDonePtr_voice0:
    .word ChallengingStageFinished_Voice0
ChallengingStageDonePtr_voice1:
    .word ChallengingStageFinished_Voice1
    
ChallengingStagePerfectPtr_voice0:
    .word ChallengingStageFinishedPerfect_Voice0
ChallengingStagePerfectPtr_voice1:
    .word ChallengingStageFinishedPerfect_Voice1

FighterCapturedPtr_voice0:
    .word ShipCaptured_Voice0
FighterCapturedPtr_voice1:
    .word ShipCaptured_Voice1
    
FighterRetrievedPtr_voice0:
    .word ShipRetrieved_Voice0
FighterRetrievedPtr_voice1:
    .word ShipRetrieved_Voice1

CapturedFighterDestroyedPtr_voice0:
    .word CapturedShipDestroyed_Voice0
CapturedFighterDestroyedPtr_voice1:
    .word CapturedShipDestroyed_Voice1

ExtraLifePtr_voice0:
    .word ExtraLife_Voice0
ExtraLifePtr_voice1:
    .word ExtraLife_Voice1
    
    
NUMSFX = 11 ; silence is not counted
    ORG $FBE8
;----------------------------------------
; Table of pointers to the sound effects
; 24 bytes used
;----------------------------------------
SFXPtrTable:
; SOUND EFFECTS

ButterflyHitPtr:
    .word KillButterfly

BeeHitPtr:
    .word KillBee

BossGalagaHit1Ptr:
    .word FirstHitBossGalaga

BossGalagaHit2Ptr:
    .word KillBossGalaga

TractorBeamPtr:
    .word TractorBeam

CaughtInTractorBeamPtr:
    .word CaughtInTractorBeam

EnemyTransformPtr:
    .word EnemyTransform

    ; 15
DiveBombPtr:
    .word DiveBomb

    ;16
FireMisslePtr:
    .word FireMissle

FighterDestroyedPtr:
    .word FighterDestroyed

PlaceBadgePtr:
    .word PlaceBadge
    
SOUND_SILENCE = 11
SilencePtr:
    .word Silence
    
    
    
    
    ORG $FC00
;-----------------------------------------------------
; Music for when a ship is captured by a Boss Galaga.
; Voice0 uses 65 bytes
; Voice1 uses 63 bytes
; 128 bytes used in total.
;-----------------------------------------------------
ShipCaptured_Voice0:
    .byte T150_16, VOICE_SQUARE + SQUARE_E6
    .byte T150_16, VOICE_SQUARE + SQUARE_C6
    .byte T150_16, VOICE_SQUARE + SQUARE_D6
    .byte T150_16, VOICE_SQUARE + SQUARE_B5
    .byte T150_16, VOICE_SQUARE + SQUARE_C6
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_B5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_F5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_C5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_LEAD +   LEAD_G4
    
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_SQUARE + SQUARE_C5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_C5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_F5
    
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_B5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_Fis5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    .byte $FF
    
    ORG $FC41
ShipCaptured_Voice1:
    .byte T150_16, VOICE_SQUARE + SQUARE_C6
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_B5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_Fis5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    
    .byte T150_16, VOICE_SQUARE + SQUARE_F5
    .byte T150_16, VOICE_SQUARE + SQUARE_C5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_LEAD +   LEAD_G4
    .byte T150_16, VOICE_LEAD +   LEAD_Fis4
    .byte T150_8,  VOICE_LEAD +   LEAD_E4
    ; 
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_LEAD +   LEAD_G4
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_SQUARE + SQUARE_C5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    
    .byte T150_16, VOICE_SQUARE + SQUARE_C5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_F5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_C5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte $FF
    
    ORG $FC80
;-------------------------------------------------------
; Music for when a ship is retrieved from a Boss Galaga
; Voice0 uses 65 bytes
; Voice1 uses 63 bytes
; 128 bytes used in total.
;-------------------------------------------------------
SHIP_RETRIEVED_LENGTH = T150_16 * 8 * 4
ShipRetrieved_Voice0:
    .byte T150_16, VOICE_SQUARE + SQUARE_E6
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis6
    .byte T150_16, VOICE_SQUARE + SQUARE_D6
    .byte T150_16, VOICE_SQUARE + SQUARE_B5
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis6
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_B5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_Fis5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_LEAD +   LEAD_G4
    
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_Fis5
    
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_B5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_Fis5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    .byte $FF
    
    ORG $FCC1
ShipRetrieved_Voice1:
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis6
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_B5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    .byte T150_16, VOICE_SQUARE + SQUARE_A5
    .byte T150_16, VOICE_SQUARE + SQUARE_Fis5
    .byte T150_16, VOICE_SQUARE + SQUARE_Gis5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    
    .byte T150_16, VOICE_SQUARE + SQUARE_Fis5
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_LEAD +   LEAD_G4
    .byte T150_16, VOICE_LEAD +   LEAD_Fis4
    .byte T150_8,  VOICE_LEAD +   LEAD_E4
    ; 
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_LEAD +   LEAD_G4
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_LEAD +   LEAD_A4
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_Fis5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_Cis5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte $FF

    
    ORG $FD00
;-----------------------------------------------------
; Music for when the player destroys a captured ship.
; Voice0 uses 51 bytes
; Voice1 uses 47 bytes
; 98 bytes used in total.
;-----------------------------------------------------
CapturedShipDestroyed_Voice0:
    .byte T180_16, VOICE_SQUARE + SQUARE_E6
    .byte T180_16, VOICE_SQUARE + SQUARE_C6
    .byte T180_16, VOICE_SQUARE + SQUARE_D6
    .byte T180_16, VOICE_SQUARE + SQUARE_B5
    .byte T180_16, VOICE_SQUARE + SQUARE_C6
    .byte T180_16, VOICE_SQUARE + SQUARE_A5
    .byte T180_16, VOICE_SQUARE + SQUARE_B5
    .byte T180_16, VOICE_SQUARE + SQUARE_Gis5
    
    .byte T180_16, VOICE_SQUARE + SQUARE_A5
    .byte T180_16, VOICE_SQUARE + SQUARE_E5
    .byte T180_16, VOICE_SQUARE + SQUARE_C5
    .byte T180_16, VOICE_SQUARE + SQUARE_D5
    .byte T180_16, VOICE_SQUARE + SQUARE_C5
    .byte T180_16, VOICE_SQUARE + SQUARE_B4
    .byte T180_16, VOICE_LEAD +   LEAD_A4
    .byte T180_16, VOICE_LEAD +   LEAD_G4
    
    .byte T180_16, VOICE_LEAD +   LEAD_A4
    .byte T180_16, VOICE_SQUARE + SQUARE_B4
    .byte T180_16, VOICE_SQUARE + SQUARE_C5
    .byte T180_16, VOICE_SQUARE + SQUARE_D5
    .byte T180_16, VOICE_SQUARE + SQUARE_C5
    .byte T180_16, VOICE_SQUARE + SQUARE_E5
    .byte T180_16, VOICE_SQUARE + SQUARE_Fis5
    .byte T180_16, VOICE_SQUARE + SQUARE_Gis5
    
    .byte T180_8,  VOICE_SQUARE + SQUARE_A5
    .byte $FF
    
    ORG $FD33
CapturedShipDestroyed_Voice1:
    .byte T180_16, VOICE_SQUARE + SQUARE_C6
    .byte T180_16, VOICE_SQUARE + SQUARE_A5
    .byte T180_16, VOICE_SQUARE + SQUARE_B5
    .byte T180_16, VOICE_SQUARE + SQUARE_Gis5
    .byte T180_16, VOICE_SQUARE + SQUARE_A5
    .byte T180_16, VOICE_SQUARE + SQUARE_Fis5
    .byte T180_16, VOICE_SQUARE + SQUARE_Gis5
    .byte T180_8,  VOICE_SQUARE + SQUARE_E5
    
    .byte T180_16, VOICE_SQUARE + SQUARE_C5
    .byte T180_16, VOICE_SQUARE + SQUARE_E5
    .byte T180_16, VOICE_SQUARE + SQUARE_B4
    .byte T180_16, VOICE_LEAD +   LEAD_A4
    .byte T180_16, VOICE_LEAD +   LEAD_G4
    .byte T180_16, VOICE_LEAD +   LEAD_Fis4
    .byte T180_8,  VOICE_LEAD +   LEAD_E4
    ; 
    .byte T180_16, VOICE_LEAD +   LEAD_F4
    .byte T180_16, VOICE_LEAD +   LEAD_Fis4
    .byte T180_16, VOICE_LEAD +   LEAD_G4
    .byte T180_16, VOICE_LEAD +   LEAD_A4
    .byte T180_16, VOICE_SQUARE + SQUARE_B4
    .byte T180_16, VOICE_SQUARE + SQUARE_C5
    .byte T180_16, VOICE_SQUARE + SQUARE_D5
    
    .byte T180_8,  VOICE_SQUARE + SQUARE_E5
    .byte $FF
    
    
    ORG $FD62
;----------------------------------------------------------
; Music for the main theme.
; Also used when a challenging stage is not completed
;  perfectly. Both voices will play the melody but with
;  Voice1 at an 8th note delay.
; Voice1 uses 2 bytes for the 8th rest for the challenging
;  stage completed music.
; Voice0 uses 69 bytes.
; Voice1 uses 59 bytes.
; 130 bytes used in total.
;----------------------------------------------------------
ChallengingStageFinished_Voice1:
    .byte T150_8, VOICE_REST + 0 ; 8th note delay

ChallengingStageFinished_Voice0:    
MainTheme_Voice0:
    .byte T150_DOT8, VOICE_LEAD + LEAD_D4
    .byte T150_16,   VOICE_LEAD + LEAD_G3
    .byte T150_DOT8, VOICE_LEAD + LEAD_A3
    .byte T150_16,   VOICE_LEAD + LEAD_C4
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_B3
    .byte T150_16,   VOICE_LEAD + LEAD_G3
    .byte T150_DOT8, VOICE_LEAD + LEAD_A3
    .byte T150_16,   VOICE_LEAD + LEAD_E4
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_D4
    .byte T150_16,   VOICE_LEAD + LEAD_G3
    .byte T150_DOT8, VOICE_LEAD + LEAD_A3
    .byte T150_16,   VOICE_LEAD + LEAD_C4
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_B3
    .byte T150_16,   VOICE_LEAD + LEAD_G3
    .byte T150_DOT8, VOICE_LEAD + LEAD_D4
    .byte T150_16,   VOICE_LEAD + LEAD_Fis4
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_G4
    .byte T150_16,   VOICE_LEAD + LEAD_F4
    .byte T150_DOT8, VOICE_LEAD + LEAD_Es4
    .byte T150_16,   VOICE_LEAD + LEAD_D4
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_C4
    .byte T150_16,   VOICE_LEAD + LEAD_Bes3
    .byte T150_DOT8, VOICE_LEAD + LEAD_A3
    .byte T150_16,   VOICE_LEAD + LEAD_F3
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_F4
    .byte T150_16,   VOICE_LEAD + LEAD_G4
    .byte T150_DOT8, VOICE_LEAD + LEAD_F4
    .byte T150_16,   VOICE_LEAD + LEAD_D4
    ;
    .byte T150_TRIP8, VOICE_LEAD + LEAD_E4
    .byte T150_TRIP8, VOICE_LEAD + LEAD_C4
    .byte T150_TRIP8, VOICE_LEAD + LEAD_A3
    .byte T150_TRIP8, VOICE_LEAD + LEAD_D4
    .byte T150_TRIP8, VOICE_LEAD + LEAD_B3
    .byte T150_TRIP8, VOICE_LEAD + LEAD_A3
    .byte $FF ; end
    
MainTheme_Voice1:
    .byte T150_4,    VOICE_LEAD + LEAD_B3
    .byte T150_4,    VOICE_LEAD + LEAD_E3
    ;
    .byte T150_4,    VOICE_LEAD + LEAD_G3
    .byte T150_DOT8, VOICE_LEAD + LEAD_E3
    .byte T150_16,   VOICE_LEAD + LEAD_Fis3
    ;
    .byte T150_4,    VOICE_LEAD + LEAD_B3
    .byte T150_4,    VOICE_LEAD + LEAD_E3
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_G3
    .byte T150_16,   VOICE_LEAD + LEAD_E3
    .byte T150_DOT8, VOICE_LEAD + LEAD_A3
    .byte T150_16,   VOICE_LEAD + LEAD_D4
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_Es4
    .byte T150_16,   VOICE_LEAD + LEAD_D4
    .byte T150_DOT8, VOICE_LEAD + LEAD_C4
    .byte T150_16,   VOICE_LEAD + LEAD_Bes3
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_A3
    .byte T150_16,   VOICE_LEAD + LEAD_G3
    .byte T150_DOT8, VOICE_LEAD + LEAD_F3
    .byte T150_16,   VOICE_LEAD + LEAD_A3
    ;
    .byte T150_DOT8, VOICE_LEAD + LEAD_Bes3
    .byte T150_16,   VOICE_LEAD + LEAD_C4
    .byte T150_DOT8, VOICE_LEAD + LEAD_Bes3
    .byte T150_16,   VOICE_LEAD + LEAD_G3
    ;
    .byte T150_TRIP8, VOICE_LEAD + LEAD_C4
    .byte T150_TRIP8, VOICE_LEAD + LEAD_A3
    .byte T150_TRIP8, VOICE_LEAD + LEAD_E3
    .byte T150_TRIP8, VOICE_LEAD + LEAD_A3
    .byte T150_TRIP8, VOICE_LEAD + LEAD_Fis3
    .byte T150_TRIP8, VOICE_LEAD + LEAD_E3
    .byte $FF ; end

    
    ORG $FDE4
;-----------------------------------------------
; Music for the start of the challenging stage.
; Voice0 uses 13 bytes.
; Voice1 uses 13 bytes.
; 26 bytes used in total
;-----------------------------------------------

ChallengingStage_Voice0:
    .byte T171_TRIP4, VOICE_LEAD + LEAD_A3
    .byte T171_TRIP8, VOICE_REST + 0
    .byte T171_TRIP8, VOICE_LEAD + LEAD_A3
    .byte T171_TRIP8, VOICE_LEAD + LEAD_Bes3
    .byte T171_TRIP8, VOICE_LEAD + LEAD_C4
    .byte T171_4,     VOICE_LEAD + LEAD_D4
    .byte $FF
    
ChallengingStage_Voice1:
    .byte T171_TRIP4, VOICE_LEAD + LEAD_E3
    .byte T171_TRIP8, VOICE_REST + 0
    .byte T171_TRIP8, VOICE_LEAD + LEAD_E3
    .byte T171_TRIP8, VOICE_LEAD + LEAD_F3
    .byte T171_TRIP8, VOICE_LEAD + LEAD_G3
    .byte T171_4,     VOICE_LEAD + LEAD_A3
    .byte $FF
    
    ORG $FDFE
    ; 2 bytes wasted, only put in here to help me keep track of ROM usage
    .byte $FF, $FF



    ORG $FE00
;-------------------------------------------------------------
; Music for when a challenging stage is completed perfectly.
; Voice0 uses 100 bytes
; Voice1 uses 118 bytes (no stop byte, goes into dive-bomb)
; 218 bytes used in total.
;
; This song is split so neither voice crosses page boundaries
;-------------------------------------------------------------
ChallengingStageFinishedPerfect_Voice0:
    .byte T180_8,      VOICE_LEAD + LEAD_B3
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16_SH1, VOICE_LEAD + LEAD_B3
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_8,      VOICE_LEAD + LEAD_B3
    .byte T180_8,      VOICE_LEAD + LEAD_A3
    ;
    .byte T180_8, VOICE_REST + 0
    .byte T180_8, VOICE_LEAD + LEAD_A3
    .byte T180_8, VOICE_REST + 0
    .byte T180_8, VOICE_LEAD + LEAD_A3
    ;
    .byte T180_8,      VOICE_LEAD + LEAD_C4
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16_SH1, VOICE_LEAD + LEAD_C4
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_8,      VOICE_LEAD + LEAD_C4
    .byte T180_8,      VOICE_LEAD + LEAD_B3
    ;
    .byte T180_8, VOICE_REST + 0
    .byte T180_8, VOICE_LEAD + LEAD_B3
    .byte T180_8, VOICE_REST + 0
    .byte T180_8, VOICE_LEAD + LEAD_B3
    ;
    ; Start same rhythm
    .byte T180_16_SH1, VOICE_LEAD + LEAD_C4
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_C4
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16_SH1, VOICE_LEAD + LEAD_C4
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_C4
    .byte T180_16,     VOICE_REST + 0
    
    .byte T180_16_SH1, VOICE_LEAD + LEAD_D4
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_D4
    ;
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16_SH1, VOICE_LEAD + LEAD_D4
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_D4
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_D4
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_D4
    .byte T180_16,     VOICE_REST + 0
    ; End same rhythm
    ;
    .byte T180_16_SH1,  VOICE_LEAD + LEAD_E4
    .byte T180_16_SH2,  VOICE_REST + 0
    .byte T180_16,      VOICE_LEAD + LEAD_E4
    .byte T180_16,      VOICE_REST + 0
    .byte T180_16_SH1,  VOICE_LEAD + LEAD_E4
    .byte T180_16_SH2,  VOICE_REST + 0
    .byte T180_16,      VOICE_LEAD + LEAD_E4
    .byte T180_16,      VOICE_REST + 0
    .byte T180_16,      VOICE_LEAD + LEAD_E4
    .byte $FF
    
    
    ORG $FE64
;---------------------------------------------
; Sound effect for when a butterfly is killed
; uses 27 bytes
;---------------------------------------------
KillButterfly:
    .byte 1, VOICE_LEAD +   LEAD_D4
    .byte 1, VOICE_LEAD +   LEAD_E4
    .byte 1, VOICE_LEAD +   LEAD_Fis4
    .byte 1, VOICE_LEAD +   LEAD_G4
    .byte 1, VOICE_LEAD +   LEAD_A4
    .byte 1, VOICE_SQUARE + SQUARE_B4
    .byte 1, VOICE_SQUARE + SQUARE_Cis5
    .byte 7, VOICE_LEAD +   LEAD_D5
    .byte 1, VOICE_LEAD +   LEAD_Bes4
    .byte 2, VOICE_LEAD +   LEAD_A4
    .byte 1, VOICE_LEAD +   LEAD_G4
    .byte 1, VOICE_LEAD +   LEAD_Ges4
    .byte 1, VOICE_LEAD +   LEAD_F4
    .byte $FF
    
    
    ORG $FE7F
;---------------------------------------
; Sound effect for when a bee is killed
; Also used for a dragonfly's death
; uses 39 bytes
;---------------------------------------
KillBee:
    .byte 2, VOICE_LEAD +   LEAD_G4
    .byte 1, VOICE_LEAD +   LEAD_A4
    .byte 2, VOICE_SQUARE + SQUARE_B4
    .byte 2, VOICE_LEAD +   LEAD_Bes4
    .byte 1, VOICE_LEAD +   LEAD_A4
    .byte 1, VOICE_SQUARE + SQUARE_Aes5
    .byte 3, VOICE_LEAD +   LEAD_G4
    .byte 1, VOICE_LEAD +   LEAD_C4
    .byte 1, VOICE_LEAD +   LEAD_Cis4
    .byte 1, VOICE_LEAD +   LEAD_D4
    .byte 1, VOICE_LEAD +   LEAD_Dis4
    .byte 1, VOICE_LEAD +   LEAD_E4
    .byte 1, VOICE_LEAD +   LEAD_Dis4
    .byte 1, VOICE_LEAD +   LEAD_D4
    .byte 1, VOICE_LEAD +   LEAD_Cis4
    .byte 1, VOICE_LEAD +   LEAD_C4
    .byte 1, VOICE_LEAD +   LEAD_B3
    .byte 1, VOICE_LEAD +   LEAD_Bes3
    .byte 1, VOICE_LEAD +   LEAD_A3   
    .byte $FF
    
    
    ORG $FEA6
;------------------------------------------
; Sound effects for hitting a Boss Galaga.
; uses 55 bytes
;------------------------------------------
KillBossGalaga: ; Second hit
    .byte 1, VOICE_LEAD + LEAD_F3
    .byte 1, VOICE_LEAD + LEAD_Fis3
    .byte 2, VOICE_LEAD + LEAD_G3
    .byte 1, VOICE_LEAD + LEAD_Gis3
    .byte 1, VOICE_LEAD + LEAD_A3
    .byte 2, VOICE_LEAD + LEAD_Ais3
    .byte 1, VOICE_LEAD + LEAD_B3
    .byte 1, VOICE_LEAD + LEAD_C4
    .byte 3, VOICE_LEAD + LEAD_Cis4
    
    .byte 1, VOICE_LEAD + LEAD_G3
    .byte 1, VOICE_LEAD + LEAD_Gis3
    .byte 2, VOICE_LEAD + LEAD_A3
    .byte 1, VOICE_LEAD + LEAD_Ais3
    .byte 1, VOICE_LEAD + LEAD_B3
    .byte 2, VOICE_LEAD + LEAD_C4
    .byte 1, VOICE_LEAD + LEAD_Cis4
    .byte 1, VOICE_LEAD + LEAD_D4
    .byte 3, VOICE_LEAD + LEAD_Dis4
    
FirstHitBossGalaga: ; First hit
    .byte 1, VOICE_LEAD + LEAD_A3
    .byte 1, VOICE_LEAD + LEAD_Ais3
    .byte 2, VOICE_LEAD + LEAD_B3
    .byte 1, VOICE_LEAD + LEAD_C4
    .byte 1, VOICE_LEAD + LEAD_Cis4
    .byte 2, VOICE_LEAD + LEAD_D4
    .byte 1, VOICE_LEAD + LEAD_Dis4
    .byte 1, VOICE_LEAD + LEAD_E4
    .byte 2, VOICE_LEAD + LEAD_F4
    .byte $FF
    

    ORG $FEDD
;-------------------------------------------------------------
; Sound effect used when a Boss Galaga uses it's tractor beam
; Should be looped in the program.
; uses 17 bytes.
;-------------------------------------------------------------
TRACTOR_BEAM_LENGTH = 16 ; ; number of frames that it takes to play the sound
TractorBeam:
    .byte 2, VOICE_LEAD +   LEAD_G4
    .byte 2, VOICE_LEAD +   LEAD_E4
    .byte 2, VOICE_LEAD +   LEAD_Fis4
    .byte 2, VOICE_LEAD +   LEAD_D4
    .byte 2, VOICE_LEAD +   LEAD_E4
    .byte 2, VOICE_LEAD +   LEAD_C4
    .byte 2, VOICE_LEAD +   LEAD_D4
    .byte 2, VOICE_LEAD +   LEAD_B3
    .byte $FF

    
    ORG $FEEE
;----------------------------------------------------------------------
; Sound effect used when the player's ship is caught in a tractor beam
; Should be looped in the program.
; uses 17 bytes
;----------------------------------------------------------------------
CAUGHT_IN_TRACTOR_BEAM_LENGTH = 16 ; number of frames that it takes to play the sound
CaughtInTractorBeam:
    .byte 2, VOICE_LEAD +   LEAD_C4
    .byte 2, VOICE_LEAD +   LEAD_Dis4
    .byte 2, VOICE_LEAD +   LEAD_Fis4
    .byte 2, VOICE_LEAD +   LEAD_A4
    .byte 2, VOICE_LEAD +   LEAD_C5
    .byte 2, VOICE_LEAD +   LEAD_A4
    .byte 2, VOICE_LEAD +   LEAD_Fis4
    .byte 2, VOICE_LEAD +   LEAD_Dis4
    .byte $FF
    
    
    ORG $FEFF
    .byte $FF ; 1 byte wasted
    
    
    ORG $FF00
;--------------------------------------------
; Sound effect used when an enemy transforms 
; uses 17 bytes.
;--------------------------------------------  
EnemyTransform:
    .byte 4, VOICE_LEAD +   LEAD_G3
    .byte 4, VOICE_LEAD +   LEAD_A3
    .byte 4, VOICE_LEAD +   LEAD_G3
    .byte 4, VOICE_LEAD +   LEAD_A3
    .byte 4, VOICE_LEAD +   LEAD_C4
    .byte 4, VOICE_LEAD +   LEAD_D4
    .byte 4, VOICE_LEAD +   LEAD_C4
    .byte 4, VOICE_LEAD +   LEAD_D4
    .byte $FF
      
    
    
    
    
    ORG $FF11
;------------------------------------------------------------
; Voice1 of when a challenging stage is completed perfectly.
; uses 118 bytes (no stop byte, goes into dive-bomb effect)
;------------------------------------------------------------
ChallengingStageFinishedPerfect_Voice1:
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_16, VOICE_LEAD + LEAD_B3
    .byte T180_16, VOICE_LEAD + LEAD_D4
    .byte T180_16, VOICE_LEAD + LEAD_G4
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_16, VOICE_LEAD + LEAD_B3
    .byte T180_16, VOICE_LEAD + LEAD_D4
    .byte T180_16, VOICE_LEAD + LEAD_G4
    ;
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_16, VOICE_LEAD + LEAD_B3
    .byte T180_16, VOICE_LEAD + LEAD_D4
    .byte T180_16, VOICE_LEAD + LEAD_G4
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_16, VOICE_LEAD + LEAD_B3
    .byte T180_16, VOICE_LEAD + LEAD_D4
    .byte T180_16, VOICE_LEAD + LEAD_G4
    ;
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_16, VOICE_LEAD + LEAD_B3
    .byte T180_16, VOICE_LEAD + LEAD_D4
    .byte T180_16, VOICE_LEAD + LEAD_G4
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_16, VOICE_LEAD + LEAD_B3
    .byte T180_16, VOICE_LEAD + LEAD_D4
    .byte T180_16, VOICE_LEAD + LEAD_G4
    ;
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_16, VOICE_LEAD + LEAD_B3
    .byte T180_16, VOICE_LEAD + LEAD_D4
    .byte T180_16, VOICE_LEAD + LEAD_G4
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_16, VOICE_LEAD + LEAD_B3
    .byte T180_16, VOICE_LEAD + LEAD_D4
    .byte T180_16, VOICE_LEAD + LEAD_G4
    ;
    ;
    ; Start same rhythm
    .byte T180_16_SH1, VOICE_LEAD + LEAD_Aes3
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_Aes3
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16_SH1, VOICE_LEAD + LEAD_Aes3
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_Aes3
    .byte T180_16,     VOICE_REST + 0
    
    .byte T180_16_SH1, VOICE_LEAD + LEAD_Bes3
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_Bes3
    ;
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16_SH1, VOICE_LEAD + LEAD_Bes3
    .byte T180_16_SH2, VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_Bes3
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_Bes3
    .byte T180_16,     VOICE_REST + 0
    .byte T180_16,     VOICE_LEAD + LEAD_Bes3
    .byte T180_16,     VOICE_REST + 0
    ; End same rhythm
    ;
    .byte T180_16, VOICE_LEAD + LEAD_C4
    .byte T180_16, VOICE_LEAD + LEAD_E3
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_8,  VOICE_LEAD + LEAD_C4
    .byte T180_16, VOICE_LEAD + LEAD_G3
    .byte T180_16, VOICE_LEAD + LEAD_E3
    .byte T180_16, VOICE_LEAD + LEAD_C4
    ;
    
    
    ORG $FF87
;-------------------------------------------------
; Sound effect for when enemies dive bomb you.
; The music for when a challenging stage has been
;  completed perfectly uses this at the end.
; uses 41 bytes
;-------------------------------------------------
DiveBomb:
    .byte 3, VOICE_SQUARE + SQUARE_G6
    .byte 3, VOICE_SQUARE + SQUARE_F6
    .byte 3, VOICE_SQUARE + SQUARE_D6
    .byte 3, VOICE_SQUARE + SQUARE_C6
    .byte 3, VOICE_SQUARE + SQUARE_Bes5
    .byte 3, VOICE_SQUARE + SQUARE_Aes5
    .byte 3, VOICE_SQUARE + SQUARE_F5
    .byte 3, VOICE_SQUARE + SQUARE_E5
    .byte 3, VOICE_SQUARE + SQUARE_D5
    .byte 3, VOICE_SQUARE + SQUARE_C5
    .byte 3, VOICE_LEAD +   LEAD_Bes4
    .byte 3, VOICE_LEAD +   LEAD_G4
    .byte 3, VOICE_LEAD +   LEAD_F4
    .byte 3, VOICE_LEAD +   LEAD_Es4
    .byte 3, VOICE_LEAD +   LEAD_Des4
    .byte 3, VOICE_LEAD +   LEAD_B3
    .byte 3, VOICE_LEAD +   LEAD_A3
    .byte 3, VOICE_LEAD +   LEAD_G3
    .byte 3, VOICE_LEAD +   LEAD_F3
    .byte 3, VOICE_LEAD +   LEAD_E3
    .byte $FF
    
    
    ORG $FFB0
;--------------------------------------------------------
; Sound effect used for when the player's fighter shoots
; a missle.
; uses 31 bytes
;--------------------------------------------------------
FireMissle:
    .byte 1, VOICE_SQUARE + SQUARE_C6
    .byte 1, VOICE_SQUARE + SQUARE_B5
    .byte 1, VOICE_SQUARE + SQUARE_A5
    .byte 1, VOICE_SQUARE + SQUARE_Aes5
    .byte 1, VOICE_SQUARE + SQUARE_G5
    .byte 1, VOICE_SQUARE + SQUARE_Ges5
    .byte 1, VOICE_SQUARE + SQUARE_F5
    .byte 1, VOICE_SQUARE + SQUARE_E5
    .byte 1, VOICE_SQUARE + SQUARE_D5
    .byte 1, VOICE_SQUARE + SQUARE_C5
    .byte 1, VOICE_LEAD +   LEAD_Bes4
    .byte 1, VOICE_LEAD +   LEAD_G4
    .byte 1, VOICE_LEAD +   LEAD_Fis4
    .byte 1, VOICE_LEAD +   LEAD_E4
    .byte 1, VOICE_LEAD +   LEAD_D4
    .byte $FF

    
    ORG $FFCF
;--------------------------------------------------
; Music used when an extra life is obtained
; uses 26 bytes
;--------------------------------------------------
ExtraLife_Voice0:
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_G5
    .byte T150_16, VOICE_SQUARE + SQUARE_B5
    .byte T150_8,  VOICE_SQUARE + SQUARE_D6
    .byte $FF
ExtraLife_Voice1:
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_B4
    .byte T150_16, VOICE_SQUARE + SQUARE_D5
    .byte T150_16, VOICE_SQUARE + SQUARE_E5
    .byte T150_16, VOICE_SQUARE + SQUARE_G5
    .byte T150_8,  VOICE_SQUARE + SQUARE_B5
    .byte $FF
    
    ORG $FFE9
;--------------------------------------
; Sound effect used when "placing" the
; badges representing the levels
; uses 9 bytes
;--------------------------------------
PlaceBadge:
    .byte 2, VOICE_SQUARE + SQUARE_Cis5
    .byte 2, VOICE_LEAD +   LEAD_A5
    .byte 2, VOICE_SQUARE + SQUARE_B4
;------------------------------------------------------
; Silence.
; Used in sound test program, uses no additional bytes
;------------------------------------------------------
Silence:
    .byte 2, VOICE_REST +   0 ; rest because several might be
                           ; played in sucession
    .byte $FF
    
    
    ORG $FFF2
;-------------------------------------------------------
; Explosion sound effect used when a fighter controlled
; by the player is destroyed.
; uses 5 bytes
;-------------------------------------------------------
FighterDestroyed:
    ;.byte 2,  VOICE_NOISE + 3
    ;.byte 2,  VOICE_NOISE + 4
    ;.byte 3,  VOICE_NOISE + 5
    ;.byte 3,  VOICE_NOISE + 6
    ;byte 4,  VOICE_NOISE + 7
    .byte 4,  VOICE_NOISE + 8
    .byte 44, VOICE_NOISE + 9
    .byte $FF
    
    
    ORG $FFF7
;----------------------
; Table of distortions
; uses 3 bytes
;----------------------
DistortionTable:
    .byte VOICE_SQUARE_DIST
    .byte VOICE_NOISE_DIST
    .byte VOICE_LEAD_DIST
    
    ; IntVectors go here
    ; 0 bytes wasted
    
    

