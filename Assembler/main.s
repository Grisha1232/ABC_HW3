	.intel_syntax noprefix
	.globl	realTh
	.type	realTh, @function
realTh:
	push	rbp				
	mov	rbp, rsp			
	sub	rsp, 16	
	movsd	QWORD PTR -8[rbp], xmm0		# double x
						# return tanh(x);
	movq	xmm0, QWORD PTR -8[rbp]		# x
	call	tanh@PLT			#
	movsd	QWORD PTR -16[rbp], xmm0	
	fld	QWORD PTR -16[rbp]		
	leave	
	ret	
	.size	realTh, .-realTh
	.globl	checkPrecision
	.type	checkPrecision, @function
checkPrecision:
	push	rbp				
	mov	rbp, rsp			
						# long double result = (100 - (curr * 100 / x));
	fld	TBYTE PTR 32[rbp]		# long double curr
	fld	TBYTE PTR .LC1[rip]		#
	fmulp	st(1), st			
	fld	TBYTE PTR 16[rbp]		
	fdivp	st(1), st			
	fld	TBYTE PTR .LC1[rip]		
	fsubrp	st(1), st			
	fstp	TBYTE PTR -16[rbp]		# long double result
	fldz	
	fld	TBYTE PTR -16[rbp]		
	fcomip	st, st(1)			
	fstp	st(0)				
	jbe	.L9				
	fld	TBYTE PTR -16[rbp]		
	jmp	.L7				
.L9:
	fld	TBYTE PTR -16[rbp]		# result
	fchs	
.L7:
						
	pop	rbp				
	ret	
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
	push	rbp				
	mov	rbp, rsp			
	sub	rsp, 208			
	mov	DWORD PTR -196[rbp], edi	# argc
	mov	QWORD PTR -208[rbp], rsi	# argv
						# if (argc == 1) 
	cmp	DWORD PTR -196[rbp], 1		
	jne	.L11				
						# srand(time(NULL));
	mov	edi, 0				
	call	time@PLT			
						
	mov	edi, eax			
	call	srand@PLT			
						# printf("How many of random values do you wanna get: ");
	lea	rdi, .LC3[rip]			
	mov	eax, 0				
	call	printf@PLT			
						# scanf("%d", &n);
	lea	rsi, -164[rbp]			
	lea	rdi, .LC4[rip]			
	mov	eax, 0				
	call	__isoc99_scanf@PLT		
						# for (int i = 0; i < n; i++) 
	mov	r12d, 0		# int i = 0
						
	jmp	.L12				
.L13:
						# rand() % 2;
	call	rand@PLT			#
						# 
	cdq
	shr	edx, 31				# 
	add	eax, edx			# 
	and	eax, 1				#
	sub	eax, edx			#
						# rand() % 2;
	pxor	xmm0, xmm0			# 
	cvtsi2sd	xmm0, eax		# 
	movsd	QWORD PTR -144[rbp], xmm0	# double x
						
	call	rand@PLT			#
						# (rand() % 5707) / 10000.;
	movsx	rdx, eax			# 
	imul	rdx, rdx, 1541281413		# 
	shr	rdx, 32				# 
	sar	edx, 11				# 
	mov	ecx, eax			# 
	sar	ecx, 31				# 
	sub	edx, ecx			# 
	imul	ecx, edx, 5707			# 
	sub	eax, ecx			# 
	mov	edx, eax			# 
						# (rand() % 5707) / 10000.;
	pxor	xmm0, xmm0			# 
	cvtsi2sd	xmm0, edx		# 
	movsd	xmm1, QWORD PTR .LC5[rip]	# 
	divsd	xmm0, xmm1			# 
						# x += (rand() % 5707) / 10000.;
	movsd	xmm1, QWORD PTR -144[rbp]	# 
	addsd	xmm0, xmm1			# 
	movsd	QWORD PTR -144[rbp], xmm0	# x
	
						# printf("x = %f\n", x);
	movq	xmm0, QWORD PTR -144[rbp]	# x
	lea	rdi, .LC6[rip]			
	mov	eax, 1				
	call	printf@PLT			
						
	movq	xmm0, QWORD PTR -144[rbp]	# x
	call	th@PLT				
	fstp	TBYTE PTR -160[rbp]		# long double result
	
						# printf("result for th(x) = %Lf\n", result);
						
	push	QWORD PTR -152[rbp]		# result
	push	QWORD PTR -160[rbp]		# result
	
	lea	rdi, .LC7[rip]			
	mov	eax, 0				
	call	printf@PLT		
	add	rsp, 16				
						# printf("result for real th(x) = %Lf\n", realTh(x));
	movq	xmm0, QWORD PTR -144[rbp]	# x
	call	realTh				
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	lea	rdi, .LC8[rip]			
	mov	eax, 0				
	call	printf@PLT			
	add	rsp, 16				
						# printf("precision: %Lf\n\n", checkPrecision(realTh(x), result));
	movq	xmm0, QWORD PTR -144[rbp]	# x
	call	realTh				
	push	QWORD PTR -152[rbp]		# result
	push	QWORD PTR -160[rbp]		# result
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	call	checkPrecision			
	add	rsp, 32				
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	lea	rdi, .LC9[rip]			
	mov	eax, 0				
	call	printf@PLT			
	add	rsp, 16				
						
	add	r12d, 1		# i++
