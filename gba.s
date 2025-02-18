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
	.file	"gba.c"
	.text
	.align	2
	.global	drawRectangle
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #8
	ldrh	ip, [sp, #16]
	subs	lr, r3, #0
	strh	ip, [sp, #6]	@ movhi
	ble	.L1
	mov	ip, #67108864
	mov	r4, #0
	ldr	r3, .L8
	add	lr, lr, r1
	ldr	r3, [r3]
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	lr, r0, lr, lsl #4
	add	r0, r0, r1, lsl #4
	orr	r1, r2, #-2130706432
	add	r2, r3, lr, lsl #1
	add	r3, r3, r0, lsl #1
	add	r0, sp, #6
.L3:
	str	r4, [ip, #220]
	str	r0, [ip, #212]
	str	r3, [ip, #216]
	add	r3, r3, #480
	cmp	r3, r2
	str	r1, [ip, #220]
	bne	.L3
.L1:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #67108864
	mov	lr, #0
	sub	sp, sp, #20
	strh	r0, [sp, #6]	@ movhi
	ldr	r0, .L12
	ldrh	r2, [sp, #6]
	ldr	r0, [r0]
	ldr	r1, .L12+4
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #220]
	str	ip, [r3, #212]
	str	r0, [r3, #216]
	str	r1, [r3, #220]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L15:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L15
	mov	r2, #67108864
.L16:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L16
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L24
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L26
.L24:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L26:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L24
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, .L37
	sub	sp, sp, #8
	ldr	lr, [ip]
	rsb	r1, r1, r1, lsl #4
	ldr	ip, .L37+4
	add	r1, r0, r1, lsl #4
	add	r2, r2, r2, lsl #1
	strh	r3, [sp, #6]	@ movhi
	add	lr, lr, r1, lsl #1
	add	ip, ip, r2, lsl #4
	add	r4, r0, #6
.L28:
	mov	r2, lr
	sub	r3, ip, #48
.L30:
	ldrb	r1, [r3]	@ zero_extendqisi2
	cmp	r1, #0
	ldrhne	r1, [sp, #6]
	add	r3, r3, #6
	strhne	r1, [r2]	@ movhi
	cmp	r3, ip
	add	r2, r2, #480
	bne	.L30
	add	r0, r0, #1
	cmp	r0, r4
	add	ip, r3, #1
	add	lr, lr, #2
	bne	.L28
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.word	fontdata+48
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	sub	sp, sp, #8
	cmp	r2, #0
	strh	r3, [sp, #6]	@ movhi
	beq	.L39
	mov	r6, r1
	mov	r4, r0
.L41:
	mov	r0, r4
	mov	r1, r6
	ldrh	r3, [sp, #6]
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L41
.L39:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #2
	add	r0, r0, #67108864
	orr	r3, r3, #-2147483648
	str	lr, [r0, #184]
	str	r1, [r0, #176]
	ldr	lr, [sp], #4
	str	r2, [r0, #180]
	str	r3, [r0, #184]
	bx	lr
	.size	DMANow, .-DMANow
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
