PUBLIC game_main
EXTERN printgrid:PROC, initgrid:PROC, mergegrid:PROC, rotategridn:PROC
EXTERN addnum:PROC
EXTERN print:PROC, pinput:PROC
EXTERN puts:PROC, getchar:PROC
EXTERN rseedt:PROC

GRID_WIDTH EQU 4
GRID_SIZE EQU GRID_WIDTH * GRID_WIDTH

.data
	intro db "Welcome to 2048!", 0
	grid dq GRID_SIZE DUP(0)
	grbuf dq GRID_SIZE DUP(?)

.code
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
	MOV R8, GRID_SIZE
	MOV R9, R12
	CALL rotategridn

	LEA RCX, grid
	MOV RDX, GRID_WIDTH
	CALL mergegrid

	LEA RCX, grid
	MOV RDX, GRID_SIZE
	LEA R8, grbuf
	CALL addnum

	JMP gameloop

	LEAVE
	POP R12
    RET
game_main ENDP

END