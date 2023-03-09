.data #area para dados da memoria principal
espaco: .asciiz " " 
linha: .asciiz "\n" 

.text #area para instrucoes do programa
.main:
li $v0, 5 #leitura de um inteiro - numero de linha da piramide
syscall 
move $t0, $v0 #movendo o valor de v0 para t0.

li $s1,0 #contador i=0
li $s2,0 #contador de espaço j=0
li $t1, 1 #primeira linha. t1=1


while:
 beq $t0,$s1, exit #se t0==s1
 
 piramide:
	
  	whilePiramide: 
 	li $v0, 1 #imprimindo o numero da 1ª linha
	move $a0, $t1 #para inteiro usa-se move. Para strings usa-se la
	syscall
	

	
	

	#whileEspaco:
	#beq $s2
	
	whileLinha:
	li $v0, 4 #quebra de linha
	la $a0, linha #para inteiro usa-se move. Para strings usa-se la
	syscall
	
	addi $s1, $s1, 1 # s1= s1 +1 | i++
	addi $t1, $t1, 1 # t1= t1 +1 | i++
	j while

exit:
li $v0, 10 #para sair do programa
syscall
	