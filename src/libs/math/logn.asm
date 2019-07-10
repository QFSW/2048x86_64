PUBLIC logn

.code
; RCX = num
; RDX = base
; RAX = result
logn PROC
	MOV R8, -1
	MOV R9, RDX

lloop:
	MOV RAX, RCX
	MOV RDX, 0
	DIV R9
	INC R8
	MOV RCX, RAX
	CMP RCX, 0
	JG lloop
	MOV RAX, R8
	RET
logn ENDP

END