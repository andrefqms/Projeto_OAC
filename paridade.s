	.file	"paridade.c"
	.option nopic
	.text
	.align  2
	.globl  getParity
	.type   getParity,  @function
getParity:
	mv 		a5,a0
	beqz	a0,.L4
	li		a0,0
.L3:
	xori	a0,a0,1
	addi	a4,a5,-1
	and		a5,a5,a4
	bnez	a5,.L3
	ret
.L4:
	li		a0,0
	ret
	.size	getParity, .-getParity
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw		ra,28(sp)
	sw		s0,24(sp)
	addi	a1,sp,12
	lui		a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	scanf
	lw		s0,12(sp)
	mv		a0,s0
	call	getParity
	bnez	a0,.L8
	lui		a2,%hi(.LC1)
	addi	a2,a2,%lo(.LC1)
.L7:
	mv		a1,s0
	lui		a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	printf
	call	getchar
	li		a0,0
	lw		ra,28(sp)
	lw		s0,24(sp)
	addi	sp,sp,32
	jr		ra
.L8:
	lui		a2,%hi(.LC0)
	addi	a2,a2,%lo(.LC0)
	j 		.L7
	.size	main, .-main
	.section		.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string "Impar"
	.zero	2
.LC1:
	.string "Par"
.LC2:
	.string "%d"
	.zero	1
.LC3:
	.string	"Paridade do no %d = %s"
	.ident "GCC: (GNU) 8.1.0"
