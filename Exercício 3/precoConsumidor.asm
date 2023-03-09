.data
	zero: .float 0.0
	um: .float 1.0
	cem: .float 100.0

.text
main:
lwc1 $f1, zero #auxiliar
lwc1 $f2, zero #primeira porcentagem
lwc1 $f3, zero #segunda porcentagem
lwc1 $f7, zero #soma das porcentagens

lwc1 $f6, zero #preco

lwc1 $f4, cem 
lwc1 $f5, um

	li $v0, 6
	syscall
	add.s $f6, $f1, $f0
		
	li $v0, 6
    syscall
    add.s $f2, $f1, $f0
	div.s $f2, $f2, $f4
    	
	li $v0, 6
    syscall
    add.s $f3, $f1, $f0 
	div.s $f3, $f3, $f4	
    	 	 	
    	add.s $f7, $f2, $f3	  
    	add.s $f7, $f7, $f5
    	
    	lwc1, $f12, zero	    	    	
    	mul.s $f12, $f6, $f7 
   
    li $v0, 2
	syscall

li $v0, 10
syscall
