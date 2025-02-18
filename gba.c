#include "gba.h"
#include "font.h"

volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;

void drawRectangle(int x, int y, int width, int height, volatile unsigned short color) {
    // for (int i = 0; i < width; i++) {
    //     for (int j = 0; j < height; j++) {
    //         setPixel(x + i, y + j, color);
    //     }
    // }
    //TODO: Replace the above implementation by using DMA
    volatile unsigned short colorData = color;
    for (int row = 0; row < height; row++) {
        DMANow(3, &colorData, videoBuffer + (y + row) * SCREENWIDTH + x, width | DMA_16 | DMA_SOURCE_FIXED | DMA_AT_NOW);
    }
}

void fillScreen(volatile unsigned short color) {
    // for (int i = 0; i < 240 * 160; i++) {
    //     videoBuffer[i] = color;
    // }
    //TODO: Replace the above implementation by using DMA
    volatile unsigned short colorData = color;
    DMANow(3, &colorData, videoBuffer, (240*160)| DMA_16 | DMA_SOURCE_FIXED | DMA_AT_NOW);
}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}

// Draws the specified character at the specified location in Mode 3
void drawChar(int x, int y, char ch, volatile unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata[(48 * ch + i + 6 * j)]) {
                setPixel(x + i, y + j, color);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int x, int y, char *str, volatile unsigned short color) {
    int i = 0;
    while (str[i] != '\0') {
        drawChar(x + (i * 6), y, str[i], color);
        i++;
    }
}

// Immediately begins a DMA transfer using parameters
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl) {
    //TODO: Complete the DMANow function 
    DMA[channel].ctrl = 0;
    DMA[channel].src = src;
    DMA[channel].dest = dest;
    DMA[channel].ctrl = ctrl | DMA_ON;
}