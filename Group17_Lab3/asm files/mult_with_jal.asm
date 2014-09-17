.data

        .text
        .globl main
main:
	lw $t1, 16
	lw $t2, 20
	nop
	nop
	nop
	mult $t1, $t2
	nop
	nop
	nop
	jal loadlower
	nop
	nop
	nop
	mfhi $s1
	nop
	nop
	nop
	sw $s1, 24
	jr $ra
	nop
	nop
	nop
	
loadlower:	
	mflo $s2
	nop
	nop
	nop
	sw $s2, 28
	jalr $ra
	nop
	nop
	nop
	j main
	nop
	nop
	nop