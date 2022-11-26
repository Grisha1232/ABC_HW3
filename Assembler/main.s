	.intel_syntax noprefix
	.globl	realTh
	.type	realTh, @function
realTh:
	push	rbp				#
	mov	rbp, rsp			#,
	sub	rsp, 16	#,
	movsd	QWORD PTR -8[rbp], xmm0		# x, x
						# ./main.c:10:     return tanh(x);
	mov	rax, QWORD PTR -8[rbp]		# tmp85, x
	movq	xmm0, rax			#, tmp85
	call	tanh@PLT			#
	movsd	QWORD PTR -16[rbp], xmm0	# %sfp,
	fld	QWORD PTR -16[rbp]		# %sfp
	leave	
	ret	
	.size	realTh, .-realTh
	.globl	checkPrecision
	.type	checkPrecision, @function
checkPrecision:
	push	rbp				#
	mov	rbp, rsp			#,
						# ./main.c:14:     long double result = (100 - (curr * 100 / x));
	fld	TBYTE PTR 32[rbp]		# curr
	fld	TBYTE PTR .LC1[rip]		#
	fmulp	st(1), st			#,
						# ./main.c:14:     long double result = (100 - (curr * 100 / x));
	fld	TBYTE PTR 16[rbp]		# x
	fdivp	st(1), st			#,
						# ./main.c:14:     long double result = (100 - (curr * 100 / x));
	fld	TBYTE PTR .LC1[rip]		#
	fsubrp	st(1), st			#,
	fstp	TBYTE PTR -16[rbp]		# result
						# ./main.c:15:     return  result > 0 ? result : result * -1;
	fldz	
	fld	TBYTE PTR -16[rbp]		# result
	fcomip	st, st(1)			#,
	fstp	st(0)				#
	jbe	.L9				#,
						# ./main.c:15:     return  result > 0 ? result : result * -1;
	fld	TBYTE PTR -16[rbp]		# result
	jmp	.L7				#
.L9:
						# ./main.c:15:     return  result > 0 ? result : result * -1;
	fld	TBYTE PTR -16[rbp]		# result
	fchs	
.L7:
						# ./main.c:16: }
	pop	rbp				#
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
	push	rbp				#
	mov	rbp, rsp			#,
	sub	rsp, 208			#,
	mov	DWORD PTR -196[rbp], edi	# argc, argc
	mov	QWORD PTR -208[rbp], rsi	# argv, argv
						# ./main.c:21:     if (argc == 1) {
	cmp	DWORD PTR -196[rbp], 1		# argc,
	jne	.L11				#,
						# ./main.c:25:         srand(time(NULL));
	mov	edi, 0				#,
	call	time@PLT			#
						# ./main.c:25:         srand(time(NULL));
	mov	edi, eax			#, _2
	call	srand@PLT			#
						# ./main.c:26:         printf("How many of random values do you wanna get: ");
	lea	rax, .LC3[rip]			# tmp124,
	mov	rdi, rax			#, tmp124
	mov	eax, 0				#,
	call	printf@PLT			#
						# ./main.c:27:         scanf("%d", &n);
	lea	rax, -164[rbp]			# tmp125,
	mov	rsi, rax			#, tmp125
	lea	rax, .LC4[rip]			# tmp126,
	mov	rdi, rax			#, tmp126
	mov	eax, 0				#,
	call	__isoc99_scanf@PLT		#
						# ./main.c:28:         for (int i = 0; i < n; i++) {
	mov	DWORD PTR -4[rbp], 0		# i,
						# ./main.c:28:         for (int i = 0; i < n; i++) {
	jmp	.L12				#
