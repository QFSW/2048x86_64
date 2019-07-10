PUBLIC initgrid
EXTERN randn:PROC

.code
; RCX = grid ptr
; RDX = grid size
initgrid PROC
	PUSH R12
	PUSH R13
	PUSH R14
	ENTER 32, 0
	MOV R12, RCX
	MOV R13, RDX

	MOV RCX, 0
	MOV RDX, R13
	CALL randn

	MOV R14, RAX
	MOV RCX, 2
	MOV [R12 + RAX * 8], RCX

iloop: ;perhaps split this with a better binary split style algorithm
	MOV RCX, 0
	MOV RDX, R13
	CALL randn
	CMP RAX, R14
	JE iloop
	MOV RCX, 2
	MOV [R12 + RAX * 8], RCX

	LEAVE
	POP R14
	POP R13
	POP R12
	RET
initgrid ENDP

END