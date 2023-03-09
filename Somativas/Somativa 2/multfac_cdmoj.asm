multfac:

slti $t8,$a0, 0 
slti $t9,$a1, 0 
  
li $t2, 1

beq $t8, $t2, azeroNegativo 
j verificar_aumNegativo   

	azeroNegativo: 
	nor $a0, $a0, $zero
	addi $a0, $a0, 1
	
verificar_aumNegativo:
beq $t9, $t2, aumNegativo 
j multiplicacao 

	aumNegativo:
	nor $a1, $a1, $zero
	addi $a1, $a1, 1
	

multiplicacao:
move $t0, $zero  
move $t1 , $a1    

conferirUltimoBit:
andi $t3, $t1, 1 
beq $t3, $zero, deslocaBit 
addu $t0, $t0, $a0 

deslocaBit:
andi $t6, $t0, 1
srl $t0, $t0, 1
srl $t1, $t1, 1

sll $t6, $t6, 31
add $t1, $t1, $t6


slti $t5, $t2, 32
beq $t5, $zero, fimCodigo
addi $t2, $t2, 1
j conferirUltimoBit

fimCodigo:
beq $t8, $t9, exit
nor $t0, $t0, $zero
nor $t1, $t1, $zero
addi $t1, $t1, 1


exit:
mtlo $t1
mthi $t0

jr $ra
