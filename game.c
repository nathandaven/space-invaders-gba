#include "game.h"
#include "myLib.h"
#include "font.h"
#include "text.h"
#include "background.h"
#include "player.h"
#include "enemy.h"

// extern objects and object pools used to optimize game
PLAYER player;
ENEMY enemies[ENEMYROWS][ENEMYCOLS];
SHOT shots[TOTALSHOTS];
BLOCKADE blockades[TOTALBLOCKADES];

// local general variables used by game
int score;
int direction;
int shootTimer;
int shootSpeed;

void initGame() {
    unsigned short colors[NUMCOLORS] = {BLACK, WHITE, RED, GREEN, GRAY};

    // calling in the merged palette
    DMANow(3, backgroundPal, PALETTE, 256);

    // initating all game objects
    initPlayer();
    initEnemies();
    initShots();
    initBlockades();

    // loads the custom colors to end of palette
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

}

// initializes the player
void initPlayer() {
    player.row = SCREENHEIGHT - 20;
	player.col = SCREENWIDTH / 2;
	player.cdel = 1;
    player.height = 16;
    player.width = 16;
    player.health = 1;
}

// initializes all of the enemies using a 2d array in object pool, for easy formatting purposes
void initEnemies() {
    direction = 1;
    shootSpeed = 40;
    for (int row = 0; row < ENEMYROWS; row++) {
        for (int col = 0; col < ENEMYCOLS; col++) {
            enemies[row][col].row = 20 + (row*18);
            enemies[row][col].col = 32 + (col*40);
            enemies[row][col].cdel = 1;
            enemies[row][col].height = 16;
            enemies[row][col].width = 16;
            enemies[row][col].active = ACTIVE;
        }
    }
}

// initates all of the shots used by enemies and player into object pool
void initShots() {
    for (int i = 0; i < TOTALSHOTS; i++) {
        shots[i].row = 0;
        shots[i].col = 0;
        shots[i].cdel = 2;
        shots[i].height = 2;
        shots[i].width = 2;
        shots[i].color = WHITEID;
        shots[i].active = INACTIVE;
    }
}

// initalizes the four blockades for the player into object pool
void initBlockades() {
    for (int i = 0; i < TOTALBLOCKADES; i++) {
        blockades[i].row = SCREENHEIGHT - 40;
        blockades[i].originalRow = blockades[i].row;
        blockades[i].col = 34 + (i*50);
        blockades[i].cdel = 2;
        blockades[i].height = 10;
        blockades[i].originalHeight = blockades[i].height;
        blockades[i].width = 20;
        blockades[i].color = GRAYID;
        blockades[i].active = ACTIVE;
        blockades[i].health = 4;
    }
}

// seperate shooting method that can be used for both enemies and players based on shotType
void shootShot(int shotType, int col, int row) {
    for (int i = 0; i < TOTALSHOTS; i++) {
        if (!shots[i].active) {
            shots[i].active = ACTIVE;
            shots[i].shotType = shotType;
            shots[i].col = col + 8;
            shots[i].row = row;
            break;
        }
    }
}

// updates the whole game state
void updateGame() {
    updatePlayer();
    updateEnemies();
    updateShots();
    updateBlockades();
    shootTimer++;

}

// updates the player's variables for controls
void updatePlayer(){
    if (BUTTON_HELD(BUTTON_LEFT) && player.col > 1) {
        player.col -= player.cdel;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player.col < SCREENWIDTH-player.width+1) {
        player.col += player.cdel;
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        shootShot(PLAYERSHOT, player.col, player.row);
    }
}

// updates the enemy variables for movement and randomized shooting
void updateEnemies() {
    for (int col = 0; col < ENEMYCOLS; col++) {
        for (int row = 0; row < ENEMYROWS; row++) {
            if (enemies[row][col].active) {
                // makes difficulty harder after a certain treshold
                if (score == 12) {
                    enemies[row][col].cdel = 2;
                    shootSpeed = 10;
                }

                // checks if enemies reach the player, causing game lose
                if (enemies[row][col].row > SCREENHEIGHT - 50) {
                    player.health = 0;
                }
                
                // checks if hit wall to swap direction, moves down a row if so
                if (enemies[row][col].col <= 0 || enemies[row][col].col+enemies[row][col].width >= (SCREENWIDTH)-1) {
                    direction = direction*-1;
                    moveDownRow();
                    break;
                } else {
                    // moves left or right by direction
                    enemies[row][col].col += direction*enemies[row][col].cdel;
                }
            }
        }
    }

    // shooting arithmetic, bottom most alien shoots at all times
    srand(shootTimer);
    int randCol = (int) rand() % ENEMYCOLS;
    if (shootTimer % shootSpeed == 0) {
        for (int row = ENEMYROWS-1; row >= 0; row--) {
            if (enemies[row][randCol].active) {
                shootShot(ENEMYSHOT, enemies[row][randCol].col, 10 + enemies[row][randCol].row);
                break;
            }
        }
    }
}

