.data


cadena:		.ascii	"abcde"			
octeto:		.byte		0xFF

# 1 caracter = 1 byte	
# ascii no incluye el caracter null

# cuestion 1.12:

# la cadena de caracteres se encuentra en la direccion de memoria 
# 0x10010000 y sigue hasta 0x10010005 que se obtiene la 
# cadena de caracteres completa
# y en 0x10010006 se encuentra el byte 0xFF

# cuestion 1.13:

# la directiva .ascii no contempla el caracter nulo \0 
# al final de la cadena de caracteres.
# en cambio el uso de .asciiz si va a contar el 
# caracter nulo \0

# Si observamos en memoria la directiva .ascii nos encontramos
# con 0xFF seguido al final de la cadena de caracteres, es decir
# el byte guardado estara luego del ultimo byte de la cadena
# Ysi observamos en memoria con la directiva .asciiz
# si vamos a encontrar la diferencia que contempla el caracter nulo 
# y luego el byte guardado 0xFF

# A demas sobre la direccion de memoria con el uso de .asciiz
# iniciara en 0x10010000 hasta 0x10010006 contando el \0
# y luego en 0x10010007 el byte 0xFF