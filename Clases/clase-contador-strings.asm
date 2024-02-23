# 		contador de letras de un string

.data

palabra:	.asciiz "Hola"

.text

main:

	li $t0, 0		# inicializo el contador
	la $t1, palabra		# cargo la direccion del string
	
 loop:
 	lb $t2, 0($t1)		# cargo el byte actual del string
 	beqz $t2, done	 	# si encuentro el carac nulo ( final string ) corto
 	addi $t0, $t0, 1	# incremento el contador en 1 
 	addi $t1, $t1, 1	# paso al siguiente caracter
 	j loop 
 done:
 
 	li $v0, 10		# Termino el programa
 	syscall					
 
 	
