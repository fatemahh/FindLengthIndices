.data
StringExample:
	.string "Example for string"
Result:
	.string "The length of the string: "
.text


main:

la a0, StringExample

jal ra, strlen # go into strlen Sort

la a0, Result # Ouput Result message
li a7, 4
ecall

mv a0, a1
li a7, 1
ecall

beq zero, zero, done

strlen:
addi sp, sp, -8
sw ra, 0(sp)
sw s0, 4(sp)

addi t0, x0, 0 # i=0
addi t2, zero, 0 # len = 0

Loop:
add t3, a0, t0 # address of str[i]
lb t1, 0(t3) # str[i]
beq t1, zero, End # str[i]!= '\0'
addi t0, t0, 1 # i++
addi t2, t2, 1 # len++
beq zero, zero, Loop # unconditional branch

End:
mv a1, t2 # move t2 to a0
lw ra, 0(sp)
lw s0, 4(sp)
addi sp, sp, 8
jr ra

done: