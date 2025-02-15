global _start

section .text
_start: 
    mov rax, 1      ; syscall for write
    mov rdi, 1      ; fd -> stdout
    mov rsi, hello  ; pointer to string
    mov rdx, 12     ; size (11 chars + 1 for newline)
    syscall         ; call the kernel

    mov rax, 60     ; syscall for exit
    mov rdi, 22     ; status code
    syscall 

section .data
    hello db 'hello world', 10  ; Add newline (ASCII 10)