.L13:
						# ./main.c:29:             double x = rand() % 2;
	call	rand@PLT			#
						# ./main.c:29:             double x = rand() % 2;
	cdq
	shr	edx, 31				# tmp128,
	add	eax, edx			# tmp129, tmp128
	and	eax, 1				# tmp130,
	sub	eax, edx			# tmp131, tmp128
						# ./main.c:29:             double x = rand() % 2;
	pxor	xmm0, xmm0			# tmp132
	cvtsi2sd	xmm0, eax		# tmp132, _4
	movsd	QWORD PTR -144[rbp], xmm0	# x, tmp132
						# ./main.c:30:             x += (rand() % 5707) / 10000.;
	call	rand@PLT			#
						# ./main.c:30:             x += (rand() % 5707) / 10000.;
	movsx	rdx, eax			# tmp133, _5
	imul	rdx, rdx, 1541281413		# tmp134, tmp133,
	shr	rdx, 32				# tmp135,
	sar	edx, 11				# tmp136,
	mov	ecx, eax			# tmp137, _5
	sar	ecx, 31				# tmp137,
	sub	edx, ecx			# _6, tmp137
	imul	ecx, edx, 5707			# tmp138, _6,
	sub	eax, ecx			# _5, tmp138
	mov	edx, eax			# _6, _5
						# ./main.c:30:             x += (rand() % 5707) / 10000.;
	pxor	xmm0, xmm0			# _7
	cvtsi2sd	xmm0, edx		# _7, _6
	movsd	xmm1, QWORD PTR .LC5[rip]	# tmp139,
	divsd	xmm0, xmm1			# _120, tmp139
						# ./main.c:30:             x += (rand() % 5707) / 10000.;
	movsd	xmm1, QWORD PTR -144[rbp]	# tmp141, x
	addsd	xmm0, xmm1			# tmp140, tmp141
	movsd	QWORD PTR -144[rbp], xmm0	# x, tmp140
						# ./main.c:31:             printf("x = %f\n", x);
	mov	rax, QWORD PTR -144[rbp]	# tmp142, x
	movq	xmm0, rax			#, tmp142
	lea	rax, .LC6[rip]			# tmp143,
	mov	rdi, rax			#, tmp143
	mov	eax, 1				#,
	call	printf@PLT			#
						# ./main.c:32:    long double result = th(x);
	mov	rax, QWORD PTR -144[rbp]	# tmp144, x
	movq	xmm0, rax			#, tmp144
	call	th@PLT				#
	fstp	TBYTE PTR -160[rbp]		# result
						# ./main.c:33:     printf("result for th(x) = %Lf\n", result);
	push	QWORD PTR -152[rbp]		# result
	push	QWORD PTR -160[rbp]		# result
	lea	rax, .LC7[rip]			# tmp146,
	mov	rdi, rax			#, tmp146
	mov	eax, 0				#,
	call	printf@PLT			#
	add	rsp, 16				#,
						# ./main.c:34:   printf("result for real th(x) = %Lf\n", realTh(x));
	mov	rax, QWORD PTR -144[rbp]	# tmp147, x
	movq	xmm0, rax			#, tmp147
	call	realTh				#
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	lea	rax, .LC8[rip]			# tmp148,
	mov	rdi, rax			#, tmp148
	mov	eax, 0				#,
	call	printf@PLT			#
	add	rsp, 16				#,
						# ./main.c:35:  printf("precision: %Lf\n\n", checkPrecision(realTh(x), result));
	mov	rax, QWORD PTR -144[rbp]	# tmp149, x
	movq	xmm0, rax			#, tmp149
	call	realTh				#
	push	QWORD PTR -152[rbp]		# result
	push	QWORD PTR -160[rbp]		# result
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	call	checkPrecision			#
	add	rsp, 32				#,
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	lea	rax, .LC9[rip]			# tmp150,
	mov	rdi, rax			#, tmp150
	mov	eax, 0				#,
	call	printf@PLT			#
	add	rsp, 16				#,
						# ./main.c:28:         for (int i = 0; i < n; i++) {
	add	DWORD PTR -4[rbp], 1		# i,
.L12:
						# ./main.c:28:         for (int i = 0; i < n; i++) {
	mov	eax, DWORD PTR -164[rbp]	# n.1_11, n
	cmp	DWORD PTR -4[rbp], eax		# i, n.1_11
	jl	.L13				#,
	jmp	.L14				#
