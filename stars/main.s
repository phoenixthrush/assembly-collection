.section .data

star:
    .ascii "*"
    star_len = . - star

new_line:
    .ascii "\n"
    new_line_len = . - new_line

.section .text

.global _start

_start:
    movl $10, %esi
    movl %esi, %edi

print_star:
    movl $4, %eax
    movl $1, %ebx
    movl $star, %ecx
    movl $star_len, %edx

    int $0x80

    dec %edi
    jnz print_star

    movl %esi, %edi
    sub $1, %edi

print_line:
    movl $4, %eax
    movl $1, %ebx
    movl $new_line, %ecx
    movl $new_line_len, %edx

    int $0x80

    dec %esi
    jnz print_star

exit_program:
    movl $1, %eax
    movl $0, %ebx

    int $0x80
