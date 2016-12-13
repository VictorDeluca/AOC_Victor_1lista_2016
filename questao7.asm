# Title: Switch Case em MIPS																		Filename: questao7.asm
# Author: Victor Deluca Almirante Gomes																Date: 12/12/2016
# Description: Implementacao em Assembly do MIPS do codigo descrito na questao numero 7 da lista de exercicios. Note que os valores possiveis pra k
# foram modificados porque na questao original todos os Cases requeriam um k igual a 0, o que acarretaria em um erro de compilacao.
# Input: $t0, $t1, $t2, $t3 = Valores inteiros entre -100 e 100, $t4 = Valor inteiro de 0 a 3
# Output: $a0 = Resultado da operacao do Switch Case de acordo com o enunciado da questao 7.

################# Data segment #####################
.data

################# Code segment #####################
.text
.globl main
main:								#Funcao principal do programa
	li $v0,5						#As proximas linhas servirao pra receber o input de 5 inteiros
	syscall
	move $t0,$v0
	li $v0,5										
	syscall
	move $t1,$v0
	li $v0,5										
	syscall
	move $t2,$v0
	li $v0,5										
	syscall
	move $t3,$v0
	li $v0,5										
	syscall
	move $t4,$v0
	beq $t4,0,c1					#As proximas linhas verificam qual dos casos deve ser executado de acordo com o valor de k
	beq $t4,1,c2
	beq $t4,2,c3
	beq $t4,3,c4					#Note que o programa nao trata de casos com valores diferentes do especificado, da mesma forma que no enunciado da questao
c1: 								#Caso k = 0
	add $a0,$t2,$t3					#O valor de f e armazenado em $a0
	j final							#Apos qualquer um dos casos, o programa ira pular pra a sequencia final de instrucoes
c2:									#Caso k = 1
	add $a0,$t0,$t1
	j final
c3:									#Caso k = 2
	sub $a0,$t0,$t1
	j final
c4:									#Caso k = 3
	sub $a0,$t2,$t3
	j final
final:								#Apos calculado o valor de f, o programa imprime o mesmo na tela
	li $v0,1
	syscall							
	li $v0,10						#Encerrar o programa
	syscall