PUBLIC mergenum

.code
; RCX = row ptr
; RDX = index
mergenum PROC
	MOV R8, 0
	MOV R9, [RCX + RDX * 8]
mloop:
	MOV RAX, [RCX + R8 * 8]
	CMP RAX, 0
	JE mmove
	INC R8
	CMP R8, RDX
	JL mloop
	RET
mmove:
	MOV [RCX + R8 * 8], R9
	MOV [RCX + RDX * 8], RAX
	RET
mergenum ENDP

END