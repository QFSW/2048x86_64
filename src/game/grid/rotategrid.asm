PUBLIC rotategrid

.code
; RCX = src ptr
; RDX = dest ptr
; R8 = grid size
; R9 = grid width
rotategrid PROC
	PUSH R12
	PUSH R13
	PUSH R14
	MOV R12, RCX
	MOV R13, RDX
	MOV R14, 0
rloop: ;y2 = x1, x2 = n - y1
	MOV RAX, R14
	MOV RDX, 0
	DIV R9 ; RAX = x, RDX = y
	MOV RCX, RAX
	MOV RAX, RDX
	MUL R9
	ADD RAX, R9
	SUB RAX, RCX
	SUB RAX, 1
	MOV RCX, [R12 + RAX * 8]
	MOV [R13 + R14 * 8], RCX
	INC R14
	CMP R14, R8
	JL rloop

	POP R14
	POP R13
	POP R12
	RET
rotategrid ENDP

END