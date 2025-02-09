section .text
    global _start

_start:
    mov rax, 5       ; Load 5 into rax
    mov rbx, 6       ; Load 6 into rbx
    add rax, rbx     ; Add rbx to rax (rax = 5 + 6)

    mov rdi, rax    ; Move the sum to rdi (exit code)
    mov rax, 60     ; syscall number for exit
    syscall         ; Make syscall to exit
