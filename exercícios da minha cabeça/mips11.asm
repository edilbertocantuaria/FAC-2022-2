#Fazer um laço em que lê um número "n" e imprime de "0" até "n"

.data 
 	msg: .asciiz "Digite um número: "
 	espaco: .byte ' ' #vai imprimir um espaço em branco entre os numeros
.text
main: 
#imprimindo instrucao na tela
	li $v0, 4 #imprime uma string  - tabela syscall 
	la $a0, msg
	syscall
	
 #lendo o número n
 	li $v0, 5 #salva um inteiro  - tabela syscall 
 	syscall
 	
 	move $t0, $v0 # armazena o valor digitado e salva no registrador temporario $t0 ($t0 =$v0)
	move $t1, $zero #armazena o valor '0' no registrador temporario $t1
	
	laco:
		bgt $t1, $t0, saiLaco  #if ($t1 <= $t0) (vai sair do laco)
		
		#imprime $t1 sendo iterado
		li $v0, 1 #imprime um inteiro  - tabela syscall 
		move $a0, $t1 #$a0 = $t1
		syscall
		
		#imprime o espaco em branco
		li $v0, 4
		la $a0, espaco
		syscall
		
		addi $t1, $t1, 1 # $t1 = $t1 +1
		j laco
	
	saiLaco:
		li $v0, 10 #termina a execucao
		syscall
