.data						# comienza la zona de datos como no tiene direccion usa 0x10010000 (por defecto)

																		# Valor dato hexadecimal

palabra1:	.word 15				# numero en decimal (base 10)					
palabra2:	.word 0x15			# numero en hexadecimal						


# cuestion 1.1:

# para palabra1 su valor hexadecimal es de 0x0000000F
# para palabra2 su valor hexadecimal es de 0x00000015

# cuestion 1.2:

# el valor de palabra1 se encuentra alamcenado en 0x10010000 este ultimo referencia a la direccion.
# el valor de palabra2 se encuentra almacenado en 0x10010004 este ultimo referencia a la direccion.

# ahora, estas palabras 1 y 2, se encuentran en estas direcciones de memoria debido a 
# que por defecto se empieza con el valor 0x10010000 y va en aumento
# y este es el caso de que aumenta 4 en 4, debido a que son palabras de 32bits