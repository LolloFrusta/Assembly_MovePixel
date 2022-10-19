.org $8000

start:
;---------------------------------------------



LDA #0
STA ($01),Y
LDA #1
STA $0200 

LDA #$00
STA $01
LDA #$02
STA $02
loop:

LDA $4000

CMP #$08
BEQ moveRight

CMP #01
BEQ moveUp

CMP #02
BEQ moveDown

CMP #04
BEQ moveLeft



LDA #1
STA ($01),Y

BNE loop


moveRight:
LDA #0
STA ($01),Y
INC $0001
JMP loop

moveUp:
;Reset Black Color
LDA #0
STA ($01),Y
;----------
LDA $0001
SBC #$10
STA $0001
JMP loop

moveDown:
LDA #0
STA ($01),Y
LDA $0001
ADC #$F
STA $0001
JMP loop

moveLeft:
LDA #0
STA ($01),Y
DEC $0001
JMP loop

;---------------------------------------------------
JMP start

.goto $FFFA
.dw start
.dw start
.dw start 