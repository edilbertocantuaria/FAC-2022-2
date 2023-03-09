.data
	zero: .double 0.0
	um: .double 1.0
	dois: .double 2.0
	dez: .double 10.0
	
	precisao: .asciiz "\nprecisao: "
	precisao2: .asciiz "\nprecisao final: "
	precisaoReg: .asciiz "\nvalor no registrador: "
	
	
	msg_invalido: .asciiz "Nao foi possivel calcular sqrt("
    msg_invalido2: .asciiz ")."

	msg_entradasInvalidas: .asciiz "Entradas invalidas."
		
	a: .word 0
	c: .word 0      
	
	msg_a: .asciiz "\n\nvalor do a: "
	msg_b: .asciiz "\nvalor do b: "
    msg_finalizar: .asciiz "\n fim do codigo!"
    msg_Numiteracoes: .asciiz "\nnum de iteracoes: "
		
	msg_raizQuadrada: .asciiz "A raiz quadrada de "
	msg_eh: .asciiz " eh "
	msg_calculada: .asciiz ", calculada em "
	msg_iteracoes: .asciiz " iteracoes."
	
	linha: .asciiz "\n"
.text
main:
    # contador
    li $t0, 1
    li $t1, 0
    li $t4, 1
    
    li $s0, 100
    li $s1, 1
    li $s2, 16
    
    ldc1 $f0, zero
    ldc1 $f14, dois
    ldc1 $f26, um
    ldc1 $f20, zero
    

    # Entra com o numero desejado
    li $v0, 5
    syscall
    move $s5, $v0
      
    # Entra com a precisao
    li $v0, 5
    syscall
    move $s6, $v0
    jal raizQuadrada

         li $v0, 4
     	 la $a0, linha
     	 syscall
    li $v0, 10
    syscall

raizQuadrada:    
    ble $s5, $t4,invalid_input    # if ($s5=<1) vai para invalid_input
    
    ble $s6, $s2, segundaCondicao   # Verifica se $s6 menor igual a 16
    j invalid_input   # Se $s6 nao e menor que 1, pula para o final
    	
    segundaCondicao:    
    ble $s1, $s6, encontrarPrecisao  # Verifica se $s6 e maior igual a 1
    j invalid_input
 
encontrarPrecisao:
    	li $t6, 1
    	ldc1 $f8, um
    		ldc1 $f6, um
		move $t5, $s6
		ldc1 $f10, dez
		mul.d $f18, $f10, $f8
	#   li $v0, 4
    #  	  la $a0, precisaoReg
    #  	  syscall
    #  	  mov.d $f12, $f8
	#   li $v0, 3
	#   syscall
		
	loopPrecisao:
		addi $t6, $t6, 1
		mul.d $f18, $f18, $f10
	
	#   li $v0, 4
    #  	  la $a0, precisao
    #  	  syscall
    #  	  mov.d $f12, $f18
	#   li $v0, 3
	#   syscall
		bne $t6,$s6 loopPrecisao
			
	div.d $f18,$f8, $f18 
	
	# li $v0, 4
    # 	la $a0, precisao2
    #  	syscall
    #  	mov.d $f12, $f18
	# li $v0, 3
	# syscall
 
encontrarExtremidades:  	
    # incrementa a e armazena seu valor em $t1
    addi $t1, $t1, 1
    sw $t1, a
    
    # calcula o quadrado de a e o armazena em $t2
    mul $t2, $t1, $t1
    
    # verifica se a_quadrado < x
    blt $t2, $s5, encontrarExtremidades
    
    # armazena a em $t3 e inicializa b com a+1
    move $t3, $t1
    addi $t1, $t1, 1
    
