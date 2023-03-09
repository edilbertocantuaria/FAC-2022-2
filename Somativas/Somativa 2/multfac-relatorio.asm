multfac:

li $t2, 0 #contador

slti $a2,$a0, 0 #se a0<0 (ou seja, a0 e negativo), a2 = 1, senao a2=0 (ou seja, a0 e positivo)
slti $a3,$a1, 0 #se a1<0 (ou seja, a1 e negativo), a3 = 1, senao a3=0 (ou seja, a1 e positivo)
  
li $t2, 1 #auxiliar

beq $a2, $t2, a0Negativo #se a2==t2 (ou seja, a0 negativo)
j verificar_a1Negativo   #senao, pula para verificar_a1Negativo (ou seja, a0 e positivo)

	a0Negativo: #invertendo o sinal do a0
	nor $a0, $a0, $zero
	addi $a0, $a0, 1
	
verificar_a1Negativo:
beq $a3, $t2, a1Negativo #se a3==t2 (ou seja, a1 negativo)
j multiplicacao #senao, comeca a multiplicacao

	a1Negativo:
	nor $a1, $a1, $zero
	addi $a1, $a1, 1
	
#Inciando multiplicacao:
multiplicacao:
move $t0, $zero  #inicializando P - parte alta
move $t1 , $a1    #t1 = a1 - parte baixa

conferirUltimoBit:
andi $t3, $t1, 1 #mascara para conferir se o bit � o mesmo. 0 se falso e 1 se verdadeiro
beq $t3, $zero, deslocaBit #se t3==0, pula para o pr�ximo passo que �
add $t0, $t0, $a0 #t0 = t0 + a0

deslocaBit:
andi $t6, $t0, 1
srl $t0, $t0, 1
srl $t1, $t1, 1

sll $t6, $t6, 31
add $t1, $t1, $t6

#verificandoNumIteracoes
slti $t5, $t2, 32
beq $t5, $zero, fimCodigo
addi $t2, $t2, 1
j conferirUltimoBit

fimCodigo:
beq $a2, $a3, exit #se $a2==$a3, vai para o final, sen�o
nor $t0, $t0, $zero
nor $t1, $t1, $zero
addi $t1, $t1, 1

exit:
mtlo $t1
mthi $t0
jr $ra
