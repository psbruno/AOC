# material consultado: https://www.youtube.com/watch?v=_toRnXaW_I0
#		       https://stackoverflow.com/questions/16627963/convert-integer-to-double-in-mips/16654440
#		       https://www.youtube.com/watch?v=mZmtkavLVgI

.data
	msgInput: .asciiz "Digite o nome do produto: "
	msgInput2: .asciiz "Insira o valor unitário desse produto: "
	msgInput3: .asciiz "Insira a quantidade desejada deste produto: "
	Quest: .asciiz "Deseja comprar algo a mais? Se sim, digite 1. Caso contrário, digite 0. Resposta: "
	X: .asciiz "x "
	VU: .asciiz "Valor Unitário: "
	bn: .asciiz "\n"
	VT: .asciiz "Valor total do produto: R$"
	VPd: .asciiz "\nValor total do pedido: R$"
	Pedido: .asciiz "\n Pedido: \n"
	
	ArrayQtdes:	#array de ints
			.alig 2
		        .space 21 		# 5 espacos		
	
	
	
	zero: .float 0.0
	
	Produto1: .space 200
	Produto2: .space 200
	Produto3: .space 200
	Produto4: .space 200
	Produto5: .space 200
	
.text
	
	addi $t2, $0, 1		#contador de produtos = 1 
	#Produto 1 
	jal FProduto1	
	jal FimProduto
	beqz $v0, FimDaCompra	
	

	#Produto 2 
	addi $t2, $t2, 1	#contador de produtos = 2 

	jal FProduto2	
	jal FimProduto
	beqz $v0, FimDaCompra	
	
	#Produto 3 
	addi $t2, $t2, 1		#contador de produtos = 3 
	jal FProduto3	
	jal FimProduto
	beqz $v0, FimDaCompra	
	
	#Produto 4 
	addi $t2, $t2, 1		#contador de produtos = 4
	jal FProduto4	
	jal FimProduto
	beqz $v0, FimDaCompra	
	
	#Produto 5 
	addi $t2, $t2, 1	#contador de produtos = 5
	jal FProduto5	
		
	FimDaCompra:
		
	jal pedido
	
	
	#encerra o programa
	li $v0, 10
	syscall


#------------------------------------ mensagem novo produto
FimProduto:	
	#	impressao da msg para usuario
	li $v0, 4
	la $a0, Quest
	syscall	
	
	li $v0, 5	#input quantidade produto 1
	syscall
	
jr $ra
#------------------------------------ Funcões produto 1
FProduto1:
	#impressao da mensagem que pede produto
	li $v0, 4
	la $a0, msgInput
	syscall

	#leitura Produto1
	li $v0, 8	# 8 == Ler String ou char
	la $a0, Produto1
	la $a1, 100
	syscall	


#	impressao da msg para usuario
	li $v0, 4
	la $a0, msgInput2
	syscall

	

#	leitura Preco1
	li $v0, 6
	syscall 
	
	lwc1 $f10, zero		#f10 = 0
	add.s $f1, $f10, $f0		#f1 = 0 + input

	
	
#	output teste Preco1
#	add.s $f12,$f1, $f0
#	li $v0, 2
#	syscall
	
#	impressao da mensagem que pede a qtde do produtoo
	li $v0, 4
	la $a0, msgInput3
	syscall

	
	li $v0, 5	#input quantidade produto 1
	syscall
	
	add $t3,$0,$v0		#t0 = 0+ v0 (input)

	addi $t0, $0,1
	sw $t3, ArrayQtdes($t0)
	
jr $ra

#------------------------------------ Funcões produto 2
FProduto2:
	
	#impressao da mensagem que pede produto
	li $v0, 4
	la $a0, msgInput
	syscall


	#leitura Produto2
	li $v0, 8	# 8 == Ler String ou char
	la $a0, Produto2
	la $a1, 100
	syscall	


#	impressao da msg para usuario
	li $v0, 4
	la $a0, msgInput2
	syscall

	

#	leitura Preco1
	li $v0, 6
	syscall 
	
	lwc1 $f10, zero		#f10 = 0
	add.s $f2,$f10, $f0	#  f2 = 0 + input
	
#	output teste Preco1
#	add.s $f12,$f1, $f0
#	li $v0, 2
#	syscall
	
#	impressao da mensagem que pede produto
	li $v0, 4
	la $a0, msgInput3
	syscall

	
	li $v0, 5	#input quantidade produto 2
	syscall
	
	add $t4,$0,$v0		#t4 = 0+ v0 (input)
	
	addi $t0, $0, 5
	sw $t4, ArrayQtdes($t0)	
jr $ra

#------------------------------------ Funcões produto 3
FProduto3:
	#impressao da mensagem que pede produto
	li $v0, 4
	la $a0, msgInput
	syscall


	#leitura Produto3
	li $v0, 8	# 8 == Ler String ou char
	la $a0, Produto3
	la $a1, 100
	syscall	


#	impressao da msg para usuario
	li $v0, 4
	la $a0, msgInput2
	syscall

	

