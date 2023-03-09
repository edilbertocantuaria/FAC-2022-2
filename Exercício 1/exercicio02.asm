.data

.text
main:
	li $v0, 5 #le um inteiros
	syscall
	
	move $t0, $v0 #valor de v0 é passado para t0
	
	li $v0, 5 #le um inteiros
	syscall
	
	move $t1, $v0 #valor de v0 é passado para t0

	add $a0, $t0, $t1
    

    move $v0, $a0 #valor de a0 é passado para v0
    li $v0, 1  # imprimir um inteiro
    syscall

    li $v0, 10 # para finalizar 
    syscall