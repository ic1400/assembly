section .data
    ; [OUTPUT]
    ; -- control -- 
    clear_cmd db "clear", 0

    ; [OUTPUT]
    ; -- welcome message -- 
    hello_world db 'Hello World! Today is weather ☀️', 10, 10, 0
    born_date_msg db 'Enter the date you were born: ', 0
    output_msg db 'The result is: %d', 10, 0
    echo_input_value db "You are %d years old", 10, 0

    ; [INPUT]
    input_format db '%d', 0


section .bss
    input resd 1

section .text
  extern printf
  extern scanf
  extern system

  global main

main:
    push clear_cmd
    call system

    add esp, 4


    push born_date_msg
    call printf

    add esp, 4


    push input
    push input_format
    call scanf

    add esp, 8

    mov eax, [input]
    mov ebx, 2025
    sub ebx, eax


    push ebx
    push echo_input_value
    call printf

    add esp, 8


    ; push hello_world
    ; call printf
    ;
    ; add esp, 4

    ; Perform add operation
    mov eax, 2
    mov ebx, 3
    add eax, ebx

    push eax
    push output_msg
    call printf

    add esp, 8

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
