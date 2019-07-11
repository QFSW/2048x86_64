PUBLIC addnum
EXTERN randn:PROC
EXTERN newnum:PROC

.code
; adds a new number into an empty slot in the grid
; RCX = grid ptr
; RDX = grid size
; R8 = grbuf
addnum PROC
	PUSH R12
	PUSH R13
	PUSH R14
	ENTER 32, 0
	MOV R12, RCX ; grid ptr
	MOV R13, RDX ; grid size
	MOV R14, R8 ; grbuf
	MOV RCX, 0
	MOV RDX, 0

searchloop:
	MOV RAX, [R12 + RCX * 8]
	CMP RAX, 0
	JNE numnotfound
	MOV [R14 + RDX * 8], RCX ; adds index as free slot
	INC RDX
numnotfound:
	INC RCX
	CMP RCX, R13
	JL searchloop

	MOV RCX, 0
	CALL randn
	MOV R13, RAX ; now used to store randn result, grid size no longer needed

	CALL newnum
	MOV RDX, [R14 + R13 * 8] ; loads index
	MOV [R12 + RDX * 8], RAX ; stores value

	LEAVE
	POP R14
	POP R13
	POP R12
	RET
addnum ENDP

END