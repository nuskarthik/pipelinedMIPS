.data
num1: 9
num2: 4
        .text
        .globl main
main:
	lw $t1, 16
	lw $t2, 20
	nop
	nop
	add $s0, $t1, $t2
	bgezal $t2, branchlabel
	nop
	nop
	nop
	and $s1, $s0, $t2
	xor $s2, $t1, $t2
	nop
	sw $s1, 24
	sw $s2, 28
	j main
	nop
	nop
	nop
	
branchlabel:	
	sub $s0, $t2, $t1
	nop
	nop
	sw $s0, 24
	jr $ra
	nop
	nop
	nop
	
	
