%include "io.inc"

section .bss
	com resd 1
    stack resd 1000
    p resd 1

section .text
global main
main:

read:
    GET_CHAR [com]
    
    mov ecx, '~'
    cmp [com], ecx
    je input
    mov ecx, '!'
    cmp [com], ecx
    je ppop
    mov ecx, '^'
    cmp [com], ecx
    je dup
    mov ecx, '+'
    cmp [com], ecx
    je plus
    mov ecx, '-'
    cmp [com], ecx
    je minus
    mov ecx, '*'
    cmp [com], ecx
    je multiply
    mov ecx, '/'
    cmp [com], ecx
    je division
    mov ecx, '%'
    cmp [com], ecx
    je mod
    mov ecx, '='
    cmp [com], ecx
    je print
    mov ecx, '.'
    cmp [com], ecx
    je end
    jmp read
    
input:
    GET_DEC 4, eax
    call _push
    jmp read
    
_push:  
    mov ecx, [p]
    mov [stack + 4*ecx], eax
    inc ecx
    mov [p], ecx
    ret
    
_pop:   
    mov ecx, [p]
    dec ecx
    mov [p], ecx
    mov eax, [stack + 4*ecx]
    ret
    
ppop:   
    call _pop
    jmp read
    
dup:    
    mov ecx, [p]
    cmp ecx, 0
    je empty
    dec ecx
    mov eax, [stack + 4*ecx]
    call _push
    call _push
    jmp read
    
empty:
    PRINT_STRING 'ERROR'
    jmp read
    
plus:    
    call _pop 
    mov ebx, eax
    call _pop
    add eax, ebx
    call _push
    jmp read
    
minus:  
    call _pop
    mov ebx, eax
    call _pop
    sub eax, ebx
    call _push
    jmp read

multiply:
    call _pop
    mov ebx, eax
    call _pop
    mul ebx
    call _push
    jmp read
    
division:
    call _pop
    mov ebx, eax
    call _pop
    cmp ebx, 0
    je invalid1
    xor edx, edx
    div ebx
    call _push
    jmp read
invalid1:
    PRINT_STRING 'ERROR'
    jmp end
    
mod:    
    call _pop
    mov ebx, eax
    call _pop
    cmp ebx, 0
    je invalid2
    xor edx, edx
    div ebx
    mov eax, edx
    call _push
    jmp read
invalid2:
    PRINT_STRING 'ERROR'
    jmp read
    
print:
    call _pop
    PRINT_DEC 4, eax
    NEWLINE 
    jmp read

end:
    xor eax, eax

    ret
