	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"binary.out"
.LC2:
	.string	"Unable to open file"
.LC3:
	.string	"%08zx "
.LC4:
	.string	"   "
.LC5:
	.string	"%02x "
.LC6:
	.string	"|"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdx
	leaq	.LC1(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L2
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L15
.L2:
	movq	$0, -56(%rbp)
	jmp	.L4
.L14:
	movq	-56(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -64(%rbp)
	jmp	.L5
.L8:
	movl	-64(%rbp), %eax
	cltq
	cmpq	-40(%rbp), %rax
	jb	.L6
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L7
.L6:
	movl	-64(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	movzbl	%al, %eax
	leaq	.LC5(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
.L7:
	addl	$1, -64(%rbp)
.L5:
	cmpl	$15, -64(%rbp)
	jle	.L8
	movl	$124, %edi
	call	putchar@PLT
	movl	$0, -60(%rbp)
	jmp	.L9
.L13:
	movl	-60(%rbp), %eax
	cltq
	cmpq	-40(%rbp), %rax
	jb	.L10
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L11
.L10:
	call	__ctype_b_loc@PLT
	movq	(%rax), %rdx
	movl	-60(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	movzbl	%al, %eax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$16384, %eax
	testl	%eax, %eax
	je	.L12
	movl	-60(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	putchar@PLT
	jmp	.L11
.L12:
	movl	$46, %edi
	call	putchar@PLT
.L11:
	addl	$1, -60(%rbp)
.L9:
	cmpl	$15, -60(%rbp)
	jle	.L13
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	addq	%rax, -56(%rbp)
	movq	-40(%rbp), %rax
	addq	%rax, -56(%rbp)
.L4:
	movq	-48(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L14
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
.L15:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
