# Disciplina: Arquitetura e Organização de Processadores 
# Atividade: Avaliação 01 – Programação em Linguagem de Montagem 
# Exercício 03 
# Alunos: Gabriel Toscano e Paulo Martino Hermans

.data   # segmento de dados

newline: .asciiz "\n"
Msg1:    .asciiz "\n\n LEITURA DOS ELEMENTOS DO VETOR: "
Msg21:   .asciiz "\n\n ENTRE COM A["
Msg22:   .asciiz "]: "
Msg3:    .asciiz "\n\n APRESENTAÇÃO DO VETOR LIDO: "
Msg41:  .asciiz "\n\n A["
Msg42:  .asciiz "] =  "
buffer:  .asciiz ""
Array_A: .word 0, 0, 0, 0, 0, 0, 0, 0   # criação do vetor


.text   # segmento de código

main:  
      li $s3, 0            # $s3 inicia o contador em 0.
      la $s4, Array_A      # $s4 contem o endereço base de A[].

      # PRINT_STRING
      li  $v0, 4              
      la  $a0, Msg1             
      syscall

loopLeitura:
      beq $s3, 8, mensagem
      sll $t1, $s3, 2	      # desloca os bits duas casas a esquerda
      add $t1, $t1, $s4        # $t1 = end.base + 4.i (deslocamento) = end. de A[i]
      la $a0, Msg21
      li $v0, 4
      syscall
      la $a0, ($s3)
      li $v0, 1
      syscall
      la $a0, Msg22
      li $v0, 4
      syscall
      li $v0, 5
      syscall
      sw  $v0, 0($t1)        # A[i] = $v0
      addi $s3, $s3, 1       # i = i + 1
      j   loopLeitura

mensagem:
      # PRINT_STRING
      li  $v0, 4               
      la  $a0, Msg3
      syscall
      li $s3, 0

loopSaida:
      beq $s3, 8, Exit
      sll $t1, $s3, 2	     # desloca os bits duas casas a esquerda
      add $t1, $t1, $s4       # $t1 = end.base + 4.i (deslocamento) = end. de A[i]
      la $a0, Msg41
      li $v0, 4
      syscall
      la $a0, ($s3)
      li $v0, 1
      syscall
      la $a0, Msg42
      li $v0, 4
      syscall
      lw $a0, 0($t1)
      li $v0, 1
      syscall
      addi $s3, $s3, 1       # i = i + 1
      j   loopSaida
      
Exit: nop