.L11:
						# ./main.c:37:     } else if (argc == 2) {
	cmp	DWORD PTR -196[rbp], 2		# argc,
	jne	.L15				#,
						# ./main.c:38:         if (strcmp(argv[1], "measuring") == 0) {
	mov	rax, QWORD PTR -208[rbp]	# tmp151, argv
	add	rax, 8				# _12,
						# ./main.c:38:         if (strcmp(argv[1], "measuring") == 0) {
	mov	rax, QWORD PTR [rax]		# _13, *_12
	lea	rdx, .LC10[rip]			# tmp152,
	mov	rsi, rdx			#, tmp152
	mov	rdi, rax			#, _13
	call	strcmp@PLT			#
						# ./main.c:38:         if (strcmp(argv[1], "measuring") == 0) {
	test	eax, eax			# _14
	jne	.L16				#,
						# ./main.c:39:             double x = 1.39;
	movsd	xmm0, QWORD PTR .LC11[rip]	# tmp153,
	movsd	QWORD PTR -120[rbp], xmm0	# x, tmp153
						# ./main.c:40:             printf("Testing with x = %f\n", x);
	mov	rax, QWORD PTR -120[rbp]	# tmp154, x
	movq	xmm0, rax			#, tmp154
	lea	rax, .LC12[rip]			# tmp155,
	mov	rdi, rax			#, tmp155
	mov	eax, 1				#,
	call	printf@PLT			#
						# ./main.c:42:             time_t t_start = clock();
	call	clock@PLT			#
	mov	QWORD PTR -128[rbp], rax	# t_start, tmp156
						# ./main.c:43:             for (int i = 0; i < 2000000; i++) {
	mov	DWORD PTR -36[rbp], 0		# i,
						# ./main.c:43:             for (int i = 0; i < 2000000; i++) {
	jmp	.L17				#
.L18:
						# ./main.c:44:                 result = th(x);
	mov	rax, QWORD PTR -120[rbp]	# tmp157, x
	movq	xmm0, rax			#, tmp157
	call	th@PLT				#
	fstp	TBYTE PTR -32[rbp]		# result
						# ./main.c:43:             for (int i = 0; i < 2000000; i++) {
	add	DWORD PTR -36[rbp], 1		# i,
.L17:
						# ./main.c:43:             for (int i = 0; i < 2000000; i++) {
	cmp	DWORD PTR -36[rbp], 1999999	# i,
	jle	.L18				#,
						# ./main.c:46:             time_t t_end = clock();
	call	clock@PLT	#
	mov	QWORD PTR -136[rbp], rax	# t_end, tmp159
						# ./main.c:47:             printf("result for th(x) = %Lf\n", result);
	push	QWORD PTR -24[rbp]		# result
	push	QWORD PTR -32[rbp]		# result
	lea	rax, .LC7[rip]			# tmp160,
	mov	rdi, rax			#, tmp160
	mov	eax, 0				#,
	call	printf@PLT			#
	add	rsp, 16				#,
						# ./main.c:48:             printf("precision: %Lf\n\n", checkPrecision(realTh(x), result));
	mov	rax, QWORD PTR -120[rbp]	# tmp161, x
	movq	xmm0, rax			#, tmp161
	call	realTh				#
	push	QWORD PTR -24[rbp]		# result
	push	QWORD PTR -32[rbp]		# result
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	call	checkPrecision			#
	add	rsp, 32				#,
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	lea	rax, .LC9[rip]			# tmp162,
	mov	rdi, rax			#, tmp162
	mov	eax, 0				#,
	call	printf@PLT			#
	add	rsp, 16				#,
						# printf("\nThe task is done 2000000 times in %f sec\n", (difftime(t_end, t_start)) / 1000000);
	mov	rdx, QWORD PTR -128[rbp]	# tmp163, t_start
	mov	rax, QWORD PTR -136[rbp]	# tmp164, t_end
	mov	rsi, rdx			#, tmp163
	mov	rdi, rax			#, tmp164
	call	difftime@PLT			#
	movq	rax, xmm0			# _17,
						# printf("\nThe task is done 2000000 times in %f sec\n", (difftime(t_end, t_start)) / 1000000);
	movsd	xmm0, QWORD PTR .LC13[rip]	# tmp165,
	movq	xmm3, rax			# _17, _17
	divsd	xmm3, xmm0			# _17, tmp165
	movq	rax, xmm3			# _18, _17
	movq	xmm0, rax			#, _18
	lea	rax, .LC14[rip]			# tmp166,
	mov	rdi, rax			#, tmp166
	mov	eax, 1				#,
	call	printf@PLT			#
						# ./main.c:50:             return 0;
	mov	eax, 0				# _43,
	jmp	.L25				#
