# Stack Calculator (x86 Assembly, NASM)

---

## Description

This project is a simple interactive **stack-based calculator** written in **x86 Assembly (NASM)**.

The calculator operates using a fixed-size stack and processes commands entered by the user. It performs arithmetic operations and stack manipulations using integer values only.

The project demonstrates:

- Low-level programming in x86 Assembly
- Stack memory management
- Command-based input processing
- Arithmetic instruction usage (`mul`, `div`)
- Control flow using jumps and comparisons
- Basic error handling (division by zero)

The program uses the `io.inc` macro library for input and output operations.

---

## Features

- Stack capacity: 1000 integers
- Command-driven interactive interface
- Supports integer arithmetic
- Stack manipulation operations
- Division-by-zero handling
- Print and exit commands

---

## Requirements

- NASM (32-bit mode)
- GCC with 32-bit support
- `io.inc` macro library

---

## Build and Run

### Assemble

```bash
nasm -f elf32 calculator.asm -o calculator.o
```

### Link

```bash
gcc -m32 calculator.o -o calculator
```

### Run

```bash
./calculator
```

---

## Available Commands

| Command | Description |
|----------|------------|
| `~` | Push (read integer and push onto stack) |
| `!` | Pop (remove top element) |
| `^` | Duplicate top element |
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `/` | Division |
| `%` | Remainder (modulo) |
| `=` | Print top element |
| `.` | Exit program |

---

## How It Works

### Stack Structure

- `stack` — array of 1000 integers
- `p` — stack pointer (tracks number of elements)

### Main Loop

1. Read command using `GET_CHAR`
2. Compare input character
3. Jump to corresponding operation
4. Execute operation
5. Return to command loop

---

## Example

### Input

```
~ 5
~ 3
+
=
.
```

### Output

```
8
```

### Execution Steps

1. Push 5 onto stack
2. Push 3 onto stack
3. Add top two values
4. Print result
5. Exit program

---

## Algorithm Explanation & Justification

The calculator uses a **stack-based evaluation model**, where:

- Operands are pushed onto the stack.
- Arithmetic operations pop the top two elements.
- The result is pushed back onto the stack.

This design was chosen because:

- It simplifies expression evaluation.
- It mirrors how CPUs internally manage data.
- It avoids complex parsing logic.
- It is efficient and memory predictable.

Each arithmetic operation follows:

1. Decrease stack pointer (`p`)
2. Load operands from stack
3. Perform operation
4. Store result
5. Update stack pointer

Division includes an explicit check to prevent division by zero.

Time complexity for each operation is constant **O(1)**.

---

## Limitations

- No stack overflow protection
- No stack underflow protection
- Only integer arithmetic supported
- No floating-point operations
- Minimal error messaging

This is an educational project intended to demonstrate low-level programming concepts.

---

## Resources

- Intel x86 Architecture Manual
- NASM documentation
- GCC documentation (32-bit compilation)
- Assembly language tutorials
- Peer discussions and debugging sessions

### AI Usage Disclosure

AI tools were used for:

- Improving README structure and formatting
- Refining explanations of the algorithm
- Proofreading documentation

AI was not used to generate or implement the Assembly source code.

---

## License

Educational use only.
