.data
num1: 9
        .text
        .globl main
main:
	lw $t1, 16
	lw $t2, 20
	nop
	nop
	nop
	div $t1, $t2
	nop
	nop
	nop
	mfhi $s1
	nop
	nop
	nop
	sw $s1, 24
	mflo $s2
	nop
	nop
	nop
	sw $s2, 28
	j main
	nop
	nop
	nop
	
	
