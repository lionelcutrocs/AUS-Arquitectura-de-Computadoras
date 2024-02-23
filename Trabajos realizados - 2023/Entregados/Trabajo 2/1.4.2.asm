#		Problemas propuestos en la seccion + 1.4

.data

palabra:		.word 0x10203040
espacio:		.space 4
espacio1:		.space 4

.text

main:

# 	Inicializacion
	la $t0, palabra			# cargo la direccion de memoria de la etiqueta con el valor

	lw $t1, 0 ( $t0 )			# cargo en registro t1, el valor de la etiqueta
	sw $t1, 0 ( $t0 )		# almaceno en memoria el valor del registro t1, el valor de la etiqueta
	
#	Invierto los bytes
	lb $s0, 0 ( $t0 )		# tomo el bit mas significativo 0x10
	lb $s1, 1 ( $t0 )		# tomo el siguiente bit 0x20
	lb $s2, 2 ( $t0 )		# tomo el siguiente bit 0x30
	lb $s3, 3 ( $t0 )		# tomo el bit menos significativo 0x40
	
# 	Almaceno en memoria 
	sb $s3, espacio		# almaceno en memoria el bit menos significativo 0x40
	sb $s2, espacio+1		# almaceno en memoria el sig bit 0x30, me desplazo 1 byte, desde el inicio del espacio reservado
	sb $s1, espacio+2		# almaceno en memoria el sig bit 0x20, me desplazo 2 bytes, desde el inicio del espacio reservado
	sb $s0, espacio+3		# almaceno en memoria el but mas significativo del valor original 0x10, me dezplazo 3 bytes, desde el inicio

#	Reorganizo con HalfWord
	lw $t2, 0 ( $t0 )			# cargo en registro t2, el valor de la etiqueta en t0
	sw $t2, 0 ( $t0 )		# almaceno en memoria el valor del registro t2
	
	lh $t3, 0 ( $t0 )			# tomo la mitad 0x3040
	lh $t4, 2 ( $t0 )			# tomo la otra mitad 0x1020
	
	sh $t4, espacio1		# almaceno en memoria una mitad 0x1020
	sh $t3, espacio1 +2		# almaceno en memoria ota mitad 0x3040, me desplazo 2 bytes
	
#	Termino el programa

	li $v0, 10
	syscall
	