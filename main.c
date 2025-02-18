#include "gba.h"
#include "print.h"
#include "game.h"
#include "analogSound.h"
#include <stdio.h>

// Function Prototypes
void initialize();
void updateGame();
void drawGame();
void initGame();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();


// Buttons 
unsigned short buttons;
unsigned short oldButtons;


// States
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

int main() {

    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        switch(state) {
            
            case START: 
                start();
                break;
            case GAME: 
                game();
                break;
            case PAUSE: 
                pause();
                break;
            case WIN: 
                win();
                break;
            case LOSE: 
                lose();
                break;

        }

    }

    return 0;

}

// sets up GBA
void initialize()
{
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}

// sets up the start state
void goToStart() {
    fillScreen(RGB(31, 20, 31));


    char letters[8] = {'L', 'O', 'V', 'E', ' ', 'B', 'U', 'G'};
    int col = 72;
    int spacing = 12;
    for(int i = 0; i < 8; i++){
        drawChar(col + (i * spacing), 70, letters[i], WHITE);
    }
    drawString(85, 50, "ESCAPE THE ", WHITE);
    
    drawRectangle(55, 40, 130, 3, MAGENTA);
    drawRectangle(55, 85, 130, 3, MAGENTA);
    drawRectangle(55, 40, 3, 45, MAGENTA);
    drawRectangle(182, 40, 3, 45, MAGENTA);

    state = START;

}

// runs every frame of the start state
void start() {
   
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {        
        goToGame();
        initGame();
    }
}

// sets up the game state
void goToGame() {
    fillScreen(RGB(31, 20, 31));
    
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();

    waitForVBlank();

    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    
}
// sets up the pause state
void goToPause() {
    fillScreen(RGB(31, 20, 31));
    
    drawString(70, 18, "You're Paused", WHITE); 
    drawString(50, 40, "Press Start to Resume", WHITE);
    drawRectangle(100, 70, 10, 30, WHITE);
    drawRectangle(120, 70, 10, 30, WHITE);
    waitForVBlank();
    state = PAUSE;
}
// Runs every frame of the pause state
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
// Plays positive sound when you win
void goToWin() {
    playAnalogSound(17);
    playAnalogSound(16);
    playAnalogSound(10);
    playAnalogSound(10);
    fillScreen(GREEN);
    char letters[12] = {'Y', 'O', 'U', ' ', 'E', 'S', 'C', 'A', 'P', 'E', 'D', '!'};
    int col = 60;
    int spacing = 10;
    for(int i = 0; i < 12; i++){
        drawChar(col + (i * spacing), 70, letters[i], WHITE);
    }
    drawString(45, 120, "press start to play again!", WHITE);
    waitForVBlank();
    state = WIN;
}

// Runs every frame of the win state
void win() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
// Plays negative sound when you lose
void goToLose() {
    playAnalogSound(8);
    

    fillScreen(RED);
    char letters[12] = {'Y', 'O', 'U', ' ', 'L', 'O', 'S', 'T','!'};
    int col = 75;
    int spacing = 10;
    for(int i = 0; i < 12; i++){
        drawChar(col + (i * spacing), 70, letters[i], WHITE);
    }
    drawString(45, 90, "Wanna try again? Hit Start!", WHITE);
    waitForVBlank();
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
void updateGame() {
    updatePlayer();
    updateEnemy();
    
}
//draws each aspect of the game
void drawGame() {
    
    drawPlayer();
    drawEnemy();
    drawWall();
    drawSafe();
    if(collision(player.x, player.y, 20, 15, enemy.x, enemy.y, 20, 15)) {
        goToLose();
    }
    for (int i = 0; i < 5; i++) {
        if (collision(player.x, player.y, 20, 14, walls[i].x, walls[i].y, walls[i].width, walls[i].height)) {
            goToLose();
        }
    }
}
//initializes each aspect of the game
void initGame() {
    initSound();
    initPlayer();
    initWall();
    initEnemy();
}