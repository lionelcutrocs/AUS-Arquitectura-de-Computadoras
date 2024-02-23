.data	0x10000000							


vector:		.word	0x10, 30, 0x34, 0x20, 60			# valores en decimal y hexadecimal
												# uso word para definir el tamaño (4 bytes)
# cuestion 1.5:

# el vector se guarda correctamente en la direccion que se señala
# solo, que al ser 0x10000000 se guarda en .extern

# cuestion 1.6:

# si se inicia con el valor de direccion 0x10000002, que seria 
# .data  0x10000002 los datos del vector se guardan en  0x10000004
# ya que al momento de guardar, se guardan solo en el comienzo de una direccion completa

# si yo tomo una direccion de inicio como  0x10000001, igual se guardara en  0x10000004
# porque el tipo de dato del vector es un .word osea, 4 bytes