// helper method for updateEnemies, performs the full orientation switch when eneimes hit side wall
void moveDownRow() {
    for (int row = 0; row < ENEMYROWS; row++) {
        for (int col = 0; col < ENEMYCOLS; col++) {
            enemies[row][col].row += enemies[row][col].cdel;
        }
    }
    for (int row = 0; row < ENEMYROWS; row++) {
        for (int col = 0; col < ENEMYCOLS; col++) {
            enemies[row][col].col += direction*enemies[row][col].cdel;
        }
    }
}

// updates all shots fired, including collision arithmetic for shots hitting all object types. optimized to improve speed
void updateShots() {
    for (int i = 0; i < TOTALSHOTS; i++) {
        // off screen handling
        if (shots[i].row > SCREENHEIGHT || shots[i].row < 18) {
            shots[i].active = INACTIVE;
        } 

        // arithmetic if shot is shot by an enemy object
        else if (shots[i].shotType == ENEMYSHOT) {
            shots[i].row += shots[i].cdel;

            // case for blockade collision, does damage blockade
            for (int b = 0; b < TOTALBLOCKADES; b++) {
                if(collision(blockades[b].col, blockades[b].row, blockades[b].width, blockades[b].height, shots[i].col,
                    shots[i].row, shots[i].width, shots[i].height) && blockades[b].active && shots[i].active) {
                    shots[i].active = INACTIVE;
                    if (blockades[b].health > 0) {
                        blockades[b].health -= 1;
                    } else {
                        blockades[b].health = 0;
                    }
                }
            }

            // case for shots hitting player, kills player and triggers game over
            if(collision(shots[i].col, shots[i].row, shots[i].width, shots[i].height, player.col, player.row,
                player.width, player.height) && shots[i].active) {
                    shots[i].active = INACTIVE;
                    player.health = 0;
            }
        } 

        // arithmetic if shot is shot by the player
        else {
            shots[i].row -= shots[i].cdel;

            // case for collision with enemy object
            for (int row = 0; row < ENEMYROWS; row++) {
                for (int col = 0; col < ENEMYCOLS; col++) {
                    if(collision(enemies[row][col].col, enemies[row][col].row, enemies[row][col].width, enemies[row][col].height,
                        shots[i].col, shots[i].row, shots[i].width, shots[i].height) && enemies[row][col].active && shots[i].active) {
                        enemies[row][col].active = INACTIVE;
                        score++;
                        shots[i].active = INACTIVE;
                    }
                }
            }

            // case for blockade collision, doesn't damage blockade
            for (int b = 0; b < TOTALBLOCKADES; b++) {
                if(collision(blockades[b].col, blockades[b].row, blockades[b].width, blockades[b].height,
                    shots[i].col, shots[i].row, shots[i].width, shots[i].height) && blockades[b].active && shots[i].active) {
                    shots[i].active = INACTIVE;
                    //break;
                }
            }
        }
    }
}

// updates variabels for blockade objects. blockades have 4 health, shrink as they lose health, and disappear when destroyed
void updateBlockades() {
    for (int i = 0; i < TOTALBLOCKADES; i++) {
        if (blockades[i].active && blockades[i].health < 4) {
            if (blockades[i].health == 3) { // case for 3 health
                blockades[i].height = blockades[i].originalHeight * .75;
                blockades[i].row = blockades[i].originalRow + (blockades[i].originalHeight - blockades[i].height);
            } else if (blockades[i].health == 2) { // case for 2 heatlh
                blockades[i].height = blockades[i].originalHeight * .5;
                blockades[i].row = blockades[i].originalRow + (blockades[i].originalHeight - blockades[i].height);
            } else if (blockades[i].health == 1) { //case for 1 health
                blockades[i].height = blockades[i].originalHeight * .25;
                blockades[i].row = blockades[i].originalRow + (blockades[i].originalHeight - blockades[i].height);
            } else { // destorys blockade when out of health
                blockades[i].color = BLACKID;
                blockades[i].active = INACTIVE;
            }
        }
    }
}

// draws the new variables, for use with page flipping
void drawGame() {
    drawFullscreenImage4(backgroundBitmap);
    drawPlayer();
    drawEnemies();
    drawShots();
    drawBlockades();
}

// draws the player with image
void drawPlayer() {
    drawImage4(player.col, player.row, player.width, player.height, playerBitmap);
}

// draws all of the ACTIVE enemies using the 2d array from pool
void drawEnemies() {
    for (int row = 0; row < ENEMYROWS; row++) {
        for (int col = 0; col < ENEMYCOLS; col++) {
            if(enemies[row][col].active) {
                drawImage4(enemies[row][col].col, enemies[row][col].row, enemies[row][col].width,
                    enemies[row][col].height, enemyBitmap);
            }
        }
    }
}

// draws all of the ACTIVE shots of both player and enemy from pool
void drawShots() {
    for (int i = 0; i < TOTALSHOTS; i++) {
        if (shots[i].active) {
            drawRect4(shots[i].col, shots[i].row, shots[i].width, shots[i].height, shots[i].color);
        }
    }
}

// draws all of the ACTIVE blockades from pool
void drawBlockades() {
    for (int i = 0; i < TOTALBLOCKADES; i++) {
        if (blockades[i].active) {
            drawRect4(blockades[i].col, blockades[i].row, blockades[i].width, blockades[i].height, blockades[i].color);
        }
    }
}

