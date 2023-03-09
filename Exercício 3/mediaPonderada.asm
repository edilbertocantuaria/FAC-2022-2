.data
	zero: .float 0.0
.text
main:
    # Entra com a qtd de nota
    li $v0, 5
    syscall
    move $t0, $v0
    
    # contador
    li $t1, 0
    
    lwc1 $f1, zero
    lwc1 $f2, zero #peso
    lwc1 $f3, zero #nota
    
loop:
    # incrementa $t1
    addi $t1, $t1, 1
    
    	#peso 
	li $v0, 6
	syscall
	add.s $f2, $f1, $f0
	
	#nota
	li $v0, 6
	syscall
	add.s $f3, $f1, $f0
    	
    	
    	mul.s $f4, $f2, $f3 # peso * nota = $f12 $t2
    	add.s $f5, $f5, $f4 #(peso_i*nota_i)+(peso_j*nota_j)    	
    	add.s $f6, $f6, $f2 # (peso_i)+(peso_j)
    	div.s $f12, $f5, $f6 #média ponderada
    
    # compara $t1 com $t0
    bne $t1, $t0, loop
    
exit_loop:
	li $v0, 2
	syscall
    
    # encerra o programa
    li $v0, 10
    syscall
