#		Problemas propuestos para entregar + 2.4

.data	0x10000000

hexa1:	.word 0xABCD12BD
hexa2:	.word 0X894D12BD			# esta sera la mascara para llevar a 0 los bits 3, 7, 9
		
.text

main:

#	Carga de valores en registros
	lw $s0, hexa1
	lw $s1, hexa2

#	Operando con and ( sin i )
	and $s2, $s0, $s1				# guardo el resultado en s2 y opero AND con s0 y s1
	
#	Almacenado de valores 
	sw $s2, hexa2+4				# hexa+2 para apuntar el almacenado a la siguiente posicion de memoria 

#	Termino el programa
	li $v0, 10
	syscall