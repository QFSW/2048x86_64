PUBLIC game_main
EXTERN print:PROC, strlen:PROC

.data
	intro db "Welcome to 2048!", 0

.code
game_main PROC
	ENTER 16, 0

	LEA RCX, intro
	CALL print

	LEA RCX, intro
	CALL strlen
	
	LEAVE
    RET
game_main ENDP

END