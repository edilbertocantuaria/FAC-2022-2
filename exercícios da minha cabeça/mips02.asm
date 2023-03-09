# Ler dois inteiros, retornando sua soma, substração, multiplicação e divisão (num1/num2)

.data
 msg_num1: .asciiz "Digite o num1: "
 msg_num2: .asciiz "Digite o num2: "

 msg_soma: .asciiz "Adição: "
 msg_sub: .asciiz "Subtração: "
 msg_mult: .asciiz "Multiplicação: "
 msg_div: .asciiz "Divisão: "

msg_linha: .asciiz "\n"

.text
main:
#Pedindo a entrada e lendo o num1
	li $v0, 4
	la $a0,msg_num1
	syscall
	
	li $v0, 5	
	syscall
	
	move $t1, $v0 #salvando o valor digitado em t1
	
#Pedindo a entrada e lendo o num2
	li $v0, 4
	la $a0,msg_num2
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0 #salvando o valor digitado em t2
	
#realizando operações
	add $t3, $t1, $t2		
	sub $t4, $t1, $t2 #t4 = t1 + t2	
	
	mult $t1, $t2 #t5 = t1 + t2
	mflo $t5
	
	div $t1, $t2 #lo = t1/t2
	mflo $t6 #t6=lo
	
#imprimindo os resultados
	li $v0, 4
	la $a0,msg_soma
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 4
	la $a0,msg_linha
	syscall
	
	li $v0, 4
	la $a0,msg_sub
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0,msg_linha
	syscall
	
	li $v0, 4
	la $a0,msg_mult
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0,msg_linha
	syscall
	
	li $v0, 4
	la $a0,msg_div
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall

  #encerra a execucao
 li $v0, 10
 syscall