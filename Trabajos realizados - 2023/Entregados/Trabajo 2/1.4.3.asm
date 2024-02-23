#		Problemas propuestos en la seccion + 1.4

.data 0x10010000
            
espacio1:   	.space 2						# arranca en 0x10010002
bytes:    		.byte 0x10, 0x20, 0x30, 0x40
espacio2:   	.space 4						# arranca en 0x10010010
palabra:    	.word

.text
main:

#	    Cargo los valores en registros
            lb $s0, bytes ($0)				# 0x10 -> 0x10010003
            lb $s0, bytes ($0)            		# 0x20 -> 0x10010004
            lb $s0, bytes ($0)				# 0x30 -> 0x10010005
            lb $s0, bytes ($0)				# 0x40 -> 0x10010006

#	    Transferencia de Datos 
            sb $s0, palabra ($0)			# almaceno 0x10 -> 0x10010010
            sb $s0, palabra+1 ($0)		# almaceno 0x20 -> 0x10010011
            sb $s0, palabra+2 ($0)           	# almaceno 0x30 -> 0x10010012
            sb $s0, palabra+3 ($0)		# almaceno 0x40 -> 0x10010013

#	    Termino el programa 
	    li $v0, 10
	    syscall