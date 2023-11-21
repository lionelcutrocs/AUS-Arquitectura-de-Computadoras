.data


byte1: 		.byte 0x10
			.align 2					# align sirve para alinear datos, en este caso sera en multiplo de 2
espacio: 		.space 4					# reservo un espacio de 4 bytes
byte2: 		.byte 0x20
palabra: 		.word 10

# cuestion 1.21:

#  para la variable de espacio se ha reservado el rango de 
# 0x10010004 a 0x10010007 

# cuestion 1.22:

# si puede constituir los 4 bytes una palabra, y con align es posible
# poder hacerlo, ya que lo que hace la directiva es acomodar
# al proximo dato en un multiplo de 2^n bytes,
# este caso es 2^2 = 4, por eso 0x10010004