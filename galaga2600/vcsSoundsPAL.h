; NOTE PITCHES ARE NOT ACCURATE, JUST COPIED FROM NTSC DEFINITION FILE

;----------------------------------------------------------------------------------
; By Ross Keenum - June 2013
; References:
;   http://www.randomterrain.com/atari-2600-memories-music-and-sound.html
;   http://www.qotile.net/files/2600_music_guide.txt
;----------------------------------------------------------------------------------


;------------------------------------------
; Atari VCS Music Notes Definitions (PAL)
;   Note names are suffixed
;   with -is for sharp and -es
;   for flat. E-flat is Es.
;   
;   If there are different pitches
;   that fall on the same note, the
;   less in tune one with the distortion
;   as a whole will have _ALT
;   suffixed to the definition name.
;
;   The amount of cents sharp or flat of
;   each note is given in a comment
;   after the the note definition.
;------------------------------------------


;---------------------------------------
; Note length by frame, based on tempo
; Used in music. Sound effects are done
;  by raw frame number
;---------------------------------------
; 150bpm. Used in main theme
; actual tempo = 150bpm
T150_16     = 5
T150_8      = 10
T150_4      = 20
T150_DOT8   = 15
T150_TRIP8  = 7 ; not exact, but doesn't matter
                ; for the galaga main theme
                ; should be 6.667


; 171bpm. Used in Challenging Stage theme
; actual tempo = 166.667bpm
T171_4      = 18
T171_TRIP4  = 12
T171_TRIP8  = 6


; 180bpm. Used in theme played when a challenging stage is
;  completed perfectly
; actual tempo = 187.5bpm
T180_4      = 16 ;
T180_8      = 8
T180_16     = 4
T180_16_SH1 = 3 ; for detatched 16th
T180_16_SH2 = 1 ; the rest part
T180_DOT8   = 12


;--------------------------------------------
; used to indicate a rest in my music driver
;--------------------------------------------
VOICE_REST = $E0

;---------------------------------
; First entry in distortion table
;---------------------------------
VOICE_SQUARE = $00
VOICE_SQUARE_DIST = 4
;---------------------------------
; Distortions 4 & 5 (Square Wave)
;---------------------------------

SQUARE_SILENT  = 0
SQUARE_B8      = 1  ; -9
SQUARE_E8      = 2  ; -11
SQUARE_B7      = 3  ; -10
SQUARE_G7      = 4  ; +4
SQUARE_E7      = 5  ; -11
SQUARE_Des7    = 6  ; +21
SQUARE_Cis7    = 6  ; +21
SQUARE_B6      = 7  ; -9
SQUARE_A6      = 8  ; -13
SQUARE_G6      = 9  ; +4
SQUARE_F6      = 10 ; +39
SQUARE_E6      = 11 ; -11
SQUARE_D6      = 12 ; +49
SQUARE_Des6    = 13 ; +22
SQUARE_Cis6    = 13 ; +22
SQUARE_C6      = 14 ; +2
SQUARE_B5      = 15 ; -10
SQUARE_Bes5    = 16 ; -15
SQUARE_Ais5    = 16 ; -15
SQUARE_A5      = 17 ; -14
SQUARE_Aes5    = 18 ; -7
SQUARE_Gis5    = 18 ; -7
SQUARE_G5      = 19 ; +4
SQUARE_Ges5    = 20 ; +20
SQUARE_Fis5    = 20 ; +20
SQUARE_F5      = 21 ; +39
SQUARE_F5_ALT  = 22 ; -38
SQUARE_E5      = 23 ; -12
SQUARE_Es5     = 24 ; +18
SQUARE_Dis5    = 24 ; +18
SQUARE_D5_ALT  = 25 ; +49
SQUARE_D5      = 26 ; -16
SQUARE_Des5     = 27 ; +21
SQUARE_Cis5     = 27 ; +21
SQUARE_Des5_ALT = 28 ; -40
SQUARE_Cis5_ALT = 28 ; -40
SQUARE_C5      = 29 ; +2
SQUARE_B4_ALT  = 30 ; +45
SQUARE_B4      = 31 ; -9


;----------------------------------
; Second entry in distortion table
;----------------------------------
VOICE_NOISE = $20
VOICE_NOISE_DIST = 8
;---------------------------------------
; Distortion 8 (Noise)
; No pitches are given because it would
; be meaningless to give them.
;---------------------------------------


;---------------------------------
; Third entry in distortion table
;---------------------------------
VOICE_LEAD = $40
VOICE_LEAD_DIST = 12
;---------------------------------------------------------
; Distortions 12 and 13 (Lead, lower pitched square wave)
;---------------------------------------------------------

LEAD_E8       = 0  ; -11
LEAD_E7       = 1  ; -11
LEAD_A6       = 2  ; -14
LEAD_E6       = 3  ; -11
LEAD_C6       = 4  ; +2
LEAD_A5       = 5  ; -14
LEAD_Ges5     = 6  ; +20
LEAD_Fis5     = 6  ; +20
LEAD_E5       = 7  ; -12
LEAD_D5       = 8  ; -16
LEAD_C5       = 9  ; +2
LEAD_Bes4     = 10 ; +39
LEAD_Ais4     = 10 ; +39
LEAD_A4       = 11 ; -13
LEAD_G4       = 12 ; +48
LEAD_Ges4     = 13 ; +20
LEAD_Fis4     = 13 ; +20
LEAD_F4       = 14 ; 0
LEAD_E4       = 15 ; -11
LEAD_Es4      = 16 ; -17
LEAD_Dis4     = 16 ; -17
LEAD_D4       = 17 ; -16
LEAD_Des4     = 18 ; -9
LEAD_Cis4     = 18 ; -9
LEAD_C4       = 19 ; +3
LEAD_B3       = 20 ; +18
LEAD_Bes3     = 21 ; +37
LEAD_Ais3     = 21 ; +37
LEAD_Bes3_ALT = 22 ; -40
LEAD_Ais3_ALT = 22 ; -40
LEAD_A3       = 23 ; -14
LEAD_Aes3     = 24 ; +15
LEAD_Gis3     = 24 ; +15
LEAD_G3_ALT   = 25 ; +47
LEAD_G3       = 26 ; -17
LEAD_Ges3     = 27 ; +19
LEAD_Fis3     = 27 ; +19
LEAD_Ges3_ALT = 28 ; -41
LEAD_Fis3_ALT = 28 ; -41
LEAD_F3       = 29 ; +1
LEAD_E3_ALT   = 30 ; +43
LEAD_E3       = 31 ; -11

