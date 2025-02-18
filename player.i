# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "player.h" 1
typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int yVelocity;
    int xVelocity;
    unsigned short color;
} PLAYER;

extern PLAYER player;


void initPlayer();
void drawPlayer();
void updatePlayer();
# 2 "player.c" 2
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
# 25 "gba.h"
extern volatile unsigned short* videoBuffer;
# 35 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 55 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, volatile unsigned short color);
void drawString(int x, int y, char *str, volatile unsigned short color);
# 74 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 114 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 3 "player.c" 2

PLAYER player;


void initPlayer() {
    player.y = 100;
    player.x = 10;
    player.oldy = player.y;
    player.oldx = player.x;
    player.yVelocity = 0;
    player.xVelocity = 0;
    player.color = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
}



void drawPlayer() {
    drawRectangle(player.oldx, player.oldy, 20, 15, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(player.oldx, player.oldy - 10, 20, 15, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));

    drawRectangle(player.x + 6, player.y - 7, 8, 1, player.color);
    drawRectangle(player.x + 4, player.y - 6, 12, 1, player.color);
    drawRectangle(player.x + 3, player.y - 5, 14, 1, player.color);
    drawRectangle(player.x + 2, player.y - 4, 16, 2, player.color);
    drawRectangle(player.x + 1, player.y - 2, 18, 2, player.color);
    drawRectangle(player.x, player.y, 20, 5, player.color);
    drawRectangle(player.x + 1, player.y + 5, 18, 2, player.color);
    drawRectangle(player.x + 2, player.y + 7, 16, 2, player.color);
    drawRectangle(player.x + 3, player.y + 9, 14, 1, player.color);
    drawRectangle(player.x + 4, player.y + 10, 12, 1, player.color);
    drawRectangle(player.x + 6, player.y + 11, 8, 1, player.color);


}

void updatePlayer() {

    if ((~(buttons) & ((1<<6))) && (player.y-1 > 0)) {
        player.yVelocity = -3;
    }
    else if ((~(buttons) & ((1<<7))) && (player.y + 5 < 160 - 1)) {
        player.yVelocity = 3;
    } else {
        player.yVelocity = 0;
    }

    player.oldy = player.y;
    player.y += player.yVelocity;

    if ((~(buttons) & ((1<<5))) && (player.x-1 > 0)) {
        player.xVelocity = -3;
    }
    else if ((~(buttons) & ((1<<4))) && (player.x + 20 < 240 - 1)) {
        player.xVelocity = 3;
    } else {
        player.xVelocity = 0;
    }

    player.oldx = player.x;
    player.x += player.xVelocity;
}
