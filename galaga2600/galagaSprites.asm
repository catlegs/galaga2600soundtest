; ALL SPRITES MUST BE LOCATED ON ONE PAGE
    ORG $FA00
    
    
;---------------------------
; Galaga Title Screen Logo.
; 6 8x24 sprites comprising
; a 48x24 image.
; uses 144 bytes
;---------------------------


;                        GGGG                     
;                    GGGGGGGGGGGGGG             GG
;                 GGGG           GGGGG        GGGG
;               GGGG   GG            GGGG   GGG  G
;        GGGG GGGGG  GGGG              GGGGGGG  GG
;      GGGGGGGG       GGG                  GGGGGG 
;     GGGG GG         GGG              G    GGGGG 
;    GGGG  G          GGG             GG      GG  
;   GGGG     GG  GGG  GGG  GGGG   GGGGG    GGGG   
;  GGGG   GGGGG GGGGG GGG GGGGGG GGGGGGG  GGGGGG  
;  GGGG    GGGGGGGGGG GGGGGGGGGG GGGGGGG GGGGGGG  
; GGGGGG  GGGG  GGGGG GGG  GGGGG GG GGGG   GGGGG  
; GGGGGGGGGGGG GGG GGGGGG GG GGGGGGGGG    GG GGGG 
; GGGGGGGGGGGGGGGGGGGGGGG GGGGGGGGGGG     GGGGGGG 
;  GGGGG GGGG GGGGGGG GGG GGGGG   GGGGGG GGGGGG   
;   GGG  GGG   GG  G  GG   G GG   GGGGGGGG G G    
;        GG                         G GGGG        
;        G   GG   GGG  GG   GG    GGG GGG         
;           G  G G    G  G G  G  GGG  GGG         
;             G  GGG  G GG G GG  GGG GGG          
;            G   G  G GG G GG G  GGGGGG           
;           G    G  G G  G G  G  GGGGG            
;           GGGG  GG   GG   GG   GGGG             
;                                G                

GALAGA_LOGO_HEIGHT = 24
GalagaLogo:
GalagaLogo1:
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte #%00000001
    .byte #%00000001
    .byte #%00111001
    .byte #%01111101
    .byte #%11111111
    .byte #%11111111
    .byte #%11111100
    .byte #%01111000
    .byte #%01111000
    .byte #%00111100
    .byte #%00011110
    .byte #%00001111
    .byte #%00000111
    .byte #%00000001
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    
GalagaLogo2:    
    .byte 0
    .byte #%00111100
    .byte #%00100001
    .byte #%00010001
    .byte #%00001001
    .byte #%00100101
    .byte #%00011000
    .byte #%10000000
    .byte #%11000110
    .byte #%11101111
    .byte #%11111111
    .byte #%11110111
    .byte #%11110011
    .byte #%01111111
    .byte #%11111011
    .byte #%00011001
    .byte #%01000000
    .byte #%01100000
    .byte #%11111000
    .byte #%11101111
    .byte #%00000011
    .byte 0
    .byte 0
    .byte 0
    
GalagaLogo3:
    .byte 0
    .byte #%11000110
    .byte #%00101001
    .byte #%00101101
    .byte #%11001011
    .byte #%00001001
    .byte #%11100110
    .byte 0
    .byte #%01001100
    .byte #%11101110
    .byte #%11111110
    .byte #%01111110
    .byte #%11101110
    .byte #%11101111
    .byte #%11101110
    .byte #%11001110
    .byte #%00001110
    .byte #%00001110
    .byte #%00001110
    .byte #%00011110
    .byte #%11000110
    .byte #%11110000
    .byte #%00011111
    .byte #%00000001

GalagaLogo4:
    .byte #%00000001
    .byte #%00110001
    .byte #%01001001
    .byte #%01101001
    .byte #%01011001
    .byte #%01001001
    .byte #%00110000
    .byte 0
    .byte #%01011000
    .byte #%11111000
    .byte #%11111111
    .byte #%11011111
    .byte #%01111101
    .byte #%11111101
    .byte #%11111101
    .byte #%01111000
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte #%00000001
    .byte #%11111111
    .byte #%11100000

GalagaLogo5:
    .byte 0
    .byte #%11100000
    .byte #%11110000
    .byte #%11111000
    .byte #%11011100
    .byte #%11001110
    .byte #%11101110
    .byte #%00101111
    .byte #%11111111
    .byte #%11111101
    .byte #%11100000
    .byte #%11110000
    .byte #%10111100
    .byte #%11111101
    .byte #%11111100
    .byte #%11111000
    .byte #%00001100
    .byte #%00000100
    .byte 0
    .byte #%00000111
    .byte #%00011110
    .byte #%11110000
    .byte #%10000000
    .byte 0

