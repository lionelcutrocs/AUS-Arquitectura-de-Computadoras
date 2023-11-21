.data

byte1:			.byte		0x10						# 1 byte 
espacio:			.space	4						# 4 bytes
byte2:			.byte		0x20						# 1 byte
palabra:			.word	10						# 4 bytes


# cuestion 1.17:

# el rango que se reservo para 
# espacio es desde 0x10010001 a 0x10010005
# y ocupa 4 bytes, donde comenzara al terminar
# byte1 el cual ocupa 1 byte

# cuestion 1.18:

# la reserva de espacio al ser de 4 bytes si podria
# constituir espacio para una palabra, pero este no seria
# el caso, ya que el word que se quiera guardar se
# tiene que desplazar si o si y comenzaria en 0x10010004
# esto, debido a byte1

# cuestion 1.19:

# las direcciones de memoria que se incializa para byte 1 y 2:
# byte1 se incializa en 0x10010001
# byte2 se incializa en 0x10010005

# cuestion 1.20:

# la palabra se va a inicializar a partir de 0x10010008
# esto porque ocupa 4 bytes, y no puede inicializarce luego 
# de byte2 en 0x10010006, ya que siempre una direccion de memoria
# se inicializa con un multiplo de 4
