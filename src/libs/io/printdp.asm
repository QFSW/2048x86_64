PUBLIC printdp
EXTERN putchar:PROC
EXTERN printd:PROC
EXTERN logn:PROC

ASCII_SPACE EQU 32

.code
; prints a number in decimal format with n digits of padding
; RCX = num
; RDX = digits
printdp PROC
	PUSH R12
	PUSH R13
	ENTER 32, 0
	MOV R12, RCX ; num
	MOV R13, RDX ; digits

	CALL printd
	MOV RCX, R12
	MOV RDX, 10

	CALL logn
	SUB R13, RAX

charloop:
	DEC R13
	JZ chardone
	MOV RCX, ASCII_SPACE
	CALL putchar
	JMP charloop

chardone:
	LEAVE
	POP R13
	POP R12
	RET
printdp ENDP

END