GalagaLogo6:
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0 
    .byte 0 
    .byte 0
    .byte #%01010000
    .byte #%11111000
    .byte #%11111110
    .byte #%11011110
    .byte #%01111100
    .byte #%11111100
    .byte #%11111100
    .byte #%01111000
    .byte #%00001100
    .byte #%00111110
    .byte #%01111110
    .byte #%11110011
    .byte #%00111001
    .byte #%00001111
    .byte #%00000011
    .byte 0


    
    
    
    ;ORG $FA90
    
SCORE_DIGIT_HEIGHT = 8
;----------------------------
; 6 digit score font
; 10 8x8 sprites from 0 to 9
; 80 bytes of data
;----------------------------

ScoreFont:

ScoreFont0:
    .byte 0
    .byte %00111000
    .byte %01100100
    .byte %11000110
    .byte %11000110
    .byte %11000110
    .byte %01001100
    .byte %00111000

    
ScoreFont1:
    .byte 0
    .byte %01111110
    .byte %00011000
    .byte %00011000
    .byte %00011000
    .byte %00011000
    .byte %00111000
    .byte %00011000


ScoreFont2:
    .byte 0
    .byte %11111110
    .byte %11100000
    .byte %01111000
    .byte %00111100
    .byte %00001110
    .byte %11000110
    .byte %01111100


ScoreFont3:
    .byte 0
    .byte %01111100
    .byte %11000110
    .byte %00000110
    .byte %00111100
    .byte %00011000
    .byte %00001100
    .byte %01111110

    
ScoreFont4:
    .byte 0
    .byte %00001100
    .byte %00001100
    .byte %11111110
    .byte %11001100
    .byte %01101100
    .byte %00111100
    .byte %00011100

ScoreFont5:
    .byte 0
    .byte %01111100
    .byte %11000110
    .byte %00000110
    .byte %00000110
    .byte %11111100
    .byte %11000000
    .byte %11111100
    
ScoreFont6:
    .byte 0
    .byte %01111100
    .byte %11000110
    .byte %11000110
    .byte %11111100
    .byte %11000000
    .byte %01100000
    .byte %00111000
    
ScoreFont7:
    .byte 0
    .byte %00110000
    .byte %00110000
    .byte %00110000
    .byte %00011000
    .byte %00001100
    .byte %11000110
    .byte %11111110

ScoreFont8:
    .byte 0
    .byte %01111100
    .byte %10000110
    .byte %10011110
    .byte %01111000
    .byte %11100100
    .byte %11000100
    .byte %01111000
    
ScoreFont9:
    .byte 0
    .byte %01111000
    .byte %00001100
    .byte %00000110
    .byte %01111110
    .byte %11000110
    .byte %11000110
    .byte %01111100
    
WORD_HEIGHT = 7
;-------------------------------------
; Sprites for the words "Press Fire"
; comprised of 5 8x7 sprites totaling
; a 40x7 image.
; uses 35 bytes.
;-------------------------------------
PressFire:

PressFire1:
    .byte %10001010
    .byte %10001010
    .byte %10001010
    .byte %10001010
    .byte %11101100
    .byte %10101010
    .byte %01100110
    
PressFire2:
    .byte %11101110
    .byte %10000010
    .byte %10000010
    .byte %10000010
    .byte %11100100
    .byte %10001000
    .byte %01101110

PressFire3:
    .byte %11100001
    .byte %00100001
    .byte %00100001
    .byte %00100001
    .byte %01000001
    .byte %10000001
    .byte %11100000

PressFire4:
    .byte %00010101
    .byte %00010101
    .byte %00010101
    .byte %00010101
    .byte %11010110
    .byte %00010101
    .byte %11010011
    
PressFire5:
    .byte %01110000
    .byte %01000000
    .byte %01000000
    .byte %01000000
    .byte %01110000
    .byte %01000000
    .byte %00110000
    
    ;ORG $FAD6
    
SHIP_SPRITE_HEIGHT = 8
;----------------------------
; Sprite for the ship
; 1 8x8 sprite
; 8 bytes of data
;----------------------------
ShipSprite:
    .byte #%10010010
    .byte #%11010110
    .byte #%11111110
    .byte #%10111010
    .byte #%10111010
    .byte #%00111000
    .byte #%00010000
    .byte #%00010000
    
    ;ORG $FADE
    
Word_Button:
Word_Button1:
    .byte %11101110
    .byte %10101010
    .byte %10101010
    .byte %10101010
    .byte %11001010
    .byte %10101010
    .byte %01101010
    
Word_Button2:
    .byte %01000100
    .byte %01000100
    .byte %01000100
    .byte %01000100
    .byte %01000100
    .byte %01000100
    .byte %11101110
    
Word_Button3:
    .byte %11101010
    .byte %10101010
    .byte %10101010
    .byte %10101010
    .byte %10101010
    .byte %10101100
    .byte %01101000
    
    
    
