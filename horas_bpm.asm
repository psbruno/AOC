.data
	msg1: .asciiz "Insira as horas (inteiro entre 0 e 23)"  
	StrErroH: .asciiz "Valor inválido para as horas. Esperado número entre 0 e 23 "  
	msg2: .asciiz "Insira os minutos (inteiro entre 0 e 59) "  
	StrErroM: .asciiz "Valor inválido para os minutos. Esperado número entre 0 e 59 "  
	msg3: .asciiz "Insira os segundos (inteiro entre 0 e 59) "  
	StrErroS: .asciiz "Valor inválido para os segundos. Esperado número entre 0 e 59 "  

	msg4: .asciiz "Horário Digitado: "  
	msg5: .asciiz ":"

.text 
#-------------------- Horas 

	addi $v0,$0, 4 		#imprimir string do input 1
	la $a0, msg1
	syscall
	
	NotLessH:	
	li $v0, 5		#input 1
	syscall
	
	add $t5,$0,$v0		#t0 = 0+ v0 (input)
	addi $t1, $0,23	
	addi $t2, $0, 0
				
	slt $t3,$v0,$t1 	# $t0 = 1 se  $v0 (input) > $t1 (setado como 23)
	slt $t4,$t2,$v0		# $t3 = 1 se $t2 (0) > $v0 (input)

	beq $t3,$zero,ErroH 	# vá para ErroH, se $t0 == 0 (input<23)
	beq $t4,$zero,ErroH 	# vá para ErroH, se $t3 == 0 (input negativo)

	beq $zero,$zero,HOK 	#vá para HOK, pois se chegou aqui, o input de hora está certo
	
	ErroH:
	addi $v0,$0, 4 		#imprimir string de erro das horas
	la $a0, StrErroH
	syscall	
	
	beq $zero,$zero,NotLessH 
	
#-----------------------Minutos
	HOK:
	

	addi $v0,$0, 4 		#imprimir string do input 2
	la $a0, msg2
	syscall
	
	NotLessM:	
	li $v0, 5		#input 2
	syscall
	
	add $t6,$0,$v0		#t6 = 0+ v0 (input)
	addi $t1, $0,60		#setando o valor máximo para minutos
	addi $t2, $0, 0		#setando o valor mínimo para minutos
				
	slt $t3,$v0,$t1 	# $t0 = 1 se  $v0 (input) > $t1 (setado como 60)
	slt $t4,$t2,$v0		# $t3 = 1 se $t2 (0) > $v0 (input)

	beq $t3,$zero,ErroM 	# vá para ErroM, se $t3 == 0, resultado do primeiro slt
	beq $t4,$zero,ErroM 	# vá para ErroM, se $t4 == 0, resultado do segundo slt
	
	beq $zero, $zero, MOK	#se chegou aqui, minutos ok
	
	ErroM:
	
	addi $v0,$0, 4 		#imprimir string de erro dos minutos
	la $a0, StrErroM
	syscall	
	
	beq $zero,$zero,NotLessM	#loop para ficar aqui até entrar com um número válido para minutos 
	
#---------------------Segundos
	
	MOK:

	addi $v0,$0, 4 		#imprimir string do input 3
	la $a0, msg3
	syscall
	
	NotLessS:	
	li $v0, 5		#input 3
	syscall
	
	add $t7,$0,$v0		#t7 = 0+ v0, criando cópia do input 
	addi $t1, $0,60		#setando o valor máximo para segundos
				
	slt $t3,$v0,$t1 	# $t0 = 1 se  $v0 (input) > $t1 (setado como 60)
	slt $t4,$0,$v0		# $t3 = 1 se $t2 (0) > $v0 (input)
	
	beq $t3,$zero,ErroS 	# vá para ErroS, se $t3 == 0, resultado do primeiro slt
	beq $t4,$zero,ErroS 	# vá para ErroS, se $t4 == 0, resultado do segundo slt
	
	beq $zero, $zero, output 	#se chegou até aqui, input ok
	
	ErroS:
	addi $v0,$0, 4 		#imprimir string de erro dos segundos
	la $a0, StrErroS
	syscall	
	
	beq $zero, $zero, NotLessS
	
#------------------output
	output:
	addi $v0,$0, 4 		#imprimir string do resultado
	la $a0, msg4
	syscall
	
	addi $v0, $0, 1		# imprimir horas
	add $a0, $0, $t5
	syscall	
	
	addi $v0,$0, 4 		#imprimir separador
	la $a0, msg5
	syscall
	
	addi $v0, $0, 1		# imprimir minutos 
	add $a0, $0, $t6
	syscall		
	
	addi $v0,$0, 4 		#imprimir string do resultado
	la $a0, msg5
	syscall	
		
	addi $v0, $0, 1		# imprimir segundos 
	add $a0, $0, $t7
	syscall	
	
	
	
	
