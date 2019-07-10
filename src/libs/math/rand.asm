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
	MOV RAX, rnum
	RET
rand ENDP

END