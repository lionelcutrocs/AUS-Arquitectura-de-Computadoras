


# -------------------------------------------------------------------------- LOAD ADDRES ---------------------------------------------------------------------------------


.data 	 0x10001000			 	# inicializo por defecto 0x10000000

vectorA:	.space 80					# reservo espacio para  20 palabras ( 20 * 4 bytes = 80 )
vectorB:	.space 80					# reservo espacio para  20 palabras ( 20 * 4 bytes = 80 )

		.text						#  declaro un text, para ejecutar un programa
main:							# abro la marca de inicio del programa
	la $t0, vectorA 					# uso 'la' para cargar la direccion de memoria en $t0
	la $t1, vectorB 					# uso 'la' para cargar la direccion de memoria en $t1

#  ------------------------------------CONSIGNA-------------------------------------------------------------
#
#	Diseña un programa ensamblador que reserva espacio para dos vectores A y B de
# 	20 palabras cada uno a partir de la dirección 0x10000000.
#
#  ------------------------------------EXPLICO----------------------------------------------------------------
#
#	uso un load addres para indicar la direccion de memoria
#	que quiero reservar luego le indico un registro
#
#	la $registo , etiqueta / variable
#
#
#
