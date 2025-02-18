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
	.file	"player.c"
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
	mov	ip, #31
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L7
	ldr	r6, .L7+4
	sub	sp, sp, #8
	add	r0, r4, #8
	ldr	r5, .L7+8
	ldm	r0, {r0, r1}
	mov	r3, #15
	mov	r2, #20
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #12]
	ldr	r0, [r4, #8]
	mov	r3, #15
	mov	r2, #20
	str	r6, [sp]
	sub	r1, r1, #10
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
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.word	32767
	.word	drawRectangle
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
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
