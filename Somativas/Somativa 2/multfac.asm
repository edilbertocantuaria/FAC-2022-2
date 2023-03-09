.data
mensagemMTHI: .asciiz "\n mthi: "
mensagemMTLO: .asciiz "\n mtlo: "

.text
main:
li $a0, 3
li $a1, -5
jal multfac

li  $v0, 4 
la $a0, mensagemMTLO
syscall 

li $v0, 1
move $a0, $t1
syscall

li  $v0, 4 
la $a0, mensagemMTHI
syscall 

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall

multfac:

slti $a2,$a0, 0 #se a0<0 (ou seja, a0 e negativo), a2 = 1, senao a2=0 (ou seja, a0 e positivo)
slti $a3,$a1, 0 #se a1<0 (ou seja, a1 e negativo), a3 = 1, senao a3=0 (ou seja, a1 e positivo)
  
li $t2, 1 #auxiliar

beq $a2, $t2, azeroNegativo #se a2==t2 (ou seja, a0 negativo)
j verificar_aumNegativo   #senao, pula para verificar_aumNegativo (ou seja, a0 e positivo)

	azeroNegativo: #invertendo o sinal do a0
	nor $a0, $a0, $zero
	addi $a0, $a0, 1
	
verificar_aumNegativo:
beq $a3, $t2, aumNegativo #se a3==t2 (ou seja, a1 negativo)
j multiplicacao #senao, comeca a multiplicacao

	aumNegativo:
	nor $a1, $a1, $zero
	addi $a1, $a1, 1
	
#Inciando multiplicacao:
multiplicacao:
move $t0, $zero  #inicializando P - parte alta
move $t1 , $a1    #t1 = a1 - parte baixa

conferirUltimoBit:
andi $t3, $t1, 1 #mascara para conferir se o bit é o mesmo. 0 se falso e 1 se verdadeiro
beq $t3, $zero, deslocaBit #se t3==0, pula para o próximo passo que é
addu $t0, $t0, $a0 #t0 = t0 + a0

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
beq $a2, $a3, exit #se $a2==$a3, vai para o final, senão
nor $t0, $t0, $zero
nor $t1, $t1, $zero
addi $t1, $t1, 1


exit:
mtlo $t1
mthi $t0

jr $ra
