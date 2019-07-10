PUBLIC rand, rseed, rseedt

.data
	rnum dq 3749823

.code
; RCX = seed
rseed PROC
	MOV rnum, RCX
	RET
rseed ENDP

rseedt PROC
	RDTSC
	MOV rnum, RAX
	RET
rseedt ENDP

; RAX = num
rand PROC
	ROR rnum, 17
	ADD rnum, 0110100b
	NOT rnum
	ROL rnum, 3
	MOV RAX, rnum
	RET
rand ENDP

END