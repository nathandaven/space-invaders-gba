#include <stdlib.h>
#include <stdio.h>
#include "font.h"
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "title.h"
#include "background.h"

// prototypes
void initialize();

// state prototypes
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

// states
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// button variables
unsigned short buttons;
unsigned short oldButtons;

// used for updating score text
char scoreText[41];

int main()
{
    initialize();

    while (1)
    {
        // update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // state machine
        switch (state) {
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
}

// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// Sets up the start state
void goToStart() {

    DMANow(3, titlePal, PALETTE, 256);
    drawFullscreenImage4(titleBitmap);
    
    waitForVBlank();
    flipPage();

    state = START;
}

// Runs every frame of the start state
void start() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {

        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {
    state = GAME;
}

// Runs every frame of the game state
void game() {

    // game
    updateGame();
    drawGame();

    sprintf(scoreText, "Score: %d", score*10);
    drawString4(15, 4, scoreText, WHITEID);
    
    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (player.health == 0) {
        goToLose();
    }

    if (score == ENEMYROWS * ENEMYCOLS) {
        goToWin();
    }
}

// Sets up the pause state
void goToPause() {
    fillScreen4(WHITEID);
    drawString4(105, 75, "PAUSED", BLACKID);

    waitForVBlank();
    flipPage();

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        score = 0;
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    fillScreen4(GREENID);
    drawString4(96, 80, "YOU WIN!", WHITEID);

    waitForVBlank();
    flipPage();

    state = WIN;
}

// Runs every frame of the win state
void win() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        score = 0;
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    fillScreen4(REDID);
    drawString4(96, 80, "YOU LOSE!", WHITEID);

    waitForVBlank();
    flipPage();    

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        score = 0;
        goToStart();         
    }
}