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
	inputstr db "Please input a move: ", 0
	invlstr db "Invalid move, please enter a move: ", 0

.code
; RAX = move
pinput PROC
	SUB RSP, 8
	ENTER 32, 0
	LEA RCX, inputstr
	CALL print
ploop:
	MOV RCX, RSP
	MOV RDX, 1
	CALL readl
	MOV RAX, [RSP]
	CMP RAX, ASCII_a
	MOV RDX, MOVE_LEFT
	JE pend
	CMP RAX, ASCII_w
	MOV RDX, MOVE_UP
	JE pend
	CMP RAX, ASCII_d
	MOV RDX, MOVE_RIGHT
	JE pend
	CMP RAX, ASCII_s
	MOV RDX, MOVE_DOWN
	JE pend
	LEA RCX, invlstr
	CALL print
	JMP ploop
pend:
	MOV RAX, RDX
	LEAVE
	ADD RSP, 8
	RET
pinput ENDP

END