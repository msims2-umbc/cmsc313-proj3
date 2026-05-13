	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
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
.LFB24:
	.cfi_startproc
	leaq	-104(%rsp), %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L17
	movq	%rbx, 56(%rsp)
	movq	%rbp, 64(%rsp)
	movq	%r12, 72(%rsp)
	movq	%r13, 80(%rsp)
	movq	%r14, 88(%rsp)
	movq	%r15, 96(%rsp)
	.cfi_remember_state
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$0, %r15d
	leaq	.LC5(%rip), %r14
	leaq	.LC4(%rip), %r13
	jmp	.L2
.L17:
	.cfi_restore_state
	leaq	.LC2(%rip), %rdi
	call	printf@PLT
	movl	$1, %eax
	jmp	.L1
.L4:
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movzbl	(%rbx,%r12), %esi
	movq	%r14, %rdi
	movl	$0, %eax
	call	printf@PLT
.L5:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L18
.L6:
	cmpq	%rbp, %rbx
	jb	.L4
	movq	%r13, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L5
.L18:
	movl	$124, %edi
	call	putchar@PLT
	movl	$0, %ebx
	jmp	.L10
.L20:
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L8
.L9:
	movl	$46, %edi
	call	putchar@PLT
.L8:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L19
.L10:
	cmpq	%rbp, %rbx
	jnb	.L20
	call	__ctype_b_loc@PLT
	movzbl	16(%rsp,%rbx), %edi
	movzbl	%dil, %edx
	movq	(%rax), %rax
	testb	$64, 1(%rax,%rdx,2)
	je	.L9
	movzbl	%dil, %edi
	call	putchar@PLT
	jmp	.L8
.L19:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	(%r15,%rbp,2), %r15
.L2:
	leaq	16(%rsp), %rdi
	movq	8(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	call	fread@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L21
	movq	%r15, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %ebx
	leaq	16(%rsp), %r12
	jmp	.L6
.L21:
	movq	8(%rsp), %rdi
	call	fclose@PLT
	movl	$0, %eax
	movq	56(%rsp), %rbx
	.cfi_restore 3
	movq	64(%rsp), %rbp
	.cfi_restore 6
	movq	72(%rsp), %r12
	.cfi_restore 12
	movq	80(%rsp), %r13
	.cfi_restore 13
	movq	88(%rsp), %r14
	.cfi_restore 14
	movq	96(%rsp), %r15
	.cfi_restore 15
.L1:
	movq	40(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L22
	leaq	104(%rsp), %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	movq	%rbx, 56(%rsp)
	movq	%rbp, 64(%rsp)
	movq	%r12, 72(%rsp)
	movq	%r13, 80(%rsp)
	movq	%r14, 88(%rsp)
	movq	%r15, 96(%rsp)
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
