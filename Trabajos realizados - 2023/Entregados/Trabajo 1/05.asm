


# -------------------------------------------------------------------------- MATRIZ  ---------------------------------------------------------------------------------


.data 0x10010000						# inicializo por defecto en 0x10010000

A_filas: .word 1, 2, 3
	   .word 4, 5, 6
	   .word 7, 8, 9
				
A_columnas: .word 1, 4, 7
		   .word 2, 5, 8
		   .word 3, 6, 9

 	.globl main
 		 							
main: 								# abro la marca de incio del programa

	la $t0, A_filas						# cargo la direccion de A con load addres
	li  $t1, 0							# indice de la matriz en filas
	li  $t2, 0							# indice de la matriz en columnas 
	


		
#  ------------------------------------CONSIGNA--------------------------------------------------------
#
#	Sabiendo que un entero se almacena en un word, diseña un programa ensamblador
#	que defina en la memoria de datos la matriz A de enteros definida como
#
#	     1 2 3 
#	A  4 5 6
#	    7 8 9 
#	
#	a partir de la dirección 0x10010000 suponiendo que:
#	a) La matriz A se almacena por filas.
# 	b) La matriz A se almacena por columnas

#  ------------------------------------EXPLICO-----------------------------------------------------------
#
#	defino A_filas y A_columnas para poder configurar la matriz
#	luego utilizo la para cargar la direccion de A y li para cargar la matriz
#
#
#	
#
