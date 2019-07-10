PUBLIC mergenum

.code
; RCX = row ptr
; RDX = index
mergenum PROC
	MOV R9, [RCX + RDX * 8]
	CMP R9, 0
	JE skp
	MOV R8, RDX
	SUB RDX, 1
mloop:
	MOV RAX, [RCX + RDX * 8]
	CMP RAX, 0
	JE move
	CMP RAX, R9
	JE merge
mloopr:
	DEC RDX
	CMP RDX, 0
	JGE mloop
	RET
move:
	MOV [RCX + RDX * 8], R9
	MOV [RCX + R8 * 8], RAX
	MOV R8, RDX
	JMP mloopr
merge:
	MOV RAX, 0
	ADD [RCX + RDX * 8], R9
	MOV [RCX + R8 * 8], RAX
	RET
skp:
	RET
mergenum ENDP

END