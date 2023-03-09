.data #area para dados da memoria principal

.text #area para instrucoes do programa

.main:
li $v0, 5 #leitura de um inteiro
syscall 
move $t0, $v0 #movendo o valor de v0 para t0

li  $t1, 1 #t1=1 - iterador: i=1

li $v0, 5 #leitura de um inteiro
syscall 
move $t2, $v0 #movendo o valor de v0 para t2. Esse será o primeiro numero para comparar

while: 
	beq $t1, $t0, exit #se t4==t1 sai do programa
	
	li $v0, 5 #leitura de um inteiro
	syscall 
	move $t3, $v0 #movendo o valor de v0 para t3. Esse será o segundo numero para comparar
	
	blt $t3, $t2, maior
	addi $t1, $t1 1 #t1 = t1 +1 ou i++
	j while #pula para o while label
	
	maior:
	move $t3, $t2 #t3=t2
	addi $t1, $t1, 1 #i++
	j while #pula para o while label
	
exit: 

li $v0, 1 #imprimindo o maior na tela
move $a0, $t3 #para inteiro usa-se move. Para strings usa-se la
syscall

li $v0, 10 #para sair do programa
syscall
	