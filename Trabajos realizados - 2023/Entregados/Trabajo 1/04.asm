


# -------------------------------------------------------------------------- STORE WORD ---------------------------------------------------------------------------------


.data								# inicializo por defecto en 0x10010000

			.align 2
cadena:		.ascii "Esto es un problema"

cadena2:		.byte "Esto es un problema"	
			#buscar para guardar en byte caractares el equivalente en hexadecimal

	
 			.text	 					# declaro un text, para ejecutar un programa de instrucciones
 			.globl main	 							
main: 								# abro la marca de incio del programa

	la $t0, cadena
	la $t1, cadena2

		
#  ------------------------------------CONSIGNA--------------------------------------------------------
#
#	Diseña un programa ensamblador que defina, en el espacio de datos, la siguiente
#	cadena de caracteres: “Esto es un problema” utilizando
#	a) .ascii
# 	b) .byte
# 	c) .word
#  ------------------------------------EXPLICO-----------------------------------------------------------
#
#	se define la cadena "Esto es un problema" de tres formas diferentes,
#	 en el espacio de datos utilizando las directivas .ascii y .byte.
#	luego, carga las direcciones de estas cadenas en registros para su posterior uso.
#
#
