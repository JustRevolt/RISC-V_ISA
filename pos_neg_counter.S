.data
N:
.word 5
M:
.word 6
matrix:
.word -1,  2,  3,  4,  5
.word -18, 19, 0, -21, 6
.word -17, 28, 29, 22, 7
.word -16, 27, 0, -23, 8
.word -15, 26, 25, 24, 9
.word -14, 13, 12, 11, 10
result:
.word 0 # amount of positive numbers
.word 0 # amount of negative numbers

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
la a2, result
call print
call exit

print:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a2)
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 32
ecall

addi a0, x0, 1 # print_int ecall
lw a1, 4(a2)
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 13
ecall
ret

exit:
addi a0, x0, 10
ecall

process:
lw t0, 0(a2) # N
lw t1, 0(a3) # M

addi t4, x0, 0 # pos counter
addi t5, x0, 0 # neg counter
addi t2, x0, 0  # row pointer

init:
addi t3, x0, 0  # column pointer

cycle:
lw t6, 0(a4)    # load value from array
addi a4, a4, 4  # increment array pointer
bgtz t6, even
beqz t6, array_end
addi t5, t5, 1  # increment neg counter
j array_end

even:
addi t4, t4, 1  # increment pos counter

array_end:
addi t3, t3, 1
blt t3, t0, cycle

addi t2, t2, 1
blt t2, t1, init

sw t4, 0(a5)    # save result
sw t5, 4(a5)    # save result
ret
