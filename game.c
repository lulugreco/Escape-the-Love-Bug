#include "game.h"
#include "gba.h"

PLAYER player;

// initializing the player struct
void initPlayer() {
    player.y = 100;
    player.x = 10;
    player.oldy = player.y;
    player.oldx = player.x;
    player.yVelocity = 0;
    player.xVelocity = 0;
    player.color = YELLOW;
}


// drawing the player
void drawPlayer() {
    //erases the old position
    drawRectangle(player.oldx, player.oldy, 20, 13, RGB(31, 20, 31));
    drawRectangle(player.oldx, player.oldy - 7, 20, 15, RGB(31, 20, 31));
    
    //BODY
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
    //EYES
    drawRectangle(player.x + 6, player.y - 1, 2,3 , BLACK);
    drawRectangle(player.x + 11, player.y - 1, 2, 3, BLACK);
    setPixel(player.x + 5, player.y, BLACK);
    setPixel(player.x + 13, player.y, BLACK);
    //SMILE
    drawRectangle(player.x + 7, player.y + 5, 5,1 , RED);
    drawRectangle(player.x + 8, player.y + 6, 3, 1, MAGENTA);


}

//moves the player based on user input
void updatePlayer() {
    // boundary/button
    if (BUTTON_HELD(BUTTON_UP) && (player.y-1 > 0)) {
        player.yVelocity = -3;
    }
    else if (BUTTON_HELD(BUTTON_DOWN) && (player.y + 5 < SCREENHEIGHT - 1)) {
        player.yVelocity = 3;
    } else {
        player.yVelocity = 0;
    }
    // updating player position based on speed
    player.oldy = player.y;
    player.y += player.yVelocity;

    if (BUTTON_HELD(BUTTON_LEFT) && (player.x-1 > 0)) {
        player.xVelocity = -3;
    }
    else if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + 20 < SCREENWIDTH - 1)) {
        player.xVelocity = 3;
    } else {
        player.xVelocity = 0;
    }
    // updating player position based on speed
    player.oldx = player.x;
    player.x += player.xVelocity;
    

}   

//Initializes the each wall object in the walls array 
void initWall() {
    for (int i = 0; i < 5; i++) {
        if (i == 0) {
            walls[i].x = 40;
        } else {
            walls[i].x = (i + 1) * 40;
        }
        
        if (i % 2)  {
            walls[i].y = 30;
        } else {
            walls[i].y = 0;
        }
        walls[i].color = MAGENTA;
        walls[i].width = 5;
        walls[i].height = 130;
        
    }
}

//this draws each wall in the walls array
void drawWall() {
    
    for(int i = 0; i < 5; i++) {
        drawRectangle(walls[i].x, walls[i].y, walls[i].width, walls[i].height, walls[i].color);
    }
    
}

//initializes the enemy
ENEMY enemy;
void initEnemy() {
    
    enemy.x = 10;
    enemy.y = 10;
    enemy.oldy = enemy.y;
    enemy.oldx = enemy.x;
    enemy.yVelocity = 0;
    enemy.xVelocity = 0;
    enemy.color = RED;
    

}
//draws the enemy
void drawEnemy() {
    //erases old enemy position
    drawRectangle(enemy.oldx, enemy.oldy, 20, 13, RGB(31, 20, 31));
    drawRectangle(enemy.oldx, enemy.oldy - 7, 20, 15, RGB(31, 20, 31));
    //BODY
    drawRectangle(enemy.x + 6, enemy.y - 7, 8, 1, enemy.color);
    drawRectangle(enemy.x + 4, enemy.y - 6, 12, 1, MAGENTA);
    drawRectangle(enemy.x + 3, enemy.y - 5, 14, 1, enemy.color);
    drawRectangle(enemy.x + 2, enemy.y - 4, 16, 2, MAGENTA);
    drawRectangle(enemy.x + 1, enemy.y - 2, 18, 2, enemy.color);
    drawRectangle(enemy.x, enemy.y, 20, 5, MAGENTA);
    drawRectangle(enemy.x + 1, enemy.y + 5, 18, 2, enemy.color);
    drawRectangle(enemy.x + 2, enemy.y + 7, 16, 2, MAGENTA);
    drawRectangle(enemy.x + 3, enemy.y + 9, 14, 1, enemy.color);
    drawRectangle(enemy.x + 4, enemy.y + 10, 12, 1, MAGENTA);
    drawRectangle(enemy.x + 6, enemy.y + 11, 8, 1, enemy.color);

    //EYES
    drawRectangle(enemy.x + 6, enemy.y - 1, 2,3 , BLACK);
    drawRectangle(enemy.x + 11, enemy.y - 1, 2, 3, BLACK);
    setPixel(enemy.x + 5, enemy.y, BLACK);
    setPixel(enemy.x + 13, enemy.y, BLACK);
    //SMILE
    drawRectangle(enemy.x + 7, enemy.y + 5, 5,1 , BLACK);
    drawRectangle(enemy.x + 8, enemy.y + 6, 3, 1, BLACK);

}

//Moves enemy's position automatically
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
//Creates the finish line/ safe area and checks for the player entering it
void drawSafe() {
    drawRectangle(205, 0, 35, 30, GREEN);
    drawString(212, 12, "END", WHITE);

    if(collision(player.x, player.y, 20, 5, 205, 0, 35, 30)) {
        goToWin();
    }

}