.L16:
						# ./main.c:52:         double pi = 3.1415926535;
	movsd	xmm0, QWORD PTR .LC15[rip]	# tmp167,
	movsd	QWORD PTR -88[rbp], xmm0	# pi, tmp167
						# ./main.c:56:         double x = strtod(argv[1], &eptr);
	mov	rax, QWORD PTR -208[rbp]	# tmp168, argv
	add	rax, 8				# _19,
						# ./main.c:56:         double x = strtod(argv[1], &eptr);
	mov	rax, QWORD PTR [rax]		# _20, *_19
	lea	rdx, -176[rbp]			# tmp169,
	mov	rsi, rdx			#, tmp169
	mov	rdi, rax			#, _20
	call	strtod@PLT			#
	movq	rax, xmm0			# tmp170,
	mov	QWORD PTR -96[rbp], rax		# x, tmp170
						# ./main.c:59:         if (x == 0) {
	pxor	xmm0, xmm0			# tmp171
	ucomisd	xmm0, QWORD PTR -96[rbp]	# tmp171, x
	jp	.L20				#,
	pxor	xmm0, xmm0			# tmp172
	ucomisd	xmm0, QWORD PTR -96[rbp]	# tmp172, x
	jne	.L20				#,
						# ./main.c:61:             if (errno == ERANGE)
	call	__errno_location@PLT		#
	mov	eax, DWORD PTR [rax]		# _22, *_21
						# ./main.c:61:             if (errno == ERANGE)
	cmp	eax, 34				# _22,
	jne	.L20				#,
						# ./main.c:62:                 printf("The value provided was out of range\n");
	lea	rax, .LC17[rip]			# tmp173,
	mov	rdi, rax			#, tmp173
	call	puts@PLT			#
.L20:
						# ./main.c:64:         if (x < -pi/2 || x > pi/2) {
	movsd	xmm0, QWORD PTR -88[rbp]	# tmp174, pi
	movq	xmm1, QWORD PTR .LC18[rip]	# tmp175,
	xorpd	xmm0, xmm1			# _23, tmp175
						# ./main.c:64:         if (x < -pi/2 || x > pi/2) {
	movsd	xmm1, QWORD PTR .LC19[rip]	# tmp176,
	divsd	xmm0, xmm1			# _24, tmp176
						# ./main.c:64:         if (x < -pi/2 || x > pi/2) {
	comisd	xmm0, QWORD PTR -96[rbp]	# _24, x
	ja	.L22				#,
						# ./main.c:64:         if (x < -pi/2 || x > pi/2) {
	movsd	xmm0, QWORD PTR -88[rbp]	# tmp177, pi
	movsd	xmm2, QWORD PTR .LC19[rip]	# tmp178,
	movapd	xmm1, xmm0			# tmp177, tmp177
	divsd	xmm1, xmm2			# tmp177, tmp178
						# ./main.c:64:         if (x < -pi/2 || x > pi/2) {
	movsd	xmm0, QWORD PTR -96[rbp]	# tmp179, x
	comisd	xmm0, xmm1			# tmp179, _25
	jbe	.L31				#,
.L22:
						# ./main.c:65:             printf("Incorrect value given\n");
	lea	rax, .LC20[rip]			# tmp180,
	mov	rdi, rax			#, tmp180
	call	puts@PLT			#
						# ./main.c:66:             return 1;
	mov	eax, 1				# _43,
	jmp	.L25				#
