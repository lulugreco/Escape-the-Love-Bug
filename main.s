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
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"ESCAPE THE \000"
	.align	2
.LC0:
	.ascii	"LOVE BUG\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L7
	ldr	r3, .L7+4
	sub	sp, sp, #20
	mov	lr, pc
	bx	r3
	ldr	r1, .L7+8
	ldm	r1, {r0, r1}
	add	r3, sp, #8
	mov	r5, r3
	mov	r4, #72
	mov	r2, #76
	stm	r3, {r0, r1}
	ldr	r7, .L7+12
	ldr	r6, .L7+16
	b	.L3
.L6:
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	add	r4, r4, #12
.L3:
	mov	r3, r6
	mov	r1, #70
	mov	r0, r4
	mov	lr, pc
	bx	r7
	cmp	r4, #156
	bne	.L6
	ldr	r5, .L7+20
	mov	r1, #50
	mov	r0, #85
	ldr	r3, .L7+16
	ldr	r2, .L7+24
	ldr	r4, .L7+28
	mov	lr, pc
	bx	r4
	ldr	r4, .L7+32
	mov	r3, #3
	mov	r2, #130
	mov	r1, #40
	mov	r0, #55
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #3
	mov	r2, #130
	mov	r1, #85
	mov	r0, #55
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #45
	mov	r2, #3
	mov	r1, #40
	mov	r0, #55
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #45
	mov	r2, #3
	mov	r1, #40
	mov	r0, #182
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L7+36
	str	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	32415
	.word	fillScreen
	.word	.LC0
	.word	drawChar
	.word	32767
	.word	31775
	.word	.LC1
	.word	drawString
	.word	drawRectangle
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L10
	ldr	r3, .L10+4
	strh	r0, [r1]	@ movhi
	ldr	r1, .L10+8
	ldrh	r0, [r3, #48]
	ldr	r3, .L10+12
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L11:
	.align	2
.L10:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L14
	ldr	r0, .L14+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L14+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L15:
	.align	2
.L14:
	.word	fillScreen
	.word	32415
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"You're Paused\000"
	.align	2
.LC3:
	.ascii	"Press Start to Resume\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L18
	sub	sp, sp, #12
	ldr	r0, .L18+4
	ldr	r3, .L18+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L18+12
	mov	r3, r4
	mov	r1, #18
	mov	r0, #70
	ldr	r2, .L18+16
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r1, #40
	mov	r0, #50
	ldr	r2, .L18+20
	mov	lr, pc
	bx	r5
	ldr	r5, .L18+24
	mov	r3, #30
	mov	r2, #10
	mov	r1, #70
	mov	r0, #100
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r2, #10
	mov	r1, #70
	mov	r0, #120
	mov	r3, #30
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	ldr	r3, .L18+28
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L18+32
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	32767
	.word	32415
	.word	fillScreen
	.word	drawString
	.word	.LC2
	.word	.LC3
	.word	drawRectangle
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L32
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L21
	ldr	r2, .L32+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L30
.L21:
	tst	r3, #4
	beq	.L20
	ldr	r3, .L32+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L31
.L20:
	pop	{r4, lr}
	bx	lr
.L30:
	ldr	r3, .L32+12
	ldr	r0, .L32+16
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L32+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	pop	{r4, lr}
	b	goToStart
.L33:
	.align	2
.L32:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32415
	.word	state
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"press start to play again!\000"
	.align	2
.LC4:
	.ascii	"YOU ESCAPED!\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r0, #17
	sub	sp, sp, #20
	ldr	r4, .L39
	mov	lr, pc
	bx	r4
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r0, #10
	mov	lr, pc
	bx	r4
	mov	r0, #10
	mov	lr, pc
	bx	r4
	mov	r0, #992
	ldr	r3, .L39+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L39+8
	ldm	r2, {r0, r1, r2}
	add	r3, sp, #4
	mov	r5, r3
	mov	r4, #60
	mov	ip, #89
	stm	r3, {r0, r1, r2}
	ldr	r7, .L39+12
	ldr	r6, .L39+16
	b	.L36
.L38:
	ldrb	ip, [r5, #1]!	@ zero_extendqisi2
.L36:
	mov	r0, r4
	mov	r2, ip
	mov	r3, r6
	mov	r1, #70
	add	r4, r4, #10
	mov	lr, pc
	bx	r7
	cmp	r4, #180
	bne	.L38
	mov	r1, #120
	mov	r0, #45
	ldr	r2, .L39+20
	ldr	r3, .L39+16
	ldr	r4, .L39+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L39+32
	str	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	playAnalogSound
	.word	fillScreen
	.word	.LC4
	.word	drawChar
	.word	32767
	.word	.LC5
	.word	drawString
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L48
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
.L41:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToStart
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"Wanna try again? Hit Start!\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r0, #8
	sub	sp, sp, #20
	ldr	r3, .L55
	mov	lr, pc
	bx	r3
	mov	r0, #31
	ldr	r3, .L55+4
	mov	lr, pc
	bx	r3
	mov	lr, #0
	ldr	r3, .L55+8
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #4
	stmia	r3!, {r0, r1}
	mov	r4, #75
	mov	ip, #89
	strh	lr, [sp, #14]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r7, .L55+12
	ldr	r6, .L55+16
	add	r5, sp, #4
	b	.L52
.L54:
	ldrb	ip, [r5, #1]!	@ zero_extendqisi2
.L52:
	mov	r0, r4
	mov	r2, ip
	mov	r3, r6
	mov	r1, #70
	add	r4, r4, #10
	mov	lr, pc
	bx	r7
	cmp	r4, #195
	bne	.L54
	mov	r1, #90
	mov	r0, #45
	ldr	r2, .L55+20
	ldr	r3, .L55+16
	ldr	r4, .L55+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L55+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L55+32
	str	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	playAnalogSound
	.word	fillScreen
	.word	.LANCHOR0
	.word	drawChar
	.word	32767
	.word	.LC7
	.word	drawString
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L60
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	updatePlayer
	.word	updateEnemy
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L76
	sub	sp, sp, #20
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+12
	mov	lr, pc
	bx	r3
	mov	r3, #15
	mov	r2, #20
	ldr	r1, .L76+16
	ldr	r5, .L76+20
	ldr	r0, [r1, #4]
	ldr	r1, [r1]
	ldr	r6, .L76+24
	str	r0, [sp, #4]
	str	r1, [sp]
	str	r3, [sp, #12]
	str	r2, [sp, #8]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L74
.L63:
	ldr	r4, .L76+28
	add	r7, r4, #140
.L65:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r2, #20
	mov	r3, #14
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	add	r4, r4, #28
	bne	.L75
.L64:
	cmp	r4, r7
	bne	.L65
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L75:
	bl	goToLose
	b	.L64
.L74:
	bl	goToLose
	b	.L63
.L77:
	.align	2
.L76:
	.word	drawPlayer
	.word	drawEnemy
	.word	drawWall
	.word	drawSafe
	.word	enemy
	.word	player
	.word	collision
	.word	walls
	.size	drawGame, .-drawGame
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+8
	mov	lr, pc
	bx	r3
	bl	drawGame
	ldr	r3, .L85+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L78
	ldr	r3, .L85+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L84
.L78:
	pop	{r4, lr}
	bx	lr
.L84:
	pop	{r4, lr}
	b	goToPause
.L86:
	.align	2
.L85:
	.word	updatePlayer
	.word	updateEnemy
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L89
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	initSound
	.word	initPlayer
	.word	initWall
	.word	initEnemy
	.size	initGame, .-initGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L98
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
	ldr	r3, .L98+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L97
.L91:
	pop	{r4, lr}
	bx	lr
.L97:
	ldr	r3, .L98+12
	ldr	r0, .L98+16
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L98+20
	pop	{r4, lr}
	str	r2, [r3]
	b	initGame
.L99:
	.align	2
.L98:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32415
	.word	state
	.size	start, .-start
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L111
	push	{r4, r7, fp, lr}
	strh	r1, [r3]	@ movhi
	ldr	r4, .L111+4
	ldr	fp, .L111+8
	ldrh	r1, [r4, #48]
	ldr	r5, .L111+12
	ldr	r3, .L111+16
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L111+20
	ldr	r10, .L111+24
	ldr	r9, .L111+28
	ldr	r8, .L111+32
	ldr	r7, .L111+36
.L101:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L102:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L102
.L104:
	.word	.L107
	.word	.L106
	.word	.L105
	.word	.L103
	.word	.L103
.L103:
	mov	lr, pc
	bx	r7
	b	.L101
.L105:
	mov	lr, pc
	bx	r8
	b	.L101
.L106:
	mov	lr, pc
	bx	r9
	b	.L101
.L107:
	mov	lr, pc
	bx	r10
	b	.L101
.L112:
	.align	2
.L111:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	scoreBuffer,41,4
	.comm	NOTES,2,2
	.comm	walls,140,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC6:
	.ascii	"YOU LOST!\000"
	.space	2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
