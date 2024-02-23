.macro done
	li $v0,10
	syscall
.end_macro

.macro read_int
	li $v0,5
	syscall
.end_macro

.macro print_menu					# macro para imprimir el menu de opciones
	la $a0, menu
	li $v0, 4
	syscall
.end_macro

.macro error_msg(%label)			# macro para imprimir errores
	la $a0, message_error
	li $v0, 4
	syscall
	li $a0, %label
	li $v0, 1
	syscall
	j menu_loop
.end_macro


.data
						
slist:					.word 0		# puntero a smalloc y sfree
cclist:				.word 0		# puntero a lista de categorias
wclist:				.word 0		# puntero a lista circular  de objetos 
scheduler:			.space 36	
					
menu:				.ascii	"\n==================================="
					.ascii	"\nMenu de operaciones para Listas\n"
					.ascii	"===================================\n"
					.ascii	"\1 Nueva categoria.\n"
					.ascii	"2 Siguiente categoria.\n"
					.ascii	"3 Categoria anterior.\n"
					.ascii	"4 Listar las categorias.\n"
					.ascii	"5 Borrar una categoria seleccionada.\n"
					.ascii	"6 Anexar un objeto a la categoria actual.\n"
					.ascii	"7 Listar todos los objetos de la categoria.\n"
					.ascii	"8 Borrar un objeto de la categoria en curso.\n"
					.ascii	"0 Salir.\n"
					.asciiz	"Ingrese la opcion que desea: "
				
message_error:		.asciiz	"Error: "
return:				.asciiz	"\n"
name_category:		.asciiz	"\nIngrese el nombre de una categoria: "
select_category:		.asciiz	"\nSe ha seleccionado la categoria: "
all_categories:			.asciiz	"\nLas categorias existentes son: \n"
item_id:				.asciiz	"\nIngresar el Id del item al eliminar: "
name_objet:			.asciiz	"\nIngrese el nombre de un objeto: "
success:				.asciiz	"La operacion se realizo con exito.\n\n"

error_list:			        .ascii  "201 - No hay categorias para seleccionar\n"
                			.ascii  "301 - No hay categorias para listar\n"
                			.ascii  "401 - No hay categorias para borrar\n"
                			.ascii  "501 - No existen categorias para poder anexar objetos\n"
                			.ascii  "601 - No hay categorias creadas\n"
                			.ascii  "602 - No hay objetos para la categoria en curso\n"
                			.asciiz "701 - No existen categorias para borrar\n"
					.asciiz "101 - Error de seleccion\n"
index:         			.asciiz "> "


.text
.globl main

main:
# 	initialization scheduler vector
	la		$t0, scheduler
	la		$t1, new_category
	sw		$t1, ($t0)
	la		$t1, next_category
	sw		$t1, 4 ($t0)
	la		$t1, prev_category
	sw		$t1, 8 ($t0)
	la		$t1, list_categories
	sw		$t1, 12 ($t0)
	la		$t1, del_category
	sw		$t1, 16 ($t0)
	la		$t1, add_obj
	sw		$t1, 20 ($t0)
	la		$t1, list_obj_category
	sw		$t1, 24 ($t0)
	la		$t1, del_obj
	sw		$t1, 28 ($t0)
	la		$t1, list_error
	sw		$t1, 32 ($t0)


menu_loop:

	jal menu_display
si:
	beq $v0, 1, new_category
	beq $v0, 2, next_category
	beq $v0, 3, prev_category
	beq $v0, 4, list_categories
	beq $v0, 5, del_category
	beq $v0, 6, add_obj
	beq $v0, 7, list_obj_category
	
sino:
	j menu_loop
	
menu_return:
	j menu_loop
	
menu_display:

	print_menu							# print all menu options ( its is a macro )
	read_int								# read a integer ( its is a macro )
	bgt $v0, 8, menu_error					# test if invalid option go to menu_error
	bltz $v0, menu_error					# other case for error
	jr $ra

menu_error:
	la $a0, message_error
	li $v0, 4
	syscall
	li $a0, 101
	li $v0, 1
	syscall
	j menu_display
	
main_end:
	done

# ----------------------------------		New Category		 ----------------------------------

