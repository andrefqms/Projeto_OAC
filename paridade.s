	
	.file	"paridade.c" ;nome do arquivo com extensao assembly (.s)
	.option nopic ;
	.text ;
	.align  2 ;
	.globl  getParity ;
	.type   getParity,  @function ;

getParity:
	mv 		a5,a0 ; move o valor do a0 para o registrador a5, nao tem overflow
	beqz	a0,.L4 ;
	li		a0,0 ;

.L3:
	xori	a0,a0,1 ; XOR lógico bit-a-bit com uma constante
	addi	a4,a5,-1 ; soma -1 com o valor de a5 e guarda no registrador a4
	and		a5,a5,a4 ; AND Lógico bit a bit com 3 parâmetros 
	bnez	a5,.L3 ;
	ret ;

.L4:
	li		a0,0 ;
	ret ;
	.size	getParity, .-getParity ;
	.align	2 ;
	.globl	main ;
	.type	main, @function ;

main:
	addi	sp,sp,-32 ; soma -32 ao registrador sp e coloca em sp
	sw		ra,28(sp) ; armazena o conteúdo na memória
	sw		s0,24(sp) ; armazena o este conteúdo na memória
	addi	a1,sp,12 ; soma 12 ao registrador sp, nao tem overflow.
	lui		a0,%hi(.LC2) ; carrega constante nos bits superiores da palavra
	addi	a0,a0,%lo(.LC2) ;
	call	scanf ;
	lw		s0,12(sp) ; carrega o conteúdo da memória
	mv		a0,s0 ;
	call	getParity ;
	bnez	a0,.L8 ;
	lui		a2,%hi(.LC1) ;
	addi	a2,a2,%lo(.LC1) ;

.L7:
	mv		a1,s0 ; 
	lui		a0,%hi(.LC3) ; 
	addi	a0,a0,%lo(.LC3) ;
	call	printf ; 
	call	getchar ; 
	li		a0,0 ;
	lw		ra,28(sp) ;
	lw		s0,24(sp) ;
	addi	sp,sp,32 ;
	jr		ra ;

.L8:
	lui		a2,%hi(.LC0) ;
	addi	a2,a2,%lo(.LC0) ;
	j 		.L7 ;
	.size	main, .-main ; 
	.section		.rodata.str1.4,"aMS",@progbits,1 ;
	.align	2

.LC0:
	.string "Impar" ; 
	.zero	2 ;

.LC1:
	.string "Par" ;

.LC2:
	.string "%d" ;
	.zero	1 ;

.LC3:
	.string	"Paridade do no %d = %s" ;
	.ident "GCC: (GNU) 8.1.0" ;
