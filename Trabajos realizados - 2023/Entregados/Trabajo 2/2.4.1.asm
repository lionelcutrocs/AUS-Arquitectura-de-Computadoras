#		Problemas propuestos para entregar + 2.4

.data	0x10000000

vector:	.word 10, 20
		.space 4

.text

main: 

#	Carga de direccion de etiqueta
	la $t0, vector

#	Carga de valores en registros 	
	lw $t1, vector
	lw $t2, vector+4				# vectir + 4, porque es donde se encuentra el 20

#	Operando con add ( suma )
	add $s0, $t1, $t2				# guardo en s0 el resultado de la suma
	
#	Almacenado de valores
	sw $s0, vector+8				# vector + 8, porque cuento desde la posicion de memoria de 20 ( +4 )
	
#	Termino el programa
	li $v0, 10
	syscall