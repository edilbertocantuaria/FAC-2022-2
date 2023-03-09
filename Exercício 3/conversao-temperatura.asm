.data 
	primeira_escala: .space 32
	segunda_escala: .space 32
	zero: .float 0.0
	
	ck_fahrenheit: .float 1.8
	celsius_fahrenheit_32: .float 32.0
	celsius_kelvin: .float 273.15
	
	fahrenheit_ck: .float 0.55555      
	fahrenheit_celsius_32: .float 17.7777  
	fahrenheit_kelvin: .float 255.37222
	
	kelvin_fahrenheit: .float 459.67
.text
main:
li $t0, 'C'
li $t1, 'F'
li $t2, 'K'
	
	li $v0, 8
	la $a0, primeira_escala
	la $a1, 32
	syscall
	move $t3, $a0
	lb $t5, 0($t3)

	
	li $v0, 8
	la $a0, segunda_escala
	la $a1, 32
	syscall
	move $t4, $a0
	lb $t6, 0($t4)
	
	li $v0, 6
	syscall
	lwc1 $f1, zero
	add.s $f12, $f1, $f0

jal conversao

	li $v0, 2
	syscall
	
li $v0, 10
syscall	

conversao:
beq $t5, $t0, conversaoCelsius
beq $t5, $t1, conversaoFahrenheit
beq $t5, $t2, conversaoKelvin 
	
conversaoCelsius:
beq $t6, $t1, conversaoCelsius_Fahrenheit
beq $t6, $t2, conversaoCelsius_Kelvin 

	conversaoCelsius_Fahrenheit:
	lwc1 $f2, ck_fahrenheit
	lwc1 $f3, celsius_fahrenheit_32
	mul.s $f12, $f12, $f2
	add.s $f12, $f12, $f3
	jr $ra

	conversaoCelsius_Kelvin:
	lwc1 $f2, celsius_kelvin
	add.s $f12, $f12, $f2
	jr $ra

conversaoFahrenheit:
beq $t6, $t0, conversaoFahrenheit_Celsius
beq $t6, $t2, conversaoFahrenheit_Kelvin 

	conversaoFahrenheit_Celsius:
	lwc1 $f2, fahrenheit_ck
	lwc1 $f3, fahrenheit_celsius_32
	mul.s $f12, $f12, $f2
	sub.s $f12, $f12, $f3
	jr $ra

	conversaoFahrenheit_Kelvin:
	lwc1 $f2, fahrenheit_ck
	lwc1 $f3, fahrenheit_kelvin
	mul.s $f12, $f12, $f2
	add.s $f12, $f12, $f3
	jr $ra

conversaoKelvin:
beq $t6, $t0, conversaoKelvin_Celsius
beq $t6, $t1, conversaoKelvin_Fahrenheit

	conversaoKelvin_Celsius:
	lwc1 $f2, celsius_kelvin
	sub.s $f12, $f12, $f2
	jr $ra

	conversaoKelvin_Fahrenheit:
	lwc1 $f2, ck_fahrenheit
	lwc1 $f3, kelvin_fahrenheit
	mul.s $f12, $f12, $f2
	sub.s $f12, $f12, $f3
	jr $ra

				

	
	
	
	
	

