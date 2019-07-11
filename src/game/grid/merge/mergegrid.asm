PUBLIC mergegrid
EXTERN mergerow:PROC

.code
; merges every row in the grid
; RCX = grid ptr
; RDX = grid width
; RAX = 1 : moved
;		3 : merged
mergegrid PROC
	ENTER 32, 0
	PUSH R12
	PUSH R13
	PUSH R14
	PUSH R15
	MOV R12, RCX ; grid ptr
	MOV R13, RDX ; grid width
	MOV R14, 0 ; row ctr
	MOV R15, 0 ; return

mloop:
	MOV RAX, R14 ; prepares row ptr
	MUL R13
	MOV RCX, 8
	MUL RCX
	MOV RCX, R12

	ADD RCX, RAX
	MOV RDX, R13
	CALL mergerow

	OR R15, RAX
	INC R14
	CMP R14, R13
	JL mloop

	MOV RAX, R15
	POP R15
	POP R14
	POP R13
	POP R12
	LEAVE
	RET
mergegrid ENDP

END