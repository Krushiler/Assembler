%macro pushd 0
    push rax
    push rbx
    push rcx
    push rdx
    push rbp
%endmacro

%macro popd 0
    pop rdx
    pop rcx
    pop rbx
    pop rax
    pop rbp
%endmacro

section .data
    array1 dq 5, 3, 2, 6, 1, 7, 4
    array2 dq 0, 10, 1, 9, 2, 8, 5
    array_len dq ($ - array1) / 16
    format db "%lf", 10, 0

section .text
    global main
    extern printf

main:
read_file:
    xor rax, rax    ; sum
    xor rdx, rdx    ; index
    xor rsi, rsi    ; item
read_loop:
    cmp rdx, [array_len]
    jge calculate
    mov rsi, [array1 + rdx * 8]
    sub rsi, [array2 + rdx * 8]

iterate:
    add rax, rsi
    add rdx, 1
    jmp read_loop

calculate:
    movq xmm0, rdi
    mov rcx, rdx
    cvtsi2sd xmm0, rax
    cvtsi2sd xmm1, rcx
    mov rdx, 0
    divsd xmm0, xmm1

print:
    pushd
    mov rdi, format
    mov rax, 1
    call printf
    popd

end:
    ret
    xor rdx, rdx
    xor rsi, rsi
    xor rbp, rbp
    mov rax, 60
    xor rdi, rdi
    syscall