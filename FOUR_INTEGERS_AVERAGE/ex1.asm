#Disciplina: Arquitetura e Organização de Processadores 
#Atividade: Avaliação 01 – Programação em Linguagem de Montagem 
#Exercício 01
#Alunos: Gabriel Toscano e Paulo Martino Hermans

.data   # segmento de dados

newline:  .asciiz "\n"
Msg1:     .asciiz "\n\n Entre com o valor de W: "
Msg2:     .asciiz "\n\n Entre com o valor de X: "
Msg3:     .asciiz "\n\n Entre com o valor de Y: "
Msg4:     .asciiz "\n\n Entre com o valor de Z: "
Msg5:     .asciiz "\n A média aritmética da soma é igual a: "
buffer:   .asciiz ""


    .text   # segmento de código

main:

# EXEMPLO 1 - Solicitação e leitura de no. inteiro

      # PRINT_STRING
      li  $v0, 4                # chamada 4
      la  $a0, Msg1             # Msg1
      syscall                    

      # READ_INT
      li  $v0, 5                # chamada 5 
      syscall                    
      add $s0, $v0, $0          # salva $v0 em $s0
      
      # PRINT_STRING
      li  $v0, 4                # chamada 4
      la  $a0, Msg2             # Msg2
      syscall                    

      # READ_INT
      li  $v0, 5                # chamada 5 
      syscall                    
      add $s0, $s0, $v0          # salva $v0 em $s1
      
      # PRINT_STRING
      li  $v0, 4                # chamada 4
      la  $a0, Msg3             # Msg3
      syscall                    

      # READ_INT
      li  $v0, 5                # chamada 5 
      syscall                    
      add $s0, $s0, $v0          # salva $v0 em $s2
      
      # PRINT_STRING
      li  $v0, 4                # chamada 4
      la  $a0, Msg4             # Msg4
      syscall                    

      # READ_INT
      li  $v0, 5                # chamada 5 
      syscall                    
      add $s0, $s0, $v0          # salva $v0 em $s3
      
      srl $s0, $s0, 2		# desloca os bits duas casas a direita
      
      # PRINT_STRING
      li  $v0, 4                # chamada 4
      la  $a0, Msg5             # Msg5
      syscall
      
      li  $v0, 1                # chamada 1
      add  $a0, $zero, $s0      # média aritmética
      syscall
