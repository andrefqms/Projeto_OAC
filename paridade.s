	
	.file	"paridade.c" 
	.option nopic 
	.text 
	.align  2 
	.globl  getParity 
	.type   getParity,  @function 

getParity:
	mv 		a5,a0                                   ; move o valor do a0 para o registrador a5
	beqz	a0,.L4 									; ramifica para .L4 se o registrador a0 == 0
	li		a0,0 									; carrega o registrador a0 com o valor constante 0

.L3:
	xori	a0,a0,1                                 ; XOR lógico bit-a-bit com uma constante 1
	addi	a4,a5,-1                                ; soma -1 com o valor de a5 e guarda no registrador a4
	and		a5,a5,a4                                ; AND lógico bit a bit com 3 parâmetros 
	bnez	a5,.L3 									; ramifica para o .L3 se o registrador a5 != 0
	ret 											; retorno da subrotina .L3

.L4:
	li		a0,0 									; carrega o registrador a0 com o valor constante 0
	ret 											; retorno da subrotina .L4
	.size	getParity, .-getParity 
	.align	2 
	.globl	main 
	.type	main, @function 

main:
	addi	sp,sp,-32                               ; soma -32 com o valor do registrador sp e armazena em sp
	sw		ra,28(sp)                               ; armazena o conteúdo de sp na memória por meio do registrador ra
	sw		s0,24(sp)                               ; armazena o conteúdo de sp na memória por meio do registrador s0
	addi	a1,sp,12                                ; soma 12 com o valor do registrador sp e armazena em a1
	lui		a0,%hi(.LC2)                            ; desloca para a esquerda os maiores 16 bits de LC2 e armazena no registrador a0. Os 16 bits mais baixos são zeros
	addi	a0,a0,%lo(.LC2)                         ; soma o conteúdo do espaço de memória passado com o registrador a0 e armazena em a0
	call	scanf                                   ; chama o método scanf
	lw		s0,12(sp)                               ; carrega na memória o conteúdo do registrador 12 + sp
	mv		a0,s0                                   ; move o valor do s0 para o registrador a0
	call	getParity                               ; chama o método getParity
	bnez	a0,.L8 									; ramifica para o .L8 se o registrador a2 != 0
	lui		a2,%hi(.LC1) 							; desloca para a esquerda os maiores 16 bits de LC1 e armazena no registrador a2. Os 16 bits mais baixos são zeros
	addi	a2,a2,%lo(.LC1)                         ; soma o conteúdo do espaço de memória passado com o registrador a2 e armazena em a2

.L7:
	mv		a1,s0                                   ; move o valor de s0 para registrador a1
	lui		a0,%hi(.LC3) 							; desloca para a esquerda os maiores 16 bits de LC3 e armazena no registrador a0. Os 16 bits mais baixos são zeros
	addi	a0,a0,%lo(.LC3)                         ; soma o conteúdo do espaço de memória passado com registrador a0 e armazena em a0
	call	printf 									; chama o método printf
	call	getchar									; chama o método getchar
	li		a0,0 									; carrega o registrador a0 com o valor constante 0
	lw		ra,28(sp) 								; carrega na memória o conteúdo do registrador 28 + sp
	lw		s0,24(sp)								; carrega na memória o conteúdo do registrador 24 + sp
	addi	sp,sp,32 								; soma a constante 32 com o valor do registrador sp e armazena em sp
	jr		ra 										; dá um salto direto para o return address

.L8:
	lui		a2,%hi(.LC0) 							; desloca para a esquerda os maiores 16 bits de LC0 e armazena no registrador a2. Os 16 bits mais baixos são zeros
	addi	a2,a2,%lo(.LC0) 						; soma o conteúdo do espaço de memória passado com o registrador a2 e armazena em a2
	j 		.L7 									; salta para o endereço calculado
	.size	main, .-main 
	.section		.rodata.str1.4,"aMS",@progbits,1 
	.align	2

.LC0:
	.string "Impar" 
	.zero	2 ;

.LC1:
	.string "Par" 

.LC2:
	.string "%d" 
	.zero	1 

.LC3:
	.string	"Paridade do no %d = %s" 
	.ident "GCC: (GNU) 8.1.0" 
