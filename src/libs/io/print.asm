PUBLIC print
EXTERN putchar:PROC

.code
; prints a string
; RCX = str
print PROC
	PUSH R12
	ENTER 32, 0
	MOV R12, RCX ; str

ploop:
	MOV CL, [R12]
	CMP CL, 0
	JE pdone
	CALL putchar
	INC R12
	JMP ploop

pdone:
	LEAVE
	POP R12
	RET
print ENDP

END