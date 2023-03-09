#Fazer um la�o que l� um n�mero n>0 e imprime de n at� "0" em ordem descrescente. Caso seja negativo, deve aparecer uma mensagem de erro.

.data
 msg: .asciiz "Digite um n�mero: "
 erro_msg: .asciiz "O n�mero n�o pode ser negativo ou nulo!"
 espaco: .byte ' '
 
 .text
 main: 
 	#Parte responsavel por imprimir msg
  li $v0, 4
  la $a0, msg
  syscall
  
  	#Salvando o numero digitado
  li $v0, 5
  move $t0, $v0 #t0 = v0
  syscall
    
  move $t1, $zero # t1 =0

 ble $t0, $t1, msg_erro  #if t0<=t1
 
 msg_erro:
 	li $v0, 4
 	la $a0, erro_msg
 	syscall
 	
 	j saiLaco

 laco:
 	beq $t0, $t1, saiLaco
	
		#imprime t0
	li $v0, 1
	move $a0, $t0 #a0=t0
	syscall
	
		#imprime espaco
	li $v0, 4
	la $a0, espaco
	syscall
	
	
	subi $t0, $t0, 1 # t0 = t0 -1
	j laco
  
 saiLaco:     
 #encerra a execucao
 li $v0, 10
 syscall