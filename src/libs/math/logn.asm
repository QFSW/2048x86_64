PUBLIC logn

.code
; finds the integer log of a number
; RCX = num
; RDX = base
; RAX = result
logn PROC
	MOV R8, -1 ; result ctr
	MOV R9, RDX ; base

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