.L12:
						
	mov	eax, DWORD PTR -164[rbp]	# n
	cmp	r12d, eax		# i, n
	jl	.L13				
	jmp	.L14				
.L11:
						# if (argc == 2) 
	cmp	DWORD PTR -196[rbp], 2		# argc
	jne	.L15				
						# if (strcmp(argv[1], "measuring") == 0) 
	mov	rax, QWORD PTR -208[rbp]	# argv
	add	rax, 8				# argv[1]
						
	mov	rdi, QWORD PTR [rax]		
	lea	rsi, .LC10[rip]			
	call	strcmp@PLT			
						
	test	eax, eax			
	jne	.L16				
						
	movsd	xmm0, QWORD PTR .LC11[rip]	
	movsd	QWORD PTR -120[rbp], xmm0	# double x = 1.39;
						# printf("Testing with x = %f\n", x);
	movq	xmm0, QWORD PTR -120[rbp]	# x
	lea	rdi, .LC12[rip]			
	mov	eax, 1				
	call	printf@PLT			
						
	call	clock@PLT			
	mov	QWORD PTR -128[rbp], rax	# time_t t_start
	
						# for (int i = 0; i < 2000000; i++) 
	mov	DWORD PTR -36[rbp], 0		# int i = 0
						
	jmp	.L17				
.L18:
						
	movq	xmm0, QWORD PTR -120[rbp]	# x
	call	th@PLT				
	fstp	TBYTE PTR -32[rbp]		# long double result
						
	add	DWORD PTR -36[rbp], 1		# i++
.L17:
						
	cmp	DWORD PTR -36[rbp], 1999999	# i < 2000000
	jle	.L18				
						
	call	clock@PLT	
	mov	QWORD PTR -136[rbp], rax	# time_t t_end 
						# printf("result for th(x) = %Lf\n", result);
	push	QWORD PTR -24[rbp]		# result
	push	QWORD PTR -32[rbp]		# result
	lea	rdi, .LC7[rip]			
	mov	eax, 0				
	call	printf@PLT			
	add	rsp, 16				
						# printf("precision: %Lf\n\n", checkPrecision(realTh(x), result));
	movq	xmm0, QWORD PTR -120[rbp]	# x
	call	realTh				
	push	QWORD PTR -24[rbp]		# result
	push	QWORD PTR -32[rbp]		# result
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	call	checkPrecision			
	add	rsp, 32				
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	lea	rdi, .LC9[rip]			
	mov	eax, 0				
	call	printf@PLT			
	add	rsp, 16				
						# printf("\nThe task is done 2000000 times in %f sec\n", (difftime(t_end, t_start)) / 1000000);
	mov	rsi, QWORD PTR -128[rbp]	# t_start
	mov	rdi, QWORD PTR -136[rbp]	# t_end
	call	difftime@PLT			
	movq	rax, xmm0			
						
	movsd	xmm0, QWORD PTR .LC13[rip]	
	movq	xmm3, rax			
	divsd	xmm3, xmm0			
	movq	rax, xmm3			
	movq	xmm0, rax			
	lea	rdi, .LC14[rip]			
	mov	eax, 1				
	call	printf@PLT			
						# return 0;
	mov	eax, 0				# 
	jmp	.L25				#
