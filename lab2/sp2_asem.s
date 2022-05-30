.data

str1:
	.string "%d\n"

str2:
	.string "Исходный массив\n"

str3:
	.string "\Преобразованный массив:\n"

arrayI:
	.long -1, 58, -32, 14, -67, 99, -76, 25, 43
arrayI_end:

arrayB:
	.byte -1, 58, -32, 14, -67, 99, -76, 25, 43
arrayB_end:

.text
.global main
.type main, @function

main:
	movl $arrayI, %ebp


	pushl $str2
	call printf

	addl $4, %esp

	jmp ch1_bound

print_original_array:
	xorl %eax, %eax
	movl (%ebp), %eax

	pushl %eax
	pushl $str1
	call printf

	addl $8, %esp
	addl $4, %ebp

ch1_bound:
	cmpl $arrayI_end, %ebp
	jne print_original_array

	pushl $str3
	call printf
	addl $4, %esp

	movl $arrayI, %ebp
	movl $arrayB, %ebx
	jmp ch2_bound


loop_start:	
	xorl %eax, %eax
	movl (%ebp), %eax
	cmp $0, %eax
	jge btr_f
	
	jmp sar_f

ch2_bound:
	cmpl $arrayB_end, %ebx
	jne loop_start

	jmp stop

btr_f:
	xorl %eax, %eax
	movb (%ebx), %al
	
	btrl $0, %eax
	btrl $4, %eax

	pushl %eax
	pushl $str1
	call printf

	addl $8, %esp
	addl $1, %ebx
	addl $4, %ebp

	jmp ch2_bound

sar_f:
	xorl %eax, %eax
	movb (%ebx), %al
	
	sarb $2, %al

	pushl %eax
	pushl $str1
	call printf

	addl $8, %esp

	addl $1, %ebx
	addl $4, %ebp
	
	jmp ch2_bound
	
stop:

ret
