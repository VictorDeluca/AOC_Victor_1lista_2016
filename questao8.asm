# Title: Insertion Sort em MIPS																		Filename: questao7.asm
# Author: Victor Deluca Almirante Gomes																Date: 12/12/2016
# Description: Implementacao em Assembly do MIPS do algoritmo de ordenacao Insertion Sort
# Input: Dez numeros inteiros 
# Output: Os dez numeros inteiros inseridos no Input, mas ordenados em ordem crescente

################# Data segment #####################
.data
.globl vec
v:	.word 0:11
s:	.asciiz "\n"

################# Code segment #####################
.text
.globl main
main:
	sub $sp,$sp,4								# Inicializacao do vetor. Trecho de codigo pego do arquivo OAC_02set_instructs_p1.pdf
	sw $ra,0($sp)
	add $t0,$0,$0
	lewp:										# Estrutura de repeticao principal, onde a leitura dos valores e sua insercao organizada e feita.
		li $v0,5								# Lendo o valor da vez
		syscall
		move $t1,$v0
		add $t6,$0,$0
		again: 									# Percorre o vetor ate encontrar um numero nao-menor que o inserido ou ate o vetor terminar
			beq $t6,$t0,cont
			mul $t7,$t6,4
			lw $t2,v($t7)
			slt $t3,$t2,$t1
			beq $t3,$0,reorder
			addi $t6,$t6,1
			j again
		reorder:								# Desloca todos os numeros nao-menores que o inserido uma casa pra direita no vetor
			add $t5,$t0,$0
			addi $t6,$t6,-1
			reordera:
				beq $t5,$t6,prep
				mul $t7,$t5,4
				lw $t2,v($t7)
				addi $t5,$t5,1
				mul $t7,$t5,4
				sw $t2,v($t7)
				addi $t5,$t5,-2
			j reordera
		prep:
			addi $t6,$t6,1
		cont:									# Insere o valor no final do vetor ou no espaco vazio que foi deixado apos o deslocamento dos outros numeros
			mul $t7,$t6,4
			sw $t1,v($t7)
			addi $t0,$t0,1
			bne $t0,10,lewp
	add $t0,$0,$0
	print:										# Imprime todos os valores do vetor em ordem crescente
		mul $t1,$t0,4
		lw $a0,v($t1)
		li $v0,1
		syscall
		la $a0,s
		li $v0,4
		syscall
		addi $t0,$t0,1
		bne $t0,10,print
	li $v0,10
	syscall