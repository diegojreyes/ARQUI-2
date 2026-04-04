.data

laberinto:
.byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
.byte 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
.byte 1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1
.byte 1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1
.byte 1,0,1,0,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1
.byte 1,0,1,0,1,0,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1
.byte 1,0,1,0,1,0,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,0,1
.byte 1,0,1,0,1,0,1,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,0,1
.byte 1,0,1,0,1,0,1,0,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,0,1,1,0,1,1,0,1,0,1
.byte 1,0,1,0,1,0,1,0,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,1,0,1,1,0,1,1,0,1,0,1
.byte 1,0,1,0,1,0,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,0,1,1,0,1,1,0,1,0,1
.byte 1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,1,1,0,1,1,0,1,0,1
.byte 1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,1,0,1,0,1
.byte 1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,1,1,0,1,0,1
.byte 1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,0,1,0,1
.byte 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,1,0,1
.byte 1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1
.byte 1,0,1,0,0,0,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
.byte 1,0,1,0,1,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1
.byte 1,0,1,0,1,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1
.byte 1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1
.byte 1,0,1,0,1,0,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1
.byte 1,0,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1
.byte 1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
.byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

colors:
.word 0x00FFFFFF, 0x0000FFFF, 0x00ff0000, 0x00000000, 0x0000FF00
directions:
.word -35, 35, -1, 1

.text
_start:
    li a0, LED_MATRIX_0_BASE      #Base address of the LED matrix
    la a1, laberinto     # pointer to laberinto data
    li a2, 875    # total pixels = 35 * 25
    la a3, colors
    la a4, directions
    li a5, D_PAD_0_BASE
    li a6, D_PAD_0_RIGHT
    li a7, 36

loop:
    lb t0, 0(a1)      # read one laberinto cell (0 or 1)

    beq t0, x0, draw_path      # if cell == 0, draw path

draw_wall:
    lw t0, 12(a3)              # draw wall
    sw t0, 0(a0)
    j next_pixel

draw_path:
    lw t0, 0(a3)
    sw t0, 0(a0)          # draw corridor
next_pixel:
    addi a1, a1, 1            # next labarinto byte
    addi a0, a0, 4                # next LED pixel (4 bytes)
    addi a2, a2, -1                # decrease cell counter by 1 
    bnez a2, loop            # continue loop until 875 cells drawn

pieces:
    # reset
    li a0, LED_MATRIX_0_BASE,
    la a1, laberinto
    # starting pixel
    lw t0, 4(a3) # starting pixel color
    sw t0, 144(a0) # chosen pixel offset start, for led matrix address 
    #end pixel
    lw t0, 8(a3)
    addi t1, x0, 838 # chosen pixel address
    slli t1, t1, 2
    add t1, t1, a0 # end address led matrix
    sw t0, 0(t1)
    j pol

move:
    slli t4, t4, 2
    add t2, a4, t4
    lw t2, 0(t2)

    add t3, a7, t2

    # Check maze collision
    add t5, a1, t3
    lb t6, 0(t5)

    bnez t6, pol
    # Clear old position
    slli t1, a7, 2
    add t1, a0, t1
    lw t0, 0(a3)
    sw t0, 0(t1)

    # Draw new position
    addi a7, t3, 0
    slli t0, a7, 2
    add t0, a0, t0
    lw t1, 4(a3)
    sw t1, 0(t0)
    addi t3, x0,838
    beq t3, a7, gameover
    j pol

gameover:
    # load green color
    lw t0, 16(a3)
    li t1, 0
    li a2, 875
    # loop that turns all pixels green
    green:
        sw t0, 0(a0)
        addi a0, a0, 4
        addi t1, t1, 1
        beq t1, a2, end
        j green

pol:
    # game loop that handles d-pad input
    li t0, D_PAD_0_BASE
    li t4, 0
    # cicle through all d-pad input addresses and pols signal
loop2:
    blt a6, t0, pol

    lw t1, 0(t0)
    # detect input
    bnez t1, move

    addi t0, t0, 4
    addi t4, t4, 1
    j loop2

end:
    #infinite loop
    j end
