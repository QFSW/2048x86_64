PUBLIC game_main
EXTERN checkgrid:PROC
EXTERN printgrid:PROC, initgrid:PROC, mergegrid:PROC, rotategridn:PROC
EXTERN addnum:PROC
EXTERN print:PROC, pinput:PROC
EXTERN rseedt:PROC

GRID_WIDTH EQU 4
GRID_SIZE EQU GRID_WIDTH * GRID_WIDTH

.data
	intro db "Welcome to 2048!", 0
	gameoverstr db "Game over!", 0
	grid dq GRID_SIZE DUP(0)
	grbuf dq GRID_SIZE DUP(?)

.code
; entry point and main function of the game
game_main PROC
	PUSH R12
	ENTER 16, 0

	CALL rseedt

	LEA RCX, grid
	MOV RDX, GRID_SIZE
	CALL initgrid

	LEA RCX, intro
	CALL print

gameloop:
	LEA RCX, grid
	MOV RDX, GRID_WIDTH
	CALL printgrid

	CALL pinput
	MOV R12, RAX
	LEA RCX, grid
	LEA RDX, grbuf
	MOV R8, GRID_WIDTH
	MOV R9, R12
	CALL rotategridn

	LEA RCX, grid
	MOV RDX, GRID_WIDTH
	CALL mergegrid
	CMP RAX, 0
	JE legalmoveskp

	LEA RCX, grid
	MOV RDX, GRID_SIZE
	LEA R8, grbuf
	CALL addnum

legalmoveskp:
	CMP R12, 0
	JE gameoverchk
	LEA RCX, grid
	LEA RDX, grbuf
	MOV R8, GRID_WIDTH
	MOV R9, 4
	SUB R9, R12
	CALL rotategridn

gameoverchk:
	LEA RCX, grid
	MOV RDX, GRID_WIDTH
	MOV R8, GRID_SIZE
	CALL checkgrid
	CMP RAX, 0
	JE gameloop

gameover:
	LEA RCX, grid
	MOV RDX, GRID_WIDTH
	CALL printgrid

	LEA RCX, gameoverstr
	CALL print

	LEAVE
	POP R12
	MOV RAX, 0
    RET
game_main ENDP

END