#	leitura Preco3
	li $v0, 6
	syscall 

	lwc1 $f10, zero		#f10 = 0
	add.s $f3,$f10, $f0	#  f3 = 0 + input


#	output teste Preco1
#	add.s $f12,$f1, $f0
#	li $v0, 2
#	syscall
	
#	impressao da mensagem que pede produto
	li $v0, 4
	la $a0, msgInput3
	syscall

	
	li $v0, 5	#input quantidade produto 3
	syscall
	
	add $t5,$0,$v0		#t5 = 0+ v0 (input)
	addi $t0, $0, 9		#seta t0 para o valor de bytes correto
	sw $t5, ArrayQtdes($t0)		#manda pro array
jr $ra

#------------------------------------ Funcões produto 4
FProduto4:
	#impressao da mensagem que pede produto
	li $v0, 4
	la $a0, msgInput
	syscall


	#leitura Produto3
	li $v0, 8	# 8 == Ler String ou char
	la $a0, Produto4
	la $a1, 100
	syscall	


#	impressao da msg para usuario
	li $v0, 4
	la $a0, msgInput2
	syscall

	

#	leitura Preco1
	li $v0, 6
	syscall 
	
	lwc1 $f10, zero		#f10 = 0
	add.s $f4,$f10, $f0	#  f4 = 0 + input
	
#	output teste Preco1
#	add.s $f12,$f1, $f0
#	li $v0, 2
#	syscall
	
#	impressao da mensagem que pede produto
	li $v0, 4
	la $a0, msgInput3
	syscall

	
	li $v0, 5	#input quantidade produto 1
	syscall
	
	add $t6,$0,$v0		#t6 = 0+ v0 (input)
	
	addi $t0, $0, 13	#seta o indice em bytes
	sw $t6, ArrayQtdes($t0)		#joga pro array 
jr $ra

#------------------------------------ Funcões produto 5
FProduto5:
	#impressao da mensagem que pede produto
	li $v0, 4
	la $a0, msgInput
	syscall


	#leitura Produto5
	li $v0, 8	# 8 == Ler String ou char
	la $a0, Produto5
	la $a1, 100
	syscall	


#	impressao da msg para usuario
	li $v0, 4
	la $a0, msgInput2
	syscall

	

#	leitura Preco5
	li $v0, 6
	syscall 
	
	lwc1 $f10, zero		#f10 = 0
	add.s $f5,$f10, $f0	#  f5 = 0 + input
	
#	output teste Preco1
#	add.s $f12,$f1, $f0
#	li $v0, 2
#	syscall
	
#	impressao da mensagem que pede produto
	li $v0, 4
	la $a0, msgInput3
	syscall

	
	li $v0, 5	#input quantidade produto 5
	syscall
	
	add $t7,$0,$v0		#t0 = 0+ v0 (input)

	addi $t0, $0, 17		#seta o indice em bytes	
	sw $t7, ArrayQtdes($t0)		#joga pro array
jr $ra


#----------------- Saída

#registradores "default"
#preco 1 -> f1
#preco 2 -> f2
#preco 3 -> f3
#preco 4 -> f4
#preco 5 -> f5

#Quantidades -> ArrayQtdes
#0.0 (0 em float) -> $f10
#somatorio dos valores -> $f9

pedido:
#---------------------------- primeiro produto
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall	
	
	
	addi $v0,$0, 4	 		#imprimir Valor total do produto
	la $a0, Pedido
	syscall
			
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall				
	
	addi $t0, $0,1
	lw $a0, ArrayQtdes($t0)
	lw $t3, ArrayQtdes($t0)
	li $v0, 1			# imprimir qtde
	syscall	

	addi $v0,$0, 4	 		#imprimir 'x'
	la $a0, X
	syscall

	addi $v0,$0, 4	 		#imprimir nome Produto1
	la $a0, Produto1
	syscall

	addi $v0,$0, 4	 		#imprimir "Valor unitário "
	la $a0, VU
	syscall

	lwc1 $f10, zero			#f10 = 0
	add.s $f12,$f1, $f10		#float de valor unitario
	li $v0, 2
	syscall
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall	
					
	addi $v0,$0, 4	 		#imprimir "Valor total do produto"
	la $a0, VT
	syscall
	
	mtc1 $t3, $f7
	cvt.s.w $f7, $f7
	
	mul.s  $f12, $f1, $f7		#multiplicacao
	li $v0, 2			#imprime float
	syscall
	
	add.s $f9, $f10,$f12		# $f9 vai ter o valor total do primeiro produto
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall


	addi $t1, $0, 1			#num de produtos == 1 		
	beq $t1,$t2, fim		#vê se chegou na qtde certa de produtos
	
