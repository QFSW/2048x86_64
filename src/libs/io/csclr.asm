PUBLIC csclr
EXTERN system:PROC

.data
	clrstr db "@cls||clear", 0

.code
; clears the console
csclr PROC
	LEA RCX, clrstr
	CALL system
	RET
csclr ENDP

END