new_category:
	
	addiu 	$sp, $sp -4
	sw 		$ra, ( $sp )	
	la 		$a0, name_category				# input name category
	jal 		getblock
	move 	$a2, $v0							# $a2 = *char nombre de categoria
	la 		$a0, cclist							# $a0 = lista
	li 		$a1, 0							# $a1 = NULL
	jal 		addnode
	lw 		$t0, wclist
	bnez 	$t0, new_category_end				# jump if wclist is not 0
	sw 		$v0, wclist
	
new_category_end:
	
	li 		$v0, 0							# return success
	lw 		$ra, ( $sp )
	addiu 	$sp, $sp, 4
	jr 		$ra

# ----------------------------------		Next Category		 ----------------------------------

next_category:

	lw $t0, wclist
	beqz $t0, error_display2
	lw $t1, 12($t0)
	
	la $a0, select_category
	li $v0, 4
	syscall
	
	sw $t1, wclist                           		# Actualizar la categoría seleccionada
	lw $a0, 8 ($t1)                           	# Cargar el puntero al nombre de la categoría
	li $v0, 4                                		# Llamada al sistema para imprimir la cadena
	syscall
	j salida

# ----------------------------------		Prev Category		 ----------------------------------

prev_category:

# Obtengo el puntero a la lista de categorias 

	lw $t0, wclist					# cargo la direccion de lista de categorias 
	beqz $t0, error_display2			# voy a seguir si hay una categoria seleccionada, sino error
	lw $t1, ($t0)					# obtengo el nodo previo al actual
	
# Mensaje indicando la categoria seleccionada
	la $a0, select_category
	li $v0, 4
	syscall
	
	sw $t1, wclist                           		# Actualizar la categoría seleccionada con la cat previa 
	lw $a0, 8 ($t1)                           	# Cargar el puntero al nombre de la categoría
	li $v0, 4                                		# Llamada al sistema para imprimir la cadena
	syscall
	j salida
	
error_display2:
  	error_msg(201)          
    	j salida

salida:
 	j menu_loop

# ----------------------------------		List Category		 ----------------------------------

list_categories:

	lw 		$t0, cclist				# cargo la direccion de categorias
	beqz 	$t0, error_display		# si esta vacio, imprimo error
	move	$t1, $t0				# paso el primer nodo a $t1
	
bucle_hacer:
	la 		$a0, all_categories		# cargo mensaje para prensentar las categorias
	li 		$v0, 4
	syscall
	
	lw 		$a0, 8 ($t0)			# selecciono la direccion de la categoria
	li 		$v0, 4
	syscall
	
	lw 		$t0, 12($t0)
	beq 		$t0, $t1, salida			# si $t0 es == a $t1, salgo del bucle
	j bucle_hacer
	
error_display:
	error_msg(301)
	j salida
# ----------------------------------		Del Category		 ----------------------------------

# aun sin funcionar, la implementacion no esta terminada
del_category:

# sin implementar	

# ----------------------------------		Add Objet		 ----------------------------------

add_obj:
	
	lw 		$s0, wclist
	bgtz		$s0, add_obj_on_cat		# sigo, si hay una cat seleccionada
	j		error_display3				# si no, error 501
	
add_obj_on_cat:

# se configura la pila para almacenar el estado actual
	addi 		$sp, $sp, -8
	sw 		$ra, ($sp)
	sw 		$s0, 4 ($sp)
	
# se solicita el nombre del objeto
	la 		$a0, name_objet	
	jal		getblock
	
# se configuran los argumentos para agregar los nodos
	la		$a0, 4 ($s0)				# Direccion de lista de objetos de la categoria actual 
	move	$a2, $v0					# Direccion del bloque de memoria reservado para el nombre 
	lw 		$t0,($a0)					# Direccion del primer nodo de la lista de obj
	jal 		addnode
	
	j menu_loop
	
error_display5:
	error_msg(601)
	j salida
	
error_display3:
	error_msg(501)
	j salida

# ----------------------------------		List Objets		 ----------------------------------

