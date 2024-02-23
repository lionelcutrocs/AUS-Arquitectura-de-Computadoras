#		Problemas propuestos para entregar + 2.4

.data	0x10000000

num1:	.word 18
num2:	.word -1215
num3:	.word 5
		
.text

main:

#	Carga de valores en registros
	lw $s0, num1
	lw $s1, num2
	lw $s2, num3

#	Operando con division ( div )
	div $s0, $s2					# division de 18 / 5
	mflo $t0						# muevo el resultado a t0
	
	div $s1, $s2					# division de -1215 / 5
	mflo $t1						# muevo el resultado a t1
	
#	Almacenado de valores 			
	sw $t0, 0x10010000				# tomo el resultado de t0 y lo transfiero a 0x10010000
	sw $t1, 0x10010004				# tomo el resultado de t1 y lo transfiero a 0x10010004 ( porque es la siguiente posicion de memoria )
	
#	Termino el programa
	li $v0, 10
	syscall
	