encontrarExtremidades2:
    # calcula o quadrado de b e o armazena em $t4
    mul $t4, $t1, $t1
    
    # verifica se b_quadrado > x
    bgt $t4, $s5, extremidades_a_b
    
    # incrementa b e repete o encontrarExtremidades2
    addi $t1, $t1, 1
    j encontrarExtremidades2
    
    extremidades_a_b:
    # armazena b em $t5
    sw $t1, c
    
    # decrementa a e b em uma unidade
    addi $t3, $t3, -1 #a0
    addi $t1, $t1, -1 #b0
    
    #  li $v0, 4
    #  la $a0, msg_a
    #  syscall
    #  li $v0, 1
    #  move $a0, $t3
    #  syscall
    
    #  li $v0, 4
    #  la $a0, msg_b
    #  syscall
    #  li $v0, 1
    #  move $a0, $t1
    #  syscall

	#  li $v0, 4
    #  la $a0, precisao2
    #  syscall
    #  mov.d $f12, $f18
	#  li $v0, 3
	#  syscall

	#  li $v0, 4
    #  la $a0, linha
    #  syscall
    
        
    #convertendo os numeros em float
    mtc1 $s5, $f30
    cvt.d.w $f30, $f30 

    mtc1 $t3, $f24
    cvt.d.w $f24, $f24  #a1
    
    mtc1 $t1, $f2
    cvt.d.w $f2, $f2 #b1
    
    div.d $f2, $f30, $f24   

	#  li $v0, 4
    #  la $a0, msg_a
    #  syscall
    #  li $v0, 3
    #  mov.d $f12, $f24
    #  syscall
    
    #  li $v0, 4
    #  la $a0, msg_b
    #  syscall
    #  li $v0, 3
    #  mov.d $f12, $f2
    #  syscall

	#  li $v0, 4
    #  la $a0, precisao2
    #  syscall
    #  mov.d $f12, $f18
	#  li $v0, 3
	#  syscall

processo:
    addi $t0, $t0, 1
    
    add.d $f4, $f24, $f2
    div.d $f24, $f4, $f14 #a2
    
    div.d $f2, $f30, $f24 #b2

	#  li $v0, 4
    #  la $a0, msg_a
    #  syscall
    #  li $v0, 3
    #  mov.d $f12, $f24
    #  syscall
    
    #  li $v0, 4
    #  la $a0, msg_b
    #  syscall
    #  li $v0, 3
    #  mov.d $f12, $f2
    #  syscall

	#  li $v0, 4
    #  la $a0, precisao2
    #  syscall
    #  mov.d $f12, $f18
	#  li $v0, 3
	#  syscall
    
    #colocar a condicao da precisao aqui
    sub.d $f8, $f2, $f24
    abs.d $f8, $f8 #precisao

		    #  li $v0, 4
     		#  la $a0, precisao
    		#  syscall
    		#  li $v0, 3
    		#  mov.d $f12, $f8
     		# syscall

    c.lt.d  $f8, $f18 
    
    # li $v0, 4
    # la $a0, msg_Numiteracoes
    # syscall
    # li $v0, 1
    # move $a0, $t0
    # syscall
    
    bc1t finalizacao   
    
    # compara $s0 com $t0
   	 bne $s0, $t0, processo
    	 j invalido
    	
finalizacao:
	li $v0, 4
    	la $a0, msg_raizQuadrada
    	syscall
    	
    	li $v0, 1
    	move $a0, $s5
    	syscall
    	
    	li $v0, 4
    	la $a0, msg_eh
    	syscall

	mov.d $f12, $f24
	li $v0, 3
	syscall
	
	li $v0, 4
    	la $a0, msg_calculada
    	syscall 
    	
    	li $v0, 1
    	move $a0, $t0
    	syscall 
    	
    	li $v0, 4
    	la $a0, msg_iteracoes
    	syscall
    jr $ra  
	  
invalido: 
    		li $v0, 4
    		la $a0, msg_invalido
    		syscall

            li $v0, 1
    	    move $a0, $s5
    	    syscall

    		li $v0, 4
    		la $a0, msg_invalido2
    		syscall   	
    jr $ra

invalid_input:
	        li $v0, 4
	        la $a0, msg_entradasInvalidas
  	        syscall
jr $ra 
 	
