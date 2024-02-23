.data									


palabra1:	.byte		0x10, 0x20, 0x30, 0x40
#pal:		.byte		0x50					# valor en hexadecimal
palabra2:	.word	0x10203040			# valor en hexadecimal
							
# cuestion 1.9:

# los valores almacenados con la etiqueta palabra1
# en memoria se obtiene 0x40302010
# con la etiqueta palabra2
# en memoria se obtiene 0x10203040

# cuestion 1.10:

# el tipo de alineamiento y organizacion que usa el simulador es
# little endian, ya que permite que los bits menos significativos 
# se almacenen en la parte baja de memoria, permitiendo tener una 
# lectura de datos mas intuitivo. 
# A demas, permite justamente si se almacena un byte, el sistema permite 
# sumar 3 bytes mas, hasta completar los 4bytes y tener una direccion de memoria
# completa

# cuestion 1.11:

# los valores que toman las etiquetas son:
# palabra1 = 0x10010000
# palabra2 = 0x10010004
