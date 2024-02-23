#		Problemas propuestos para entregar + 2.4

.data	0x10000000

num:		.word 0x1237
		.space 4
.text

main:

#	Carga de valores en registros
	lw $s0, num
	
#	Operando con SLL ( shif left logic )
	sll $s1, $s0, 5						# me desplazo 5 lugares a la izquierda, para dar con 2^5 y por lo tanto multiplicarlo  por 32
	
#	Termino el programa
	li $v0, 10
	syscall
	