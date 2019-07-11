PUBLIC pinput
EXTERN print:PROC, readl:PROC

ASCII_w EQU 119
ASCII_d EQU 100
ASCII_s EQU 115
ASCII_a EQU 97

MOVE_LEFT EQU 0
MOVE_UP EQU 1
MOVE_RIGHT EQU 2
MOVE_DOWN EQU 3

.data
	inputstr db "Please enter a move: ", 0
	invlstr db "Invalid move, please enter a move: ", 0

.code
; gets player input
; RAX = move
pinput PROC
	SUB RSP, 2
	ENTER 32, 0
	LEA RCX, inputstr
	CALL print

ploop:
	MOV RCX, RSP
	MOV RDX, 2
	CALL readl
	MOV AL, [RSP]
	CMP AL, ASCII_a
	MOV RDX, MOVE_LEFT
	JE pend
	CMP AL, ASCII_w
	MOV RDX, MOVE_UP
	JE pend
	CMP AL, ASCII_d
	MOV RDX, MOVE_RIGHT
	JE pend
	CMP AL, ASCII_s
	MOV RDX, MOVE_DOWN
	JE pend
	LEA RCX, invlstr
	CALL print
	JMP ploop
pend:
	MOV RAX, RDX
	LEAVE
	ADD RSP, 2
	RET
pinput ENDP

END