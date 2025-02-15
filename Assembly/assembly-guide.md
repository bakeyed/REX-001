### Guide to Writing and Executing x86-64 Assembly (Intel Syntax)

#### 1. Understanding the Sections in Assembly

An assembly program is divided into different sections:

- **`.text` section**: Contains the executable instructions (code) of the program.
- **`.data` section**: Stores initialized global variables (constant or predefined values).
- **`.bss` section**: Reserves space for uninitialized global variables (used when defining variables later at runtime).

Example:

```assembly
section .text   ; Code section
section .data   ; Predefined variables
section .bss    ; Space for uninitialized variables
```

#### 2. The `global _start` Directive

In assembly, execution starts from a predefined entry point. The directive:

```assembly
global _start
```

- Declares `_start` as the program's entry point so that the linker recognizes it.
- `_start` is used because it is the conventional entry point for Linux executables.

#### 3. Making System Calls in Linux (x86-64)

Linux system calls use the `syscall` instruction. The **registers** are used as follows:

| **Register** | **Usage**          |
| ------------ | ------------------ |
| **rax**      | System call number |
| **rdi**      | First argument     |
| **rsi**      | Second argument    |
| **rdx**      | Third argument     |
| **r10**      | Fourth argument    |
| **r8**       | Fifth argument     |
| **r9**       | Sixth argument     |

Example (exit system call):

```assembly
mov rax, 60    ; syscall number for exit
mov rdi, 0     ; exit status code 0
syscall        ; make the syscall
```

#### 4. Example Program: Printing "hello world"

```assembly
global _start

section .text
_start:
    mov rax, 1      ; syscall for write
    mov rdi, 1      ; file descriptor (stdout)
    mov rsi, hello  ; pointer to string
    mov rdx, 12     ; size (11 chars + 1 newline)
    syscall         ; invoke kernel

    mov rax, 60     ; syscall for exit
    mov rdi, 0      ; exit status
    syscall         ; invoke kernel

section .data
hello db "hello world", 10  ; Define string with newline
```

#### 5. Avoiding Segmentation Faults

- The exit syscall (`syscall 60`) is **essential** to properly terminate the program.
- Without an explicit exit, execution may continue into **unintended memory**, causing a **segmentation fault**.

#### 6. Compilation & Execution

```bash
nasm -f elf64 helloworld.asm -o helloworld.o
ld helloworld.o -o helloworld
./helloworld
```

Expected output:

```
hello world
```

#### 7. Useful Assembly Instructions

| **Instruction** | **Description**                                       |
| --------------- | ----------------------------------------------------- |
| **mov**         | Move data between registers or memory.                |
| **add**         | Add two values.                                       |
| **sub**         | Subtract two values.                                  |
| **jmp**         | Unconditional jump to a label.                        |
| **cmp**         | Compare two values (sets flags).                      |
| **test**        | Bitwise AND to set flags (used for condition checks). |
| **call**        | Call a function or procedure.                         |
| **ret**         | Return from a procedure or function.                  |
| **jne/jnz**     | Jump if ZF (zero flag) = 0                            |
| **je/jz**       | Jump if ZF = 1                                        |

#### 8. Running on Online Assemblers

You can use:

- [Defuse.ca Online Assembler](https://defuse.ca/online-x86-assembler.htm)
- [Rasm.io](https://rasm.io/)

Ensure **Intel syntax** and **64-bit execution** are supported.