.L16:
						
	movsd	xmm0, QWORD PTR .LC15[rip]	
	movsd	QWORD PTR -88[rbp], xmm0	# double pi = 3.1415926535;
						
	mov	rax, QWORD PTR -208[rbp]	# argv
	add	rax, 8				# argv[1]
						
	mov	rdi, QWORD PTR [rax]		# 
	lea	rsi, -176[rbp]			
	call	strtod@PLT			
	movq	rax, xmm0			
	mov	QWORD PTR -96[rbp], rax		# x
						
	pxor	xmm0, xmm0			
	ucomisd	xmm0, QWORD PTR -96[rbp]	
	jp	.L20				
	pxor	xmm0, xmm0			
	ucomisd	xmm0, QWORD PTR -96[rbp]	
	jne	.L20				
						
	call	__errno_location@PLT		
	mov	eax, DWORD PTR [rax]		
						
	cmp	eax, 34				
	jne	.L20				
						# printf("The value provided was out of range\n");
	lea	rdi, .LC17[rip]			
	call	puts@PLT			
.L20:
						# if (x < -pi/2 || x > pi/2) 
	movsd	xmm0, QWORD PTR -88[rbp]	# pi
	movq	xmm1, QWORD PTR .LC18[rip]	
	xorpd	xmm0, xmm1			
						
	movsd	xmm1, QWORD PTR .LC19[rip]	
	divsd	xmm0, xmm1			
						
	comisd	xmm0, QWORD PTR -96[rbp]	# x
	ja	.L22				
						
	movsd	xmm0, QWORD PTR -88[rbp]	# pi
	movsd	xmm2, QWORD PTR .LC19[rip]	
	movapd	xmm1, xmm0			
	divsd	xmm1, xmm2			
						
	movsd	xmm0, QWORD PTR -96[rbp]	# x
	comisd	xmm0, xmm1			
	jbe	.L31				
.L22:
						# printf("Incorrect value given\n");
	lea	rdi, .LC20[rip]			
	call	puts@PLT			
						# return 1;
	mov	eax, 1				# 
	jmp	.L25				#
.L31:
						
	movq	xmm0, QWORD PTR -96[rbp]	# transfer x to func th(x)
	call	th@PLT				
	fstp	TBYTE PTR -112[rbp]		# long double result
						# printf("result for th(x) = %Lf\n", result);
						
	push	QWORD PTR -104[rbp]		# result
	push	QWORD PTR -112[rbp]		# result
	
	lea	rdi, .LC7[rip]			
	mov	eax, 0				
	call	printf@PLT			
	add	rsp, 16				
						# printf("result for real th(x) = %Lf\n", realTh(x));
	movq	xmm0, QWORD PTR -96[rbp]	# x
	call	realTh				
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	lea	rdi, .LC8[rip]			
	mov	eax, 0			
	call	printf@PLT			
	add	rsp, 16				
						# printf("precision: %Lf\n\n", checkPrecision(realTh(x), result));
	movq	xmm0, QWORD PTR -96[rbp]	# x
	call	realTh				
	push	QWORD PTR -104[rbp]		# result
	push	QWORD PTR -112[rbp]		# result
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	call	checkPrecision			
	add	rsp, 32				
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	lea	rdi, .LC9[rip]			
	mov	eax, 0				
	call	printf@PLT			
	add	rsp, 16				
	jmp	.L14				
