PUBLIC print
EXTERN putchar:PROC

.code
; RCX = str
print PROC
	PUSH R12
	PUSH R13
	PUSH R14
	ENTER 32, 0

	MOV R12, RCX
	MOV R13, 0

ploop:
	MOV RCX, 0
	MOV CL, [R12 + R13]
	MOV R14, RCX
	CMP R14, 0
	JE pdone
	CALL putchar
	INC R13
	JMP ploop

pdone:
	LEAVE
	POP R14
	POP R13
	POP R12
	RET
print ENDP

END