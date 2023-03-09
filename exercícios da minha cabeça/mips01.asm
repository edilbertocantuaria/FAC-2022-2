#Fazer um laço que lê um número n>0 e imprime de n até "0" em ordem descrescente. Caso seja negativo, deve aparecer uma mensagem de erro.

.data
 msg: .asciiz "Digite um número: "
 msg_digitado: .asciiz "\n O número digitado foi: "
 espaco: .byte ' '
 
 .text
 main: 
 	#Parte responsavel por imprimir msg
  li $v0, 4
  la $a0, msg
  syscall
  
  	#Salvando o numero digitado
  li $v0, 5
  syscall
  
 move $t0, $v0
 
 
 li $v0, 4
 la $a0, msg_digitado
 syscall
 
 li $v0, 1
 move $a0, $t0
 syscall
 
 
 
 #encerra a execucao
 li $v0, 10
 syscall