PUBLIC checkgrid
EXTERN checknumadj:PROC

.code
; determines if the grid is in a checkgrid state
; RCX = grid ptr
; RDX = grid width
; R8 = grid size
; RAX = checkgrid status
checkgrid PROC
	PUSH R12
	PUSH R13
	PUSH R14
	MOV R12, RCX ; grid ptr
	MOV R13, RDX ; grid width
	MOV R14, R8 ; grid size / ctr

numloop:
	DEC R14
	MOV RAX, 0
	CMP [R12 + R14 * 8], RAX ; no gameover if there are any zeros
	JE safe

	MOV RCX, R12
	MOV RDX, R14
	MOV R8, R13
	CALL checknumadj ; no gameover if any merges are possible
	CMP RAX, 1
	JE safe

	CMP R14, 0
	JG numloop

lose:
	MOV RAX, 1
	POP R14
	POP R13
	POP R12
	RET

safe:
	MOV RAX, 0
	POP R14
	POP R13
	POP R12
	RET
checkgrid ENDP

END