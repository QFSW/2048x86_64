PUBLIC pinput
EXTERN print:PROC
EXTERN getchar:PROC

ASCII_w EQU 119
ASCII_d EQU 100
ASCII_s EQU 115
ASCII_a EQU 97
ASCII_LINE EQU 10

.data
	inputstr db "Please input a move: ", 0
	invlstr db "Invalid move, please enter a move: ", 0

.code
pinput PROC
	ENTER 32, 0
	LEA RCX, inputstr
	CALL print
ploop:
	CALL getchar
	CMP RAX, ASCII_LINE
	JE ploop
	CMP RAX, ASCII_w
	MOV RDX, 0
	JE pend
	CMP RAX, ASCII_d
	MOV RDX, 1
	JE pend
	CMP RAX, ASCII_s
	MOV RDX, 2
	JE pend
	CMP RAX, ASCII_a
	MOV RDX, 3
	JE pend
	LEA RCX, invlstr
	CALL print
	JMP ploop
pend:
	MOV RAX, RDX
	LEAVE
	RET
pinput ENDP

END