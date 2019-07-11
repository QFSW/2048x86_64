PUBLIC mergenum

.code
; merges or moves num at specified index
; RCX = row ptr
; RDX = index
; RAX = 1 : moved
;		3 : merged
mergenum PROC
	MOV R9, [RCX + RDX * 8] ; original num
	CMP R9, 0
	JE skp

	PUSH R12
	MOV R12, 0 ; moved ret
	MOV R8, RDX ; index
	SUB RDX, 1

mloop: ;loops through and looks for either merges or moves
	MOV RAX, [RCX + RDX * 8]
	CMP RAX, 0
	JE move
	CMP RAX, R9
	JE merge
; fall through to mend1

mend1: ; if can't merge or move then blocked, exit
	MOV RAX, R12
	POP R12
	RET

move: ; moves the number and re-enters the loop (expects RAX = 0)
	MOV [RCX + RDX * 8], R9
	MOV [RCX + R8 * 8], RAX
	MOV R8, RDX
	MOV R12, 1
; fall through to mloopr

mloopr:
	DEC RDX
	CMP RDX, 0
	JGE mloop
; falls through to mend2

mend2: ; if exhausted, exit
	MOV RAX, R12
	POP R12
	RET

merge: ; merges the number and terminates
	MOV RAX, 0
	ADD [RCX + RDX * 8], R9
	MOV [RCX + R8 * 8], RAX
; falls through to mend3

mend3: ; if merged, exit
	MOV RAX, 3
	POP R12
	RET

skp: ; if the number is 0, nothing to be done
	MOV RAX, 0
	RET
mergenum ENDP

END