.L31:
						# ./main.c:68:         long double result = th(x);
	mov	rax, QWORD PTR -96[rbp]		# tmp181, x
	movq	xmm0, rax			#, tmp181
	call	th@PLT				#
	fstp	TBYTE PTR -112[rbp]		# result
						# ./main.c:69:         printf("result for th(x) = %Lf\n", result);
	push	QWORD PTR -104[rbp]		# result
	push	QWORD PTR -112[rbp]		# result
	lea	rax, .LC7[rip]			# tmp183,
	mov	rdi, rax			#, tmp183
	mov	eax, 0				#,
	call	printf@PLT			#
	add	rsp, 16				#,
						# ./main.c:70:         printf("result for real th(x) = %Lf\n", realTh(x));
	mov	rax, QWORD PTR -96[rbp]		# tmp184, x
	movq	xmm0, rax			#, tmp184
	call	realTh				#
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	lea	rax, .LC8[rip]			# tmp185,
	mov	rdi, rax			#, tmp185
	mov	eax, 0				#,
	call	printf@PLT			#
	add	rsp, 16				#,
						# ./main.c:71:         printf("precision: %Lf\n\n", checkPrecision(realTh(x), result));
	mov	rax, QWORD PTR -96[rbp]		# tmp186, x
	movq	xmm0, rax			#, tmp186
	call	realTh				#
	push	QWORD PTR -104[rbp]		# result
	push	QWORD PTR -112[rbp]		# result
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	call	checkPrecision			#
	add	rsp, 32				#,
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	lea	rax, .LC9[rip]			# tmp187,
	mov	rdi, rax			#, tmp187
	mov	eax, 0				#,
	call	printf@PLT			#
	add	rsp, 16				#,
	jmp	.L14				#
.L15:
						# ./main.c:72:     } else if (argc == 3) {
	cmp	DWORD PTR -196[rbp], 3		# argc,
	jne	.L14				#,
						# ./main.c:75:         if ((input = fopen(argv[1], "r"))!= NULL) {
	mov	rax, QWORD PTR -208[rbp]	# tmp188, argv
	add	rax, 8				# _29,
						# ./main.c:75:         if ((input = fopen(argv[1], "r"))!= NULL) {
	mov	rax, QWORD PTR [rax]		# _30, *_29
	lea	rdx, .LC21[rip]			# tmp189,
	mov	rsi, rdx			#, tmp189
	mov	rdi, rax			#, _30
	call	fopen@PLT			#
	mov	QWORD PTR -48[rbp], rax		# input, tmp190
						# ./main.c:75:         if ((input = fopen(argv[1], "r"))!= NULL) {
	cmp	QWORD PTR -48[rbp], 0		# input,
	je	.L26				#,
						# ./main.c:76:             fclose(input);
	mov	rax, QWORD PTR -48[rbp]		# tmp191, input
	mov	rdi, rax			#, tmp191
	call	fclose@PLT			#
						# ./main.c:77:             printf("The input file doesn't exist\n");
	lea	rax, .LC22[rip]			# tmp192,
	mov	rdi, rax			#, tmp192
	call	puts@PLT			#
						# ./main.c:78:             return 1;
	mov	eax, 1				# _43,
	jmp	.L25				#
.L26:
						# ./main.c:81:         if ((output = fopen(argv[2], "w")) != NULL) {
	mov	rax, QWORD PTR -208[rbp]	# tmp193, argv
	add	rax, 16				# _31,
						# ./main.c:81:         if ((output = fopen(argv[2], "w")) != NULL) {
	mov	rax, QWORD PTR [rax]		# _32, *_31
	lea	rdx, .LC23[rip]			# tmp194,
	mov	rsi, rdx			#, tmp194
	mov	rdi, rax			#, _32
	call	fopen@PLT			#
	mov	QWORD PTR -56[rbp], rax		# output, tmp195
						# ./main.c:81:         if ((output = fopen(argv[2], "w")) != NULL) {
	cmp	QWORD PTR -56[rbp], 0		# output,
	je	.L28				#,
						# ./main.c:82:             fclose(output);
	mov	rax, QWORD PTR -56[rbp]		# tmp196, output
	mov	rdi, rax			#, tmp196
	call	fclose@PLT			#
						# ./main.c:83:             printf("The output file doesn't exist\n");
	lea	rax, .LC24[rip]			# tmp197,
	mov	rdi, rax			#, tmp197
	call	puts@PLT			#
						# ./main.c:84:             return 1;
	mov	eax, 1				# _43,
	jmp	.L25				#
