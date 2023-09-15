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
    format db "Root: %lf", 10, 0
    input_message db "Input: ", 0
    input_format db "%lf", 0
    num dq 0.0
    result dq 0.0

section .text
    global main
    extern printf, scanf

main:
    pushd
    mov rdi, input_message
    call printf
    popd

    pushd
    mov rdi, input_format
    mov rsi, num
    call scanf
    popd

    movq xmm0, qword [num]
    sqrtsd xmm0, xmm0
    movq qword [result], xmm0

    pushd
    mov rdi, format
    mov rax, 1
    call printf
    popd

    pop rbp
    mov rax, 60
    xor rdi, rdi
    syscall
