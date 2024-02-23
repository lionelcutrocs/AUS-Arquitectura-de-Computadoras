#		Problemas propuestos en la seccion + 1.4

.data	0x10000000

vector:	.word 10, 20, 25, 500, 3

.text

main:

#	Carga de datos 	 
	la $t0, vector		 	# cargo la direccion de memoria de la etiqueta en $s0
	
	lw $s0, 0 ( $t0 )	 	# cargo v [ 0 ]  ( 10 ) en $s0
	lw $s1, 4 ( $t0 )	 	# cargo v [ 1 ] ( 20 ) en $s1 
	lw $s2, 8 ( $t0 )	 	# cargo v [ 2 ] ( 25 ) en $s2
	lw $s3, 12 ( $t0 )	 	# cargo v [ 3 ] ( 500 ) en $s3
	lw $s4, 16 ( $t0 ) 	 	# cargo v [ 4 ] ( 3 ) en $s4
	
#	Almacenamiento en memoria 
	sw $s0, 0x10010000	
	sw $s1, 0x10010004
	sw $s2, 0x10010008
	sw $s3, 0x1001000C
	sw $s4, 0x10010010
	
	# Termino el programa 
	li $v0, 10
	syscall
	
	