.L15:
						# if (argc == 3) 
	cmp	DWORD PTR -196[rbp], 3		# argc
	jne	.L14				
						# if ((input = fopen(argv[1], "r"))!= NULL) 
	mov	rax, QWORD PTR -208[rbp]	# argv
	add	rax, 8				# argv[1]
						
	mov	rdi, QWORD PTR [rax]		
	lea	rsi, .LC21[rip]			
	call	fopen@PLT			
	mov	QWORD PTR -48[rbp], rax		# input
						
	cmp	QWORD PTR -48[rbp], 0		# input
	jne	.L26				
						# fclose(input)
	mov	rdi, QWORD PTR -48[rbp]		# input
	call	fclose@PLT			
						# printf("The input file doesn't exist\n");
	lea	rdi, .LC22[rip]			
	call	puts@PLT			
						# return 1;
	mov	eax, 1				# 
	jmp	.L25				#
.L26:
						# if ((output = fopen(argv[2], "w")) != NULL) 
	mov	rax, QWORD PTR -208[rbp]	# argv
	add	rax, 16				# argv[2]
						
	mov	rdi, QWORD PTR [rax]		
	lea	rsi, .LC23[rip]			
	call	fopen@PLT			#
	mov	QWORD PTR -56[rbp], rax		# output
						
	cmp	QWORD PTR -56[rbp], 0		# output
	jne	.L28				
						# fclose(output)
	mov	rdi, QWORD PTR -56[rbp]		# output
	call	fclose@PLT			
						# printf("The output file doesn't exist\n");
	lea	rdi, .LC24[rip]			
	call	puts@PLT			
						# return 1;
	mov	eax, 1				# 
	jmp	.L25				#
.L29:
						# fscanf(input, "%lf", &x);
	lea	rdx, -184[rbp]			# x
	mov	rdi, QWORD PTR -48[rbp]		# input
	lea	rsi, .LC25[rip]			
	mov	eax, 0				
	call	__isoc99_fscanf@PLT		
						
	movq	xmm0, QWORD PTR -184[rbp]	# x
	call	th@PLT				
	fstp	TBYTE PTR -80[rbp]		# long double result
	
						# fprintf(output, "result for th(x) = %Lf\n", result);
	mov	rdi, QWORD PTR -56[rbp]		# output
	push	QWORD PTR -72[rbp]		# result
	push	QWORD PTR -80[rbp]		# result
	lea	rsi, .LC7[rip]			
	mov	eax, 0				
	call	fprintf@PLT			
	add	rsp, 16				
						# fprintf(output, "result for real th(x) = %Lf\n", realTh(x));
	movq	xmm0, QWORD PTR -184[rbp]	# x
	call	realTh				
	mov	rdi, QWORD PTR -56[rbp]		# output
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	lea	rsi, .LC8[rip]			
	mov	eax, 0				
	call	fprintf@PLT			
	add	rsp, 16				
						# fprintf(output, "precision: %Lf\n\n", checkPrecision(realTh(x), result));
	movq	xmm0, QWORD PTR -184[rbp]	# x
	call	realTh				
	push	QWORD PTR -72[rbp]		# result
	push	QWORD PTR -80[rbp]		# result
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	call	checkPrecision			
	add	rsp, 32				
	mov	rdi, QWORD PTR -56[rbp]		# output
	lea	rsp, -16[rsp]			
	fstp	TBYTE PTR [rsp]			
	lea	rsi, .LC9[rip]			
	mov	eax, 0				
	call	fprintf@PLT			
	add	rsp, 16				
.L28:
						# while (!feof(input)) 
	mov	rdi, QWORD PTR -48[rbp]		# input
	call	feof@PLT			
						
	test	eax, eax			
	je	.L29				
						# fclose(input);
	mov	rdi, QWORD PTR -48[rbp]		# input
	call	fclose@PLT			
						# fclose(output);
	mov	rdi, QWORD PTR -56[rbp]		# output
	call	fclose@PLT			
.L14:
						# return 0;
	mov	eax, 0				# 
.L25:
						
	leave	
	ret	
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
