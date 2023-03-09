.data #area para dados da memoria principal

msg: .asciiz "Ola Mundo\n" #mensagem a ser exibida ao usuario
.text #area para instrucoes do programa

main:
li  $v0, 4 #instrucao para impressao de string
la $a0, msg	 #indicar o endereco que a mensagem esta

syscall #faca instrucao

li $v0, 10
	syscall
