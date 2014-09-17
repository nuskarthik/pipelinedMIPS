.data
num1: 1

        .text
        .globl main
main:
	lui $s0, 61
	nop
	nop
	nop
	ori $s0, $s0, 2304
	nop
	nop
	nop
	lw $t1, 16
	lw $t2, 20
	lw $t3, num1
	nop
	slt $s1, $s0, $t1
	nop
	nop
	nop
	beq $s1, $t3, sltIsOne
	nop
	nop
	nop
 	srl $s2, $s0, 16
	addi $s4, $t1, 100
	nop
	nop
	or $s3, $t2, $s2
	nop
	nop
	sw $s4, 28
	sw $s3, 24
	j main
	nop
	nop
	nop

sltIsOne:
        sll $s2, $s0, 16
	sllv $s4, $t1, $t3
        nop
        nop
        nor $s3, $s2, $t2
        nop
	sw $s4, 28
	nop
	sw $s3, 24
        j main
        nop
        nop
        nop
