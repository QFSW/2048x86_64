PUBLIC rand, rseed, rseedt

.data
	rnum dq 3749823

.code
; seeds the random number generator
; RCX = seed
rseed PROC
	MOV rnum, RCX
	RET
rseed ENDP

; auto seeds the random number generator with time
rseedt PROC
	RDTSC
	MOV rnum, RAX
	RET
rseedt ENDP

; gets a random number
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