.L29:
						# ./main.c:88:             fscanf(input, "%lf", &x);
	lea	rdx, -184[rbp]			# tmp198,
	mov	rax, QWORD PTR -48[rbp]		# tmp199, input
	lea	rcx, .LC25[rip]			# tmp200,
	mov	rsi, rcx			#, tmp200
	mov	rdi, rax			#, tmp199
	mov	eax, 0				#,
	call	__isoc99_fscanf@PLT		#
						# ./main.c:89:             long double result = th(x);
	mov	rax, QWORD PTR -184[rbp]	# x.2_33, x
	movq	xmm0, rax			#, x.2_33
	call	th@PLT				#
	fstp	TBYTE PTR -80[rbp]		# result
						# ./main.c:90:             fprintf(output, "result for th(x) = %Lf\n", result);
	mov	rax, QWORD PTR -56[rbp]		# tmp202, output
	push	QWORD PTR -72[rbp]		# result
	push	QWORD PTR -80[rbp]		# result
	lea	rdx, .LC7[rip]			# tmp203,
	mov	rsi, rdx			#, tmp203
	mov	rdi, rax			#, tmp202
	mov	eax, 0				#,
	call	fprintf@PLT			#
	add	rsp, 16				#,
						# ./main.c:91:             fprintf(output, "result for real th(x) = %Lf\n", realTh(x));
	mov	rax, QWORD PTR -184[rbp]	# x.3_34, x
	movq	xmm0, rax			#, x.3_34
	call	realTh				#
	mov	rax, QWORD PTR -56[rbp]		# tmp204, output
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	lea	rdx, .LC8[rip]			# tmp205,
	mov	rsi, rdx			#, tmp205
	mov	rdi, rax			#, tmp204
	mov	eax, 0				#,
	call	fprintf@PLT			#
	add	rsp, 16				#,
						# ./main.c:92:             fprintf(output, "precision: %Lf\n\n", checkPrecision(realTh(x), result));
	mov	rax, QWORD PTR -184[rbp]	# x.4_36, x
	movq	xmm0, rax			#, x.4_36
	call	realTh				#
	push	QWORD PTR -72[rbp]		# result
	push	QWORD PTR -80[rbp]		# result
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	call	checkPrecision			#
	add	rsp, 32				#,
	mov	rax, QWORD PTR -56[rbp]		# tmp206, output
	lea	rsp, -16[rsp]			#,
	fstp	TBYTE PTR [rsp]			#
	lea	rdx, .LC9[rip]			# tmp207,
	mov	rsi, rdx			#, tmp207
	mov	rdi, rax			#, tmp206
	mov	eax, 0				#,
	call	fprintf@PLT			#
	add	rsp, 16				#,
.L28:
						# ./main.c:86:         while (!feof(input)) {
	mov	rax, QWORD PTR -48[rbp]		# tmp208, input
	mov	rdi, rax			#, tmp208
	call	feof@PLT			
						# ./main.c:86:         while (!feof(input)) {
	test	eax, eax			# _39
	je	.L29				#,
						# ./main.c:94:         fclose(input);
	mov	rax, QWORD PTR -48[rbp]		# tmp209, input
	mov	rdi, rax			#, tmp209
	call	fclose@PLT			#
						# ./main.c:95:         fclose(output);
	mov	rax, QWORD PTR -56[rbp]		# tmp210, output
	mov	rdi, rax			#, tmp210
	call	fclose@PLT			#
.L14:
						# ./main.c:97:     return 0;
	mov	eax, 0				# _43,
.L25:
						# ./main.c:98: }
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
