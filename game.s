	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #100
	mov	r1, #10
	mov	r2, #0
	mvn	ip, #64512
	ldr	r3, .L3
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	strh	ip, [r3, #24]	@ movhi
	str	r1, [r3]
	str	r1, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L7
	ldr	r6, .L7+4
	sub	sp, sp, #12
	add	r0, r4, #8
	ldr	r5, .L7+8
	ldm	r0, {r0, r1}
	mov	r3, #13
	str	r6, [sp]
	mov	r2, #20
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #12]
	str	r6, [sp]
	ldr	r0, [r4, #8]
	mov	r3, #15
	mov	r2, #20
	sub	r1, r1, #7
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #8
	str	r3, [sp]
	sub	r1, r1, #7
	mov	r3, #1
	add	r0, r0, #6
	mov	lr, pc
	bx	r5
	mov	r6, #0
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #12
	str	r3, [sp]
	sub	r1, r1, #6
	mov	r3, #1
	add	r0, r0, #4
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #14
	str	r3, [sp]
	sub	r1, r1, #5
	mov	r3, #1
	add	r0, r0, #3
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #16
	str	r3, [sp]
	sub	r1, r1, #4
	mov	r3, #2
	add	r0, r0, #2
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #18
	str	r3, [sp]
	sub	r1, r1, #2
	mov	r3, #2
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #24]
	ldr	r1, [r4, #4]
	str	r3, [sp]
	ldr	r0, [r4]
	mov	r3, #5
	mov	r2, #20
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #18
	str	r3, [sp]
	add	r1, r1, #5
	mov	r3, #2
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #16
	str	r3, [sp]
	add	r1, r1, #7
	mov	r3, #2
	add	r0, r0, #2
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #14
	str	r3, [sp]
	add	r1, r1, #9
	mov	r3, #1
	add	r0, r0, #3
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #12
	str	r3, [sp]
	add	r1, r1, #10
	mov	r3, #1
	add	r0, r0, #4
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #24]
	mov	r2, #8
	str	r3, [sp]
	add	r1, r1, #11
	mov	r3, #1
	add	r0, r0, #6
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	mov	r3, #3
	mov	r2, #2
	str	r6, [sp]
	sub	r1, r1, #1
	add	r0, r0, #6
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	mov	r3, #3
	mov	r2, #2
	str	r6, [sp]
	sub	r1, r1, #1
	add	r0, r0, #11
	mov	lr, pc
	bx	r5
	mov	ip, #31
	ldm	r4, {r0, r1}
	ldr	r3, .L7+12
	rsb	r7, r1, r1, lsl #4
	ldr	lr, [r3]
	add	r2, r0, #5
	add	r3, r0, #13
	add	r2, r2, r7, lsl #4
	add	r3, r3, r7, lsl #4
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	strh	r6, [lr, r2]	@ movhi
	add	r1, r1, #5
	strh	r6, [lr, r3]	@ movhi
	mov	r2, #5
	str	ip, [sp]
	mov	r3, #1
	add	r0, r0, #7
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldr	r3, .L7+16
	mov	r2, #3
	str	r3, [sp]
	add	r1, r1, #6
	mov	r3, #1
	add	r0, r0, #8
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.word	32415
	.word	drawRectangle
	.word	videoBuffer
	.word	31775
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L18
	ldrh	r2, [r3]
	ldr	r3, .L18+4
	tst	r2, #64
	ldr	r1, [r3, #4]
	bne	.L10
	cmp	r1, #1
	mvngt	ip, #2
	strgt	ip, [r3, #16]
	addgt	r0, r1, ip
	bgt	.L11
.L10:
	tst	r2, #128
	beq	.L16
.L12:
	mov	ip, #0
	mov	r0, r1
	str	ip, [r3, #16]
.L11:
	tst	r2, #32
	str	r1, [r3, #12]
	str	r0, [r3, #4]
	ldr	r1, [r3]
	bne	.L13
	cmp	r1, #1
	mvngt	r0, #2
	strgt	r0, [r3, #20]
	addgt	r2, r1, r0
	bgt	.L14
.L13:
	tst	r2, #16
	beq	.L17
.L15:
	mov	r0, #0
	mov	r2, r1
	str	r0, [r3, #20]
.L14:
	str	r1, [r3, #8]
	str	r2, [r3]
	bx	lr
.L17:
	cmp	r1, #218
	bgt	.L15
	mov	r0, #3
	str	r0, [r3, #20]
	add	r2, r1, r0
	b	.L14
.L16:
	cmp	r1, #153
	bgt	.L12
	mov	ip, #3
	str	ip, [r3, #16]
	add	r0, r1, ip
	b	.L11
.L19:
	.align	2
.L18:
	.word	buttons
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initWall
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWall, %function
initWall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L28
	mov	r1, #0
	mov	r3, r5
	mov	r4, #5
	mov	lr, #130
	mov	r6, #40
	ldr	ip, .L28+4
.L25:
	cmp	r1, #0
	bne	.L21
	str	r6, [r5]
	str	r1, [r3, #4]
	mov	r1, #1
	strh	ip, [r3, #24]	@ movhi
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	add	r3, r3, #28
.L21:
	add	r2, r1, #1
	tst	r1, #1
	mov	r1, r2
	moveq	r0, #0
	movne	r0, #30
	add	r2, r2, r2, lsl #2
	lsl	r2, r2, #3
	cmp	r1, #5
	strh	ip, [r3, #24]	@ movhi
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	r2, [r3]
	str	r0, [r3, #4]
	add	r3, r3, #28
	bne	.L25
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	walls
	.word	31775
	.size	initWall, .-initWall
	.align	2
	.global	drawWall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWall, %function
drawWall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L34
	ldr	r6, .L34+4
	sub	sp, sp, #8
	add	r5, r4, #140
.L31:
	ldrh	r2, [r4, #24]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #16]
	add	r4, r4, #28
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L31
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	walls
	.word	drawRectangle
	.size	drawWall, .-drawWall
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #10
	mov	r1, #0
	mov	r0, #31
	ldr	r3, .L37
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	strh	r0, [r3, #32]	@ movhi
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	bx	lr
.L38:
	.align	2
.L37:
	.word	enemy
	.size	initEnemy, .-initEnemy
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L41
	ldr	r6, .L41+4
	sub	sp, sp, #12
	add	r0, r4, #8
	ldr	r5, .L41+8
	ldm	r0, {r0, r1}
	mov	r3, #13
	str	r6, [sp]
	mov	r2, #20
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #12]
	str	r6, [sp]
	ldr	r0, [r4, #8]
	mov	r3, #15
	mov	r2, #20
	sub	r1, r1, #7
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #32]
	mov	r6, #0
	str	r3, [sp]
	mov	r2, #8
	mov	r3, #1
	sub	r1, r1, #7
	add	r0, r0, #6
	mov	lr, pc
	bx	r5
	ldr	r7, .L41+12
	ldm	r4, {r0, r1}
	mov	r3, #1
	mov	r2, #12
	str	r7, [sp]
	sub	r1, r1, #6
	add	r0, r0, #4
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #32]
	mov	r2, #14
	str	r3, [sp]
	sub	r1, r1, #5
	mov	r3, #1
	add	r0, r0, #3
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	mov	r3, #2
	mov	r2, #16
	str	r7, [sp]
	sub	r1, r1, #4
	add	r0, r0, #2
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #32]
	mov	r2, #18
	str	r3, [sp]
	sub	r1, r1, #2
	mov	r3, #2
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	mov	r3, #5
	mov	r2, #20
	str	r7, [sp]
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #32]
	mov	r2, #18
	str	r3, [sp]
	add	r1, r1, #5
	mov	r3, #2
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	mov	r3, #2
	mov	r2, #16
	str	r7, [sp]
	add	r1, r1, #7
	add	r0, r0, #2
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #32]
	mov	r2, #14
	str	r3, [sp]
	add	r1, r1, #9
	mov	r3, #1
	add	r0, r0, #3
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	mov	r3, #1
	mov	r2, #12
	str	r7, [sp]
	add	r1, r1, #10
	add	r0, r0, #4
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldrh	r3, [r4, #32]
	mov	r2, #8
	str	r3, [sp]
	add	r1, r1, #11
	mov	r3, #1
	add	r0, r0, #6
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	mov	r3, #3
	mov	r2, #2
	str	r6, [sp]
	sub	r1, r1, #1
	add	r0, r0, #6
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	mov	r3, #3
	mov	r2, #2
	str	r6, [sp]
	sub	r1, r1, #1
	add	r0, r0, #11
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	ldr	ip, .L41+16
	rsb	lr, r1, r1, lsl #4
	add	r2, r0, #5
	add	r3, r0, #13
	ldr	ip, [ip]
	add	r2, r2, lr, lsl #4
	add	r3, r3, lr, lsl #4
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	strh	r6, [ip, r2]	@ movhi
	add	r1, r1, #5
	strh	r6, [ip, r3]	@ movhi
	mov	r2, #5
	mov	r3, #1
	str	r6, [sp]
	add	r0, r0, #7
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r1}
	mov	r3, #1
	mov	r2, #3
	str	r6, [sp]
	add	r1, r1, #6
	add	r0, r0, #8
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	enemy
	.word	32415
	.word	drawRectangle
	.word	31775
	.word	videoBuffer
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L84
	ldr	r3, [r2]
	ldr	r1, [r2, #4]
	cmp	r3, #10
	str	r3, [r2, #8]
	str	r1, [r2, #12]
	bgt	.L44
	cmp	r1, #140
	bgt	.L77
.L75:
	add	r1, r1, #1
	str	r1, [r2, #4]
	bx	lr
.L44:
	cmp	r3, #49
	ble	.L81
	cmp	r3, #50
	bne	.L49
	cmp	r1, #10
	bgt	.L76
	bxne	lr
.L77:
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L49:
	cmp	r3, #89
	ble	.L48
	cmp	r3, #90
	bne	.L52
.L80:
	cmp	r1, #139
	ble	.L75
.L59:
	cmp	r1, #140
	bxne	lr
	b	.L77
.L81:
	cmp	r1, #139
	bgt	.L77
.L48:
	cmp	r1, #10
	beq	.L77
.L52:
	cmp	r3, #129
	ble	.L82
	cmp	r3, #130
	bne	.L55
	cmp	r1, #10
	ble	.L56
.L76:
	sub	r1, r1, #1
	str	r1, [r2, #4]
	bx	lr
.L82:
	cmp	r1, #140
	beq	.L77
.L55:
	cmp	r3, #169
	ble	.L83
	cmp	r3, #170
	beq	.L80
.L58:
	cmp	r3, #209
	ble	.L59
	sub	r0, r3, #210
	rsbs	r3, r0, #0
	adc	r3, r3, r0
	cmp	r1, #10
	movle	r3, #0
	cmp	r3, #0
	bxeq	lr
	b	.L76
.L83:
	cmp	r1, #10
	bne	.L58
	b	.L77
.L56:
	bxne	lr
	b	.L77
.L85:
	.align	2
.L84:
	.word	enemy
	.size	updateEnemy, .-updateEnemy
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"END\000"
	.text
	.align	2
	.global	drawSafe
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSafe, %function
drawSafe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #992
	push	{r4, lr}
	sub	sp, sp, #16
	mov	r3, #30
	mov	r1, #0
	mov	r0, #205
	str	r2, [sp]
	ldr	r4, .L93
	mov	r2, #35
	mov	lr, pc
	bx	r4
	mov	r1, #12
	mov	r0, #212
	ldr	r3, .L93+4
	ldr	r2, .L93+8
	ldr	r4, .L93+12
	mov	lr, pc
	bx	r4
	mov	ip, #30
	mov	r0, #35
	mov	r1, #0
	mov	r2, #205
	ldr	r3, .L93+16
	str	r2, [sp]
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	mov	r2, #20
	ldm	r3, {r0, r1}
	ldr	r4, .L93+20
	mov	r3, #5
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L92
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L92:
	ldr	r3, .L93+24
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	drawRectangle
	.word	32767
	.word	.LC0
	.word	drawString
	.word	player
	.word	collision
	.word	goToWin
	.size	drawSafe, .-drawSafe
	.comm	enemy,36,4
	.comm	player,28,4
	.comm	walls,140,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
