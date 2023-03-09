.data #area para dados da memoria principal

.text #area para instrucoes do programa

.main:
li $v0, 5 #leitura de um inteiro - leitura hidrometro
syscall 
move $t0, $v0 #movendo o valor de v0 para t0. t0: consumo!

li $t1, 10
li $t2, 30
li $t3, 100

se: 
	ble $t0, $t1, tarifa1 #se t0<=t1 | consumo <= 10
	bgt $t0, $t1, cond_tarifa2 #se t0>t2  | consumo>10
	
	tarifa1:
	li $s1, 7
	j exit
	
	cond_tarifa2:
	ble $t0, $t2, tarifa2  #se t0<=t2 | consumo<=30
	bgt $t0, $t2, tarifa3 #se t0>t2  | consumo>30
	
	tarifa2:
	li $s1, 7 #taxa constante
	li $s2, 1 #atribui a taxa por m^3 consumido
	sub $t4, $t0, $t1 #verifica qual foi a quantidade de agua consumida no intervalo entre 11 a 30 
	mult $t4, $s2 #multiplica a qtd da linha anterior pela taxa
	mflo $s3 #pega o resultado da multiplicacao
	add $s1, $s1, $s3 # conta = taxa basica + multiplicacao 
	j exit
	
	cond_tarifa3:
	ble $t0, $t3, tarifa3  #se t0<=t3 | consumo<=100
	bgt $t0, $t3, tarifa4 #se t0>t3  | consumo>100
	
	tarifa3:
	li $s1, 27 #taxa constante de 7 + taxa cheia p consumo de 11 a 30
	li $s2, 2 #atribui a taxa por m^3 consumido
	sub $t4, $t0, $t2 #verifica qual foi a quantidade de agua consumida no intervalo entre 31 a 100 
	mult $t4, $s2 #multiplica a qtd da linha anterior pela taxa
	mflo $s3 #pega o resultado da multiplicacao
	add $s1, $s1, $s3 # conta = taxa basica + multiplicacao 
	j exit
	
	tarifa4:
	li $s1, 167 #taxa constante de 7 + taxa cheia p consumo de 11 a 30 + taxa cheia p consumo de 31 a 100
	li $s2, 5 #atribui a taxa por m^3 consumido
	sub $t4, $t0, $t2 #verifica qual foi a quantidade de agua consumida no intervalo entre 31 a 100 
	mult $t4, $s2 #multiplica a qtd da linha anterior pela taxa
	mflo $s3 #pega o resultado da multiplicacao
	add $s1, $s1, $s3 # conta = taxa basica + multiplicacao 
	j exit
	
exit:
li $v0, 1 #imprimindo o maior na tela
move $a0, $s1 #para inteiro usa-se move. Para strings usa-se la
syscall

li $v0, 10 #para sair do programa
syscall
	