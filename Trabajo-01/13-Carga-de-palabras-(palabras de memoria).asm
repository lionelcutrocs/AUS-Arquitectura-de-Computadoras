.data

palabra: 	.word 0x10203040

.text

main:
 
	lw $s0, palabra ($0)


#  cuestion 2.5:

#  al momento de cargar el programa, se carga
# en la memoria de datos la palabra 0x10203040
# que seria el espacio de memoria en 0x10010000
# luego se ejecuta lw y se carga en el registro $s0
# el valor 0x10203040

# cuestion 2.6:

# lo que hace el simulador es cargar en el registro $s0 el valor que esta en
# memoria. Para esto chequea que $0 este en 0 y luego se fija en la palabra
# que esta ubicada en 0x10010000 y al tener $0 en 0, procede a cargar en el registro el valor
# 0x10203040.

# Aun asi, para lograr esto utiliza 3 instruciones, lui, addu y lw; con lui carga el
# valor 0x1001 en $at, con addu carga en el $at el valor 0x10010000
# y con lw carga en el registro $s0 el valor que se encuentra en 0x10010000
# 0x10203040

# cuestion 2.7:

# lui $1, 0x00001001, carga en el registro $1 el valor 0x00001001
# addu $1, $1, $0, carga en el registro $1 el valor 0x00001001
# lw $16, 0x00000000 ($1), carga en el resgistro $16 el valor final 0x10203040

# cuestion 2.8:

# se inicia el programa con la palabra cargada en memoria
# luego el valor de $at se actualiza, con el valor de una instruccion
# se carga en registro $s0 el valor que esta en la direccion.