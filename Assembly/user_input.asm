global _start

section .text

_start: 
    prompt: 
        mov rax, 1
        mov rdi, 1
        mov rsi, prompt_msg
        mov rdx, prompt_len
        syscall
    
    read_name:
        mov rax, 0
        mov rdi, 0
        mov rsi, name
        mov rdx, 100
        syscall
        mov rbx, rax            ; store the return value of read (i/p bytes) in unused reg rbx
    
    hello:
        mov rax, 1
        mov rdi, 1
        mov rsi, hello_msg
        mov rdx, hello_len
        syscall

    print_name: 
        mov rax, 1
        mov rdi, 1
        mov rsi, name
        mov rdx, rbx
        syscall

    exit:
        mov rax, 60
        mov rdi, 22
        syscall

section .data
    prompt_msg: db "Enter you name: "
    prompt_len: equ $-prompt_msg
    hello_msg: db "hello, "
    hello_len: equ $-hello_msg

section .bss
      name: resb 100            ; reserve bytes (rsb)