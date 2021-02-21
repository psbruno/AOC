# material consultado: https://www.youtube.com/watch?v=_toRnXaW_I0

.data
	msgInput: .asciiz "Digite o nome do produto: "
	msgInput2: .asciiz "Insira o valor unitário desse produto: "
	msgInput3: .asciiz "Insira a quantidade desejada deste produto: "
	Quest: .asciiz "Deseja comprar algo a mais? Se sim, digite 1. Caso contrário, digite 0. Resposta: "
	preco1: .float 0.0
	
	Produto1: .space 200
	Produto2: .space 200
	Produto3: .space 200
	Produto4: .space 200
	Produto5: .space 200
	
.text
	#Produto 1 
	jal FProduto1	
	jal FimProduto
	beqz $v0, FimDaCompra	

	#Produto 2 
	jal FProduto1	
	jal FimProduto
	beqz $v0, FimDaCompra	
	
	#Produto 3 
	jal FProduto1	
	jal FimProduto
	beqz $v0, FimDaCompra	
	
	#Produto 4 
	jal FProduto1	
	jal FimProduto
	beqz $v0, FimDaCompra	
	
	#Produto 5 
	jal FProduto1	
	jal FimProduto
	beqz $v0, FimDaCompra		

	
	FimDaCompra:
	
	
	
	
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
	
	add.s $f12,$f1, $f0	#passa o float pro f12
	
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
	
	add $t3,$0,$v0		#t0 = 0+ v0 (input)

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
	
	add.s $f11,$f1, $f0	#passa o float pro f11
	
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
	
	add.s $f10,$f1, $f0	#passa o float pro f10
	
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
	
	add.s $f9,$f1, $f0	#passa o float pro f12
	
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
	
	add.s $f8,$f1, $f0	#passa o float pro f8
	
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

jr $ra
