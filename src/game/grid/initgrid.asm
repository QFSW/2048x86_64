PUBLIC initgrid
EXTERN randn:PROC
EXTERN newnum:PROC

.code
; initializes the grid
; RCX = grid ptr
; RDX = grid size
initgrid PROC
	PUSH R12
	PUSH R13
	PUSH R14
	ENTER 32, 0
	MOV R12, RCX ; grid ptr
	MOV R13, RDX ; grid size

	MOV RCX, 0
	CALL randn

	MOV R14, RAX ; first tile
	CALL newnum
	MOV [R12 + R14 * 8], RAX

iloop: ;perhaps split this with a better binary split style algorithm
	MOV RCX, 0
	MOV RDX, R13
	CALL randn
	CMP RAX, R14
	JE iloop

	MOV R14, RAX ; override first tile with second tile, first no longer needed
	CALL newnum
	MOV [R12 + R14 * 8], RAX

	LEAVE
	POP R14
	POP R13
	POP R12
	RET
initgrid ENDP

END