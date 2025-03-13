.section .data

hello:
	.ascii "Hello World\n"
	hello_len = . - hello

.section .text
	.global _start

_start:

print_message:
	movl $4, %eax
	movl $1, %ebx
	movl $hello, %ecx
	movl $hello_len, %edx

	int $0x80

exit_program:
    movl $1, %eax
    movl $0, %ebx

    int $0x80
