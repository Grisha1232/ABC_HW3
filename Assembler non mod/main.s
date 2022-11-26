	.file	"main.c"
	.text
	.globl	realTh
	.type	realTh, @function
realTh:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)		# double x
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0		# moves for transport x
	call	tanh@PLT		# call tanh(x)
	movsd	%xmm0, -16(%rbp)
	fldl	-16(%rbp)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	realTh, .-realTh
	.globl	checkPrecision
	.type	checkPrecision, @function
checkPrecision:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	fldt	32(%rbp)
	fldt	.LC1(%rip)
	fmulp	%st, %st(1)
	fldt	16(%rbp)		# -16 = long double result
	fdivrp	%st, %st(1)
	fldt	.LC1(%rip)
	fsubp	%st, %st(1)
	fstpt	-16(%rbp)
	fldz
	fldt	-16(%rbp)
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L9
	fldt	-16(%rbp)
	jmp	.L7
.L9:
	fldt	-16(%rbp)
	fchs
.L7:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	checkPrecision, .-checkPrecision
	.section	.rodata
	.align 8
.LC3:
	.string	"How many of random values do you wanna get: "
.LC4:
	.string	"%d"
.LC6:
	.string	"x = %f\n"
.LC7:
	.string	"result for th(x) = %Lf\n"
.LC8:
	.string	"result for real th(x) = %Lf\n"
.LC9:
	.string	"precision: %Lf\n\n"
.LC10:
	.string	"measuring"
.LC12:
	.string	"Testing with x = %f\n"
	.align 8
.LC14:
	.string	"\nThe task is done 2000000 times in %f sec\n"
	.align 8
.LC17:
	.string	"The value provided was out of range"
.LC20:
	.string	"Incorrect value given"
.LC21:
	.string	"r"
.LC22:
	.string	"The input file doesn't exist"
.LC23:
	.string	"w"
.LC24:
	.string	"The output file doesn't exist"
.LC25:
	.string	"%lf"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movl	%edi, -196(%rbp)		# argc
	movq	%rsi, -208(%rbp)		# argv
	cmpl	$1, -196(%rbp)
	jne	.L11
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-164(%rbp), %rax		# -164 = int n
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -4(%rbp)			# int i = 0
	jmp	.L12
.L13:
	call	rand@PLT
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -144(%rbp)		# -144 = double x
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1541281413, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$11, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$5707, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	movsd	.LC5(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-144(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-144(%rbp), %rax
	movq	%rax, %xmm0
	call	th@PLT
	fstpt	-160(%rbp)		# -160 = long double result
	pushq	-152(%rbp)
	pushq	-160(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movq	-144(%rbp), %rax
	movq	%rax, %xmm0
	call	realTh
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movq	-144(%rbp), %rax
	movq	%rax, %xmm0
	call	realTh
	pushq	-152(%rbp)
	pushq	-160(%rbp)
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	call	checkPrecision
	addq	$32, %rsp
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	addl	$1, -4(%rbp)
.L12:
	movl	-164(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L13
	jmp	.L14
.L11:
	cmpl	$2, -196(%rbp)
	jne	.L15
	movq	-208(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L16
	movsd	.LC11(%rip), %xmm0
	movsd	%xmm0, -120(%rbp)		# -120 = double x = 1.39
	movq	-120(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	call	clock@PLT
	movq	%rax, -128(%rbp)		# start
	movl	$0, -36(%rbp)			# int i = 0
	jmp	.L17
.L18:
	movq	-120(%rbp), %rax
	movq	%rax, %xmm0
	call	th@PLT
	fstpt	-32(%rbp)			# -32 = long double result
	addl	$1, -36(%rbp)
.L17:
	cmpl	$1999999, -36(%rbp)
	jle	.L18
	call	clock@PLT
	movq	%rax, -136(%rbp)		# end
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movq	-120(%rbp), %rax
	movq	%rax, %xmm0
	call	realTh
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	call	checkPrecision
	addq	$32, %rsp
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movq	-128(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	difftime@PLT
	movq	%xmm0, %rax
	movsd	.LC13(%rip), %xmm0
	movq	%rax, %xmm3
	divsd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L25
.L16:
	movsd	.LC15(%rip), %xmm0
	movsd	%xmm0, -88(%rbp)		# double pi
	movq	-208(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-176(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtod@PLT
	movq	%xmm0, %rax
	movq	%rax, -96(%rbp)			# double x
	pxor	%xmm0, %xmm0
	ucomisd	-96(%rbp), %xmm0
	jp	.L20
	pxor	%xmm0, %xmm0
	ucomisd	-96(%rbp), %xmm0
	jne	.L20
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$34, %eax
	jne	.L20
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L20:
	movsd	-88(%rbp), %xmm0
	movq	.LC18(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movsd	.LC19(%rip), %xmm1
	divsd	%xmm1, %xmm0
	comisd	-96(%rbp), %xmm0
	ja	.L22
	movsd	-88(%rbp), %xmm0
	movsd	.LC19(%rip), %xmm2
	movapd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
	movsd	-96(%rbp), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L31
.L22:
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L25
.L31:
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	call	th@PLT
	fstpt	-112(%rbp)			# long double result
	pushq	-104(%rbp)
	pushq	-112(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	call	realTh
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	call	realTh
	pushq	-104(%rbp)
	pushq	-112(%rbp)
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	call	checkPrecision
	addq	$32, %rsp
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	jmp	.L14
.L15:
	cmpl	$3, -196(%rbp)
	jne	.L14
	movq	-208(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -48(%rbp)			# FILE* input
	cmpq	$0, -48(%rbp)
	je	.L26
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L25
.L26:
	movq	-208(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -56(%rbp)			# FILE* output
	cmpq	$0, -56(%rbp)
	je	.L28
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L25
.L29:
	leaq	-184(%rbp), %rdx		# double x
	movq	-48(%rbp), %rax
	leaq	.LC25(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movq	-184(%rbp), %rax
	movq	%rax, %xmm0
	call	th@PLT
	fstpt	-80(%rbp)			# long double result
	movq	-56(%rbp), %rax
	pushq	-72(%rbp)
	pushq	-80(%rbp)
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	movq	-184(%rbp), %rax
	movq	%rax, %xmm0
	call	realTh
	movq	-56(%rbp), %rax
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	movq	-184(%rbp), %rax
	movq	%rax, %xmm0
	call	realTh
	pushq	-72(%rbp)
	pushq	-80(%rbp)
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	call	checkPrecision
	addq	$32, %rsp
	movq	-56(%rbp), %rax
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
.L28:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	feof@PLT
	testl	%eax, %eax
	je	.L29
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L14:
	movl	$0, %eax
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC1:
	.long	0
	.long	-939524096
	.long	16389
	.long	0
	.align 8
.LC5:
	.long	0
	.long	1086556160
	.align 8
.LC11:
	.long	-1546188227
	.long	1073102192
	.align 8
.LC13:
	.long	0
	.long	1093567616
	.align 8
.LC15:
	.long	1413551940
	.long	1074340347
	.align 16
.LC18:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC19:
	.long	0
	.long	1073741824
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