#---------------------------segundo produto

	addi $t0, $0, 5
	lw $a0, ArrayQtdes($t0)
	lw $t3, ArrayQtdes($t0)
	li $v0, 1			# imprimir qtde
	syscall	
	
	addi $v0,$0, 4	 		#imprimir 'x'
	la $a0, X
	syscall
	
	addi $v0,$0, 4	 		#imprimir nome Produto2
	la $a0, Produto2
	syscall
		
	addi $v0,$0, 4	 		#imprimir "Valor unitário" 
	la $a0, VU
	syscall

	
	add.s $f12,$f10, $f2		#float de valor unitario
	li $v0, 2
	syscall
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall	
					
	addi $v0,$0, 4	 		#imprimir "Valor total do produto"
	la $a0, VT
	syscall
	
	mtc1 $t3, $f7			#passa a qtde pra float
	cvt.s.w $f7, $f7
	
	mul.s  $f12, $f2, $f7		#multiplicacao
	li $v0, 2			#imprime float
	syscall
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall		
	
	add.s $f9, $f9,$f12		# $f9 vai ter o valor total do primeiro produto
		
	
#--------------------------------------terceiro produto	
	addi $t1, $t1, 1		#num de produtos = 3
	beq $t1,$t2, fim
		
			
	addi $t0, $0, 9
	lw $a0, ArrayQtdes($t0)
	lw $t3, ArrayQtdes($t0)
	li $v0, 1			# imprimir qtde
	syscall	
	
	addi $v0,$0, 4	 		#imprimir 'x'
	la $a0, X
	syscall
	
	addi $v0,$0, 4	 		#imprimir nome Produto2
	la $a0, Produto3
	syscall
		
	addi $v0,$0, 4	 		#imprimir "Valor unitário" 
	la $a0, VU
	syscall

	
	add.s $f12,$f10, $f3		#float de valor unitario
	li $v0, 2
	syscall
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall	
					
	addi $v0,$0, 4	 		#imprimir "Valor total do produto"
	la $a0, VT
	syscall
	
	mtc1 $t3, $f7			#passa a qtde pra float
	cvt.s.w $f7, $f7
	
	mul.s  $f12, $f3, $f7		#multiplicacao
	li $v0, 2			#imprime float
	syscall
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall		
	
	add.s $f9, $f9,$f12		# $f9 vai ter o valor total do primeiro produto
	
	
#--------------------------------------quarto produto		
	addi $t1, $t1, 1		#num de produtos = 4
	beq $t1,$t2, fim
	
	addi $t0, $0, 13
	lw $a0, ArrayQtdes($t0)
	lw $t3, ArrayQtdes($t0)		#passa qtde do 4 produto para t3
	li $v0, 1			# imprimir qtde
	syscall	
	
	addi $v0,$0, 4	 		#imprimir 'x'
	la $a0, X
	syscall
	
	addi $v0,$0, 4	 		#imprimir nome Produto2
	la $a0, Produto4
	syscall
		
	addi $v0,$0, 4	 		#imprimir "Valor unitário" 
	la $a0, VU
	syscall

	
	add.s $f12,$f10, $f4		#float de valor unitario
	li $v0, 2
	syscall
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall	
					
	addi $v0,$0, 4	 		#imprimir "Valor total do produto"
	la $a0, VT
	syscall
	
	mtc1 $t3, $f7			#passa a qtde pra float
	cvt.s.w $f7, $f7
	
	mul.s  $f12, $f4, $f7		#multiplicacao
	li $v0, 2			#imprime float
	syscall
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall	
		
	add.s $f9, $f9,$f12		# $f9 vai ter o valor total do primeiro produto
			
#--------------------------------------quinto produto	
	addi $t1, $t1, 1		#num de produtos = 5
	beq $t1,$t2, fim
	
	addi $t0, $0, 17
	lw $a0, ArrayQtdes($t0)
	lw $t3, ArrayQtdes($t0)
	li $v0, 1			# imprimir qtde
	syscall	
	
	addi $v0,$0, 4	 		#imprimir 'x'
	la $a0, X
	syscall
	
	addi $v0,$0, 4	 		#imprimir nome Produto2
	la $a0, Produto5
	syscall
		
	addi $v0,$0, 4	 		#imprimir "Valor unitário" 
	la $a0, VU
	syscall

	
	add.s $f12,$f10, $f5		#float de valor unitario
	li $v0, 2
	syscall
	
	addi $v0,$0, 4	 		#imprimir \n
	la $a0, bn
	syscall	
					
	addi $v0,$0, 4	 		#imprimir "Valor total do produto"
	la $a0, VT
	syscall
	
	mtc1 $t3, $f7			#passa a qtde pra float
	cvt.s.w $f7, $f7
	
	mul.s  $f12, $f5, $f7		#multiplicacao
	li $v0, 2			#imprime float
	syscall
	
	add.s $f9, $f9,$f12		# $f9 vai ter o valor total do primeiro produto
	fim:
	add.s $f12, $f10,$f9		# $f12 = (sum(valores) ==f9)
	
	
	
	addi $v0,$0, 4	 		#imprimir Valor total do produto
	la $a0, bn
	syscall
	
	
	
	addi $v0,$0, 4	 		#imprimir Valor total do produto
	la $a0, VPd
	syscall
	
	li $v0, 2			#imprime float
	syscall
	
jr $ra
