PUBLIC logn

.code
; RCX = num
; RDX = base
; RAX = result
logn PROC
	MOV R8, -1
	MOV R9, RDX
	MOV RAX, RCX

lloop:
	MOV RDX, 0
	DIV R9
	INC R8
	CMP RAX, 0
	JG lloop
	MOV RAX, R8
	RET
logn ENDP

END