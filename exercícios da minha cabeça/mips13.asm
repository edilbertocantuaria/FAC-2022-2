# Ler dois inteiros e, caso ambos sejam pares, somar, caso ambos sejam impares, subtrair. Caso um seja par e outro seja ímpar, multiplicá-los.

.data
 msg_num1: .asciiz "Digite o num1: "
 msg_num2: .asciiz "Digite o num2: "

 msg_soma: .asciiz "Ambos pares. Adição: "
 msg_sub: .asciiz "Ambos impares. Subtração: "
 msg_mult: .asciiz "Multiplicação: "

msg_linha: .asciiz "\n"

.text
main:
	li $t2, 2 #Atribuicao de valores - t2 =2

#Pedindo a entrada e lendo o num1
	li $v0, 4
	la $a0,msg_num1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0 # t0 = v0
	
#Pedindo a entrada e lendo o num2
	li $v0, 4
	la $a0,msg_num2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0 # t1 = v0
	
#Analisando se num1 e par ou impar
	div $t0, $t2 #t1/t2
	mfhi $s1 #move o resto da divisao para s1

#Analisando se num2 e par ou impar
	div $t1, $t2 #t1/t2
	mfhi $s2 #move o resto da divisao para s1

	li $t3, 0	#Atribuicao de valores - t3 =0
	li $t4, 1	#Atribuicao de valores - t4 =1	

	and $s3, $s1, $t3 # verifica se o resto da div s1 por 2 é zero
	and $s4, $s2, $t3 # verifica se o resto da div s2 por 2 é zero
	beq $s3, $s4, ambosPares
	
	and $s5, $s1, $t4 # verifica se o resto da div s1 por 2 é 1
	and $s6, $s2, $t4 # verifica se o resto da div s2 por 2 1
	beq $s3, $s4, ambosImpares
	
	j saiLaco
			
ambosPares:
 add $t5 $t0, $t1
 
 
 li $v0, 4
 la $a0, msg_soma
 syscall
 
 li $v0, 1
 move $a0, $t5 #a0 =t5
 syscall
 
 j saiLaco
 
 ambosImpares:
 sub $t5 $t0, $t1
 
 
 li $v0, 4
 la $a0, msg_sub
 syscall
 
 li $v0, 1
 move $a0, $t5 #a0 =t5
 syscall
 
 j saiLaco
 
saiLaco:
	li $v0, 10
	syscall