list_obj_category:
	
	lw 		$t0, wclist					# cargo la direccion de la lista de objetos
	beq		$t0, $0, error_display4		# si esta vacio, error 601
	
	lw 		$t1, 4($t0)				# cargo la direccion desde la poscion 4 de la lista de wclist
	move 	$t2, $t1					# copio el primer nodo en $t2
	beq		$t1, $0, error_display6		
	
bucle_1:
	
	la		$a0, index				# cargo el index " > "
	li 		$v0, 4
	syscall
	
	lw 		$a0, 8 ($t1)				# cargar la direccion para imprimir el obj
	li 		$v0, 4
	syscall
	
	lw		$t1, 12 ($t1)
	beq 		$t1, $t2, salida				# si $t1 es == a $t2 salgo de loop 
	j		bucle_1

error_display4:
	error_msg(601)
	j salida

error_display6:
	error_msg(602)
	j salida

# ----------------------------------		Del Objets		 ----------------------------------

del_obj:

# sin implementar

# a0: msg to ask
# v0: block address allocated with string

getblock:

	addi 		$sp, $sp, -4
	sw		$ra,  ($sp )
	li		$v0, 4				# print
	syscall
	jal 		smalloc
	move	$a0, $v0
	li 		$a1, 16					
	li		$v0, 8				# asig dinamic memory
	syscall
	move	$v0, $a0				# getblock result
	lw		$ra,  ( $sp )
	addi		$sp, $sp 4
	jr		$ra

 
# a0: list address (pointer to the list)
# a1: NULL if category or ID if an object
# a2: address return by getblock
# v0: node address added
 
addnode:
 	addi $sp, $sp, -8
 	sw $ra, ($sp)
 	sw $a0, 4($sp)
 	
 	jal smalloc
 	
 	sw $a1, 4($v0) 		# set node content
 	sw $a2, 8($v0)
 	lw $a0, 4($sp)
 	lw $t0, ($a0) 			# first node address
 	beqz $t0, addnode_empty_list
 	
addnode_to_end:

	 lw $t1, ($t0)			 # last node address
 # update prev and next pointers of new node
 	sw $t1, 0($v0)
 	sw $t0, 12($v0)
 # update prev and first node to new node
 	sw $v0, 12($t1)
 	sw $v0, 0($t0)
 	j addnode_exit

addnode_empty_list:
	sw $v0, ($a0)
 	sw $v0, 0($v0)
 	sw $v0, 12($v0)
addnode_exit:
	 lw $ra, ($sp)
	 addi $sp, $sp, 8
	 jr $ra
	 
 # a0: node address to delete
 # a1: list address where node is deleted

delnode:
	 addi $sp, $sp, -8
	 sw $ra, ($sp)
	 sw $a0, 4($sp)
	 lw $a0, 8($a0)			# get block address
	 
	 jal sfree 				# free block
	 
	 lw $a0, 4($sp)			 # restore argument a0
	 lw $t0, 12($a0)		 # get address to next node of a0
	 beq $a0, $t0, delnode_point_self
	 lw $t1, 0($a0)			 # get address to prev node
	 sw $t1, 0($t0)
	 sw $t0, 12($t1)
	 lw $t1, 0($a1)			 # get address to first node
	 bne $a0, $t1, delnode_exit
	 sw $t0, ($a1) 			# list point to next node
	 j delnode_exit
	 
delnode_point_self:
	 sw $zero, ($a1) 		# only one node 
delnode_exit:

	 jal sfree
	 lw $ra, ($sp)
	 addi $sp, $sp, 8
	 jr $ra

# ----------------------------------		MALLOC		 -----------------

smalloc:

	 lw $t0, slist
	 beqz $t0, sbrk
	 move $v0, $t0
	 lw $t0, 12($t0)
	 sw $t0, slist
	 sw      $0, ($v0)
         sw      $0, 12($v0)
	 jr $ra
sbrk:

	 li $a0, 16 			# node size fixed 4 words
	 li $v0, 9
	 syscall 				# return node address in v0
	 jr $ra
sfree:

	 lw $t0, slist
	 sw $t0, 12($a0)
	 sw $a0, slist 			# $a0 node address in unused list
 	 jr $ra
 	 
list_error:
	la $a0, error_list
	li $v0, 4
	syscall
	jr $ra
 	

 	 
