


# -------------------------------------------------------------------------- STORE WORD ---------------------------------------------------------------------------------


.data								# inicializo por defecto en 0x10010000

			.align 2
palabra:		.word 0, 0, 0				# inicializa palabra con 3 palabras de valor 0
byte:			.byte 0x10					# creo la etiqueta, con dato y su valor correspondiente de forma generico
			.align 2
espacio1: 	.space 4
			.align 2					# alineo en direccion multiplo 4
espacio2: 	.space 20
		
 			.text	 					# declaro un text, para ejecutar un programa de instrucciones
 	 							
main: 								# abro la marca de incio del programa

	la $t0, palabra						# load addres para reservar en t0 el dato: ( word 3 )
	lw $t1, 0 ($t0)						# load word para hacer la reserva de mem en $t1
							
	la $t0, byte						# load addres para reservar en $t0 el dato : (byte 0x10)
	lb $t2, 0 ($t0)						# load byte para cargar en byte en $t2 
							
	la $t0, espacio1						# load addres para reservar el espacio de mem en $t0
#	li $t3, 0 							# load immediate valor de inicializacion de espacio1, opcional
	sw $t3, 0 ($t0)						# store word inicializo el espacio1 con el valor $t3
						 
	la $t0, espacio2						# load addres para reservar el espacio de mem en $t0
#	li $t4, 0							# load immediate valor de inicializacion de espacio2, opcional
	sw $t4, 0 ($t0)						# store word almaceno el valor de espacio2 con el valor $t4

#  ------------------------------------CONSIGNA--------------------------------------------------------
#
#	Diseña un programa ensamblador que realice la siguiente reserva de espacio e
#	inicialización en memoria a partir de la dirección por defecto: 3 (palabra), 0x10
#	(byte), reserve 4 bytes a partir de una dirección múltiplo de 4, y 20 (byte).
#
#  ------------------------------------EXPLICO-----------------------------------------------------------
#
#	Para hacer las reservas utilizo la instruccion load addres (la)
#	Los $t0 son temporarios asi que cuando ya inicializo lo reservado y aseguro, 
#	puedo re utilizar $t0
#
#	Load byte (lb) lo utilizo para cargar en datos que sean tipo byte
#	Store word para almacenar valores de un registro en una ubicacion de mem especifica
#
#
