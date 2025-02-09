### Guide to Writing and Executing x86-64 Assembly (Intel Syntax)

#### 1. System Call Convention (Linux x86-64)

In Linux x86-64, system calls are made using the `syscall` instruction. The **registers** are used as follows:

- **rax**: System call number
  System call number can be found by running:

```bash
cat /usr/include/x86_64-linux-gnu/asm/unistd_64.h
```

- **rdi**: First argument
- **rsi**: Second argument
- **rdx**: Third argument
- **r10**: Fourth argument
- **r8**: Fifth argument
- **r9**: Sixth argument

**Example:**

```asm
mov rax, 60    ; syscall number for exit
mov rdi, 0     ; exit status code 0
syscall        ; make the syscall
```

---

#### 2. Common Assembly Instructions

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
| **jne/jze**     | Jumps if the ZF value = 0                             |
| **je/jz**       | Jumps if the ZF (flag) value = 1                      |

---

#### 3. Example Program: Adding Two Numbers

Code (add.asm):

---

#### 4. How to Assemble and Run (Kali VM/WSL)

#Step-1 : Save the Program

Save the code above as `add.asm`.

#Step-2: Assemble with NASM

```bash
nasm -f elf64 add.asm -o add.o
```

#Step-3: Link with LD

```bash
ld add.o -o add
```

#Step-4: Run the Program

```bash
./add
```

#Step-5: Check the Exit Status

```bash
echo $?
```

**Expected Output:**

```
11
```

---

#### 5. Running on Online Assemblers

You can also use online assemblers like:

- [Defuse.ca Online Assembler](https://defuse.ca/online-x86-assembler.htm)
- [Rasm.io](https://rasm.io/)

Ensure the platform supports **Intel syntax** and **64-bit** execution.
