.section .data

zero:
	.ascii "YES\n"
	zero_len = . - zero

non_zero:
	.ascii "NO\n"
	non_zero_len = . - non_zero

.section .text
	.global _start

_start:
	movl $13, %eax		# syscall_time
	int $0x80

	andl $1, %eax		# module 2
	testl %eax, %eax	# set zero flag

	jz yes
	jmp no

yes:
	movl $zero, %ecx
	movl $zero_len, %edx
	jmp print

no:	
	movl $non_zero, %ecx	
	movl $non_zero_len, %edx
	jmp print

print:
	movl $4, %eax
	movl $1, %ebx

	int $0x80
	
exit_program:
    movl $1, %eax
    movl $0, %ebx

    int $0x80
