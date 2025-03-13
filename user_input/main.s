.section .data

name:
    .ascii "Enter your name: "
    name_len = . - name

hello:
	.ascii "Hi "
	hello_len = . - hello

.section .bss
	.lcomm buffer, 256

.section .text
	.global _start

_start:

print_message:
	movl $4, %eax
	movl $1, %ebx
	movl $name, %ecx
	movl $name_len, %edx

	int $0x80

read_input:
	movl $3, %eax
	movl $0, %ebx
	movl $buffer, %ecx
	movl $256, %edx

	int $0x80

print_hello:
	movl $4, %eax
	movl $1, %ebx
	movl $hello, %ecx
	movl $hello_len, %edx

	int $0x80

print_name:
	movl $4, %eax
	movl $1, %ebx
	movl $buffer, %ecx
	movl $256, %edx
	
	int $0x80

exit_program:
    movl $1, %eax
    movl $0, %ebx

    int $0x80
