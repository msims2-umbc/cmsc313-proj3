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
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	leaq	.LC1(%rip), %rdi
	movq	%fs:40, %rsi
	movq	%rsi, 24(%rsp)
	leaq	.LC0(%rip), %rsi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L19
	movq	%rbx, 40(%rsp)
	movq	%rbp, 48(%rsp)
	movq	%r12, 56(%rsp)
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	xorl	%r12d, %r12d
	movq	%r13, 64(%rsp)
	.cfi_offset 13, -16
	movq	%rax, %r13
	.p2align 4
	.p2align 3
.L2:
	movq	%r13, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	call	fread@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L20
	movq	%r12, %rsi
	leaq	.LC3(%rip), %rdi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	printf@PLT
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L22:
	leaq	.LC4(%rip), %rdi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf@PLT
	cmpq	$16, %rbx
	je	.L21
.L6:
	cmpq	%rbp, %rbx
	jnb	.L22
	movzbl	(%rsp,%rbx), %esi
	leaq	.LC5(%rip), %rdi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf@PLT
	cmpq	$16, %rbx
	jne	.L6
.L21:
	movl	$124, %edi
	xorl	%ebx, %ebx
	call	putchar@PLT
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L7:
	call	__ctype_b_loc@PLT
	movzbl	(%rsp,%rbx), %edx
	movq	(%rax), %rax
	movq	%rdx, %rdi
	testb	$64, 1(%rax,%rdx,2)
	jne	.L17
	movl	$46, %edi
.L17:
	call	putchar@PLT
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L23
.L10:
	cmpq	%rbp, %rbx
	jb	.L7
	movl	$32, %edi
	addq	$1, %rbx
	call	putchar@PLT
	cmpq	$16, %rbx
	jne	.L10
.L23:
	leaq	.LC6(%rip), %rdi
	leaq	(%r12,%rbp,2), %r12
	call	puts@PLT
	jmp	.L2
.L20:
	movq	%r13, %rdi
	call	fclose@PLT
	movq	40(%rsp), %rbx
	.cfi_restore 3
	movq	48(%rsp), %rbp
	.cfi_restore 6
	xorl	%eax, %eax
	movq	56(%rsp), %r12
	.cfi_restore 12
	movq	64(%rsp), %r13
	.cfi_restore 13
.L1:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L24
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	leaq	.LC2(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L1
.L24:
	movq	%rbx, 40(%rsp)
	movq	%rbp, 48(%rsp)
	movq	%r12, 56(%rsp)
	movq	%r13, 64(%rsp)
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (GNU) 16.1.1 20260430"
	.section	.note.GNU-stack,"",@progbits
