


# -------------------------------------------------------------------------- LOAD ADDRES ---------------------------------------------------------------------------------


.data 0x10001000						# inicializo en 0x10001000

palabra1:		.word 4 					# creo la etiqueta, con dato y su valor correspondiente de forma generico
byte:			.byte 1					# creo la etiqueta, con dato y su valor correspondiente de forma generico
palabra2:		.word 4					# creo la etiqueta, con dato y su valor correspondiente de forma generico				
 			
 			.text						# declaro un text, para ejecutar un programa de instrucciones
 	 							
main: 								# abro la marca de incio del programa
	.align 4
	la $t0, palabra1						# load addres para cargar en t0 el dato: ( word 4 )
	la $t1, byte						# load addres para cargar en t0 el dato: ( byte 1 )
	la $t3, palabra2						# load addres para cargar en t0 el dato: ( word 4 )


#  ------------------------------------CONSIGNA--------------------------------------------------------
#
#	Diseña un programa ensamblador que realiza la siguiente reserva de espacio en
#	memoria a partir de la dirección 0x10001000: una palabra, un byte y otra palabra
#	alineada en una dirección múltiplo de 4.
#
#  ------------------------------------EXPLICO-----------------------------------------------------------
#
#	uso la para reservar cada dato del enunciado
#	especifico el dato y le doy el valor real que vale cada tipo de dato
#	uso el align 4, para que se alineen las direcciones de mem  en multiplos de 4
#
#
