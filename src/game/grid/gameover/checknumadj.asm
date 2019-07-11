PUBLIC checknumadj

.code
; checks if there are any mergeable numbers adjacent to the bottom or left of this number
; RCX = grid ptr
; RDX = grid pos
; R8 = grid width
; RAX = check status
checknumadj PROC
	PUSH R12
	PUSH R13
	PUSH R14
	MOV R12, RCX ; grid ptr
	MOV R13, R8 ; grid width
	MOV R14, [RCX + RDX * 8] ; num

	MOV RAX, RDX ; split i into x and y
	MOV RDX, 0
	DIV R13

	MOV R8, RAX ; x
	MOV R9, RDX ; y

left:
	CMP R8, 0
	JE bottom   ; skips left if this is a leftmost tile
	MOV RAX, R9 ; y
	MUL R13
	ADD RAX, R8 ; x, y
	DEC RAX     ; x - 1, y
	CMP [RCX + RAX * 8], R14 ; checks if it is the same
	JE canmerge

bottom:
	CMP R9, 0
	JE nomerge  ; skips bottom if this is a bottommost tile
	MOV RAX, R9 ; y
	DEC RAX     ; y - 1
	MUL R13
	ADD RAX, R8 ; x, y - 1
	CMP [RCX + RAX * 8], R14 ; checks if it is the same
	JE canmerge

nomerge:
	MOV RAX, 0
	POP R14
	POP R13
	POP R12
	RET

canmerge:
	MOV RAX, 1
	POP R14
	POP R13
	POP R12
	RET
checknumadj ENDP

END