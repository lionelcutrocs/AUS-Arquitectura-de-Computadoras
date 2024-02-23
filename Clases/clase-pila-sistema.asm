.data

stack:	.space 100

.text

main:
#	Inicializo el tope de linea

	
	li $a0, 22
	li $a1, 88
	li $a2, 9
	
#	Ejecuto la funcion para empujar valores en la pila
	jal push
	
	jal delete
		
#	Termino el programa 
	li $v0, 10
	syscall
		
# 	Subrutina para empujar valores
push:
	li $t0, 9
	li $t1, 22
	li $t2, 88
    	
	jr $ra
		
#	Subrutina para liberar la pila
delete:
	lw $a2, 0 ( $sp )
	lw $a1, 4 ( $sp )
	lw $a0, 8 ( $sp )
	
	addi $sp, $sp, 12
	
	jr $ra


#	sw $a0, 0 ( $sp )
#	sw $a1, -4 ( $sp)
#	sw $a2, -8 ( $sp )
