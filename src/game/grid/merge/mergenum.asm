PUBLIC mergenum

.code
; RCX = row ptr
; RDX = index
; RAX = 1 : moved
;		3 : merged
mergenum PROC
	MOV R9, [RCX + RDX * 8]
	CMP R9, 0
	JE skp

	PUSH R12
	PUSH R13
	MOV R12, 0
	MOV R13, 0 ; block check
	MOV R8, RDX
	SUB RDX, 1
mloop:
	MOV RAX, [RCX + RDX * 8]
	CMP RAX, 0
	JE move
	CMP RAX, R9
	JE merge
	MOV R13, 1
mloopr:
	DEC RDX
	CMP RDX, 0
	JGE mloop
	MOV RAX, R12
	POP R13
	POP R12
	RET
move:
	MOV [RCX + RDX * 8], R9
	MOV [RCX + R8 * 8], RAX
	MOV R8, RDX
	OR R12, 1
	JMP mloopr
merge:
	CMP R13, 0
	JNE mloopr
	MOV RAX, 0
	ADD [RCX + RDX * 8], R9
	MOV [RCX + R8 * 8], RAX
	MOV RAX, 3
	POP R13
	POP R12
	RET
skp:
	RET
mergenum ENDP

END