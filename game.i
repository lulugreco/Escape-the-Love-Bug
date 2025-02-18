# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
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


typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int width;
    int height;
    unsigned short color;
} WALL;


WALL walls[5];


void initWall();
void drawWall();


typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int width;
    int height;
    int yVelocity;
    int xVelocity;
    unsigned short color;
} ENEMY;

extern ENEMY enemy;

void initEnemy();
void drawEnemy();
void updateEnemy();


void drawSafe();
# 2 "game.c" 2
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
# 56 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, volatile unsigned short color);
void drawString(int x, int y, char *str, volatile unsigned short color);
# 75 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 115 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 3 "game.c" 2

PLAYER player;


void initPlayer() {
    player.y = 100;
    player.x = 10;
    player.oldy = player.y;
    player.oldx = player.x;
    player.yVelocity = 0;
    player.xVelocity = 0;
    player.color = (((31) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10);
}



void drawPlayer() {

    drawRectangle(player.oldx, player.oldy, 20, 13, (((31) & 31) | ((20) & 31) << 5 | ((31) & 31) << 10));

    drawRectangle(player.oldx, player.oldy - 7, 20, 15, (((31) & 31) | ((20) & 31) << 5 | ((31) & 31) << 10));

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

    drawRectangle(player.x + 6, player.y - 1, 2,3 , (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    drawRectangle(player.x + 11, player.y - 1, 2, 3, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    (videoBuffer[((player.y) * (240) + (player.x + 5))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    (videoBuffer[((player.y) * (240) + (player.x + 13))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));

    drawRectangle(player.x + 7, player.y + 5, 5,1 , (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    drawRectangle(player.x + 8, player.y + 6, 3, 1, (((31) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));


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




void initWall() {
    for (int i = 0; i < 5; i++) {
        if (i == 0) {
            walls[i].x = 40;
        } else {
            walls[i].x = (i + 1) * 40;
        }

        if (i % 2) {
            walls[i].y = 30;
        } else {
            walls[i].y = 0;
        }
        walls[i].color = (((31) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10);
        walls[i].width = 5;
        walls[i].height = 130;

    }
}


void drawWall() {

    for(int i = 0; i < 5; i++) {
        drawRectangle(walls[i].x, walls[i].y, walls[i].width, walls[i].height, walls[i].color);
    }

}

ENEMY enemy;

void initEnemy() {

    enemy.x = 10;
    enemy.y = 10;
    enemy.oldy = enemy.y;
    enemy.oldx = enemy.x;
    enemy.yVelocity = 0;
    enemy.xVelocity = 0;
    enemy.color = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);


}

void drawEnemy() {
    drawRectangle(enemy.oldx, enemy.oldy, 20, 13, (((31) & 31) | ((20) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(enemy.oldx, enemy.oldy - 7, 20, 15, (((31) & 31) | ((20) & 31) << 5 | ((31) & 31) << 10));

    drawRectangle(enemy.x + 6, enemy.y - 7, 8, 1, enemy.color);
    drawRectangle(enemy.x + 4, enemy.y - 6, 12, 1, (((31) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(enemy.x + 3, enemy.y - 5, 14, 1, enemy.color);
    drawRectangle(enemy.x + 2, enemy.y - 4, 16, 2, (((31) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(enemy.x + 1, enemy.y - 2, 18, 2, enemy.color);
    drawRectangle(enemy.x, enemy.y, 20, 5, (((31) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(enemy.x + 1, enemy.y + 5, 18, 2, enemy.color);
    drawRectangle(enemy.x + 2, enemy.y + 7, 16, 2, (((31) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(enemy.x + 3, enemy.y + 9, 14, 1, enemy.color);
    drawRectangle(enemy.x + 4, enemy.y + 10, 12, 1, (((31) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    drawRectangle(enemy.x + 6, enemy.y + 11, 8, 1, enemy.color);


    drawRectangle(enemy.x + 6, enemy.y - 1, 2,3 , (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    drawRectangle(enemy.x + 11, enemy.y - 1, 2, 3, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    (videoBuffer[((enemy.y) * (240) + (enemy.x + 5))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    (videoBuffer[((enemy.y) * (240) + (enemy.x + 13))] = (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));

    drawRectangle(enemy.x + 7, enemy.y + 5, 5,1 , (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    drawRectangle(enemy.x + 8, enemy.y + 6, 3, 1, (((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));

}

void updateEnemy() {
    enemy.oldx = enemy.x;
    enemy.oldy = enemy.y;

    if (enemy.x <= 10 && enemy.y <= 140) {
        enemy.y++;
    } else if (enemy.x < 50 && enemy.y >= 140) {
        enemy.x++;
    } else if (enemy.x == 50 && enemy.y > 10) {
        enemy.y--;
    } else if (enemy.x < 90 && enemy.y == 10) {
        enemy.x++;
    } else if (enemy.x == 90 && enemy.y < 140) {
        enemy.y++;
    } else if (enemy.x < 130 && enemy.y == 140) {
        enemy.x++;
    } else if (enemy.x == 130 && enemy.y > 10) {
        enemy.y--;
    } else if (enemy.x < 170 && enemy.y == 10) {
        enemy.x++;
    } else if (enemy.x == 170 && enemy.y < 140) {
        enemy.y++;
    } else if (enemy.x < 210 && enemy.y == 140) {
        enemy.x++;
    } else if (enemy.x == 210 && enemy.y > 10) {
        enemy.y--;
    }
}

void drawSafe() {
    drawRectangle(205, 0, 35, 30, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));
    drawString(212, 12, "END", (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));

    if(collision(player.x, player.y, 20, 5, 205, 0, 35, 30)) {
        goToWin();
    }

}
