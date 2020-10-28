# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
typedef struct {
 int row;
 int col;
 int cdel;
 int height;
 int width;
 int health;
} PLAYER;

typedef struct {
 int row;
 int col;
 int cdel;
 int height;
 int width;
 int active;
} ENEMY;

typedef struct {
 int row;
 int originalRow;
 int col;
 int cdel;
 int height;
 int originalHeight;
 int width;
 int active;
 int health;
 unsigned char color;
} BLOCKADE;

typedef struct {
 int row;
 int col;
 int cdel;
 int height;
 int width;
 int active;
 int shotType;
 unsigned char color;
} SHOT;
# 51 "game.h"
extern PLAYER player;
extern ENEMY enemies[4][5];
extern SHOT shots[6];
extern BLOCKADE blockades[4];
extern int score;
extern int direction;




enum {BLACKID=(256-6), WHITEID, REDID, GREENID, GRAYID};
extern unsigned short colors[6];






void initGame();
void initPlayer();
void initEnemies();
void initShots();
void initBlockades();
void shootShot(int shotType, int x, int y);
void updateGame();
void updatePlayer();
void updateEnemies();
void moveDownRow();
void updateShots();
void updateBlockades();
void drawGame();
void drawPlayer();
void drawEnemies();
void drawShots();
void drawBlockades();
# 2 "game.c" 2
# 1 "myLib.h" 1




typedef unsigned short u16;
# 27 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 57 "myLib.h"
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
# 92 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 102 "myLib.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 143 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 3 "game.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "game.c" 2
# 1 "text.h" 1

void drawChar3(int col, int row, char ch, unsigned short color);
void drawString3(int col, int row, char *str, unsigned short color);


void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);
# 5 "game.c" 2
# 1 "background.h" 1
# 21 "background.h"
extern const unsigned short backgroundBitmap[19200];


extern const unsigned short backgroundPal[256];
# 6 "game.c" 2
# 1 "player.h" 1
# 21 "player.h"
extern const unsigned short playerBitmap[128];


extern const unsigned short playerPal[256];
# 7 "game.c" 2
# 1 "enemy.h" 1
# 21 "enemy.h"
extern const unsigned short enemyBitmap[128];


extern const unsigned short enemyPal[256];
# 8 "game.c" 2


PLAYER player;
ENEMY enemies[4][5];
SHOT shots[6];
BLOCKADE blockades[4];


int score;
int direction;
int shootTimer;
int shootSpeed;

void initGame() {
    unsigned short colors[6] = {0, ((31) | (31) << 5 | (31) << 10), ((22) | (0) << 5 | (0) << 10), ((0) | (16) << 5 | (0) << 10), ((15) | (15) << 5 | (15) << 10)};


    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), (1 << 26) | 256);


    initPlayer();
    initEnemies();
    initShots();
    initBlockades();


    for (int i = 0; i < 6; i++) {
        ((unsigned short *)0x5000000)[256-6 +i] = colors[i];
    }

}


void initPlayer() {
    player.row = 160 - 20;
 player.col = 240 / 2;
 player.cdel = 1;
    player.height = 16;
    player.width = 16;
    player.health = 1;
}


void initEnemies() {
    direction = 1;
    shootSpeed = 40;
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 5; col++) {
            enemies[row][col].row = 20 + (row*18);
            enemies[row][col].col = 32 + (col*40);
            enemies[row][col].cdel = 1;
            enemies[row][col].height = 16;
            enemies[row][col].width = 16;
            enemies[row][col].active = 1;
        }
    }
}


void initShots() {
    for (int i = 0; i < 6; i++) {
        shots[i].row = 0;
        shots[i].col = 0;
        shots[i].cdel = 2;
        shots[i].height = 2;
        shots[i].width = 2;
        shots[i].color = WHITEID;
        shots[i].active = 0;
    }
}


void initBlockades() {
    for (int i = 0; i < 4; i++) {
        blockades[i].row = 160 - 40;
        blockades[i].originalRow = blockades[i].row;
        blockades[i].col = 34 + (i*50);
        blockades[i].cdel = 2;
        blockades[i].height = 10;
        blockades[i].originalHeight = blockades[i].height;
        blockades[i].width = 20;
        blockades[i].color = GRAYID;
        blockades[i].active = 1;
        blockades[i].health = 4;
    }
}


void shootShot(int shotType, int col, int row) {
    for (int i = 0; i < 6; i++) {
        if (!shots[i].active) {
            shots[i].active = 1;
            shots[i].shotType = shotType;
            shots[i].col = col + 8;
            shots[i].row = row;
            break;
        }
    }
}


void updateGame() {
    updatePlayer();
    updateEnemies();
    updateShots();
    updateBlockades();
    shootTimer++;

}


void updatePlayer(){
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5))) && player.col > 1) {
        player.col -= player.cdel;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4))) && player.col < 240 -player.width+1) {
        player.col += player.cdel;
    }
    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
        shootShot(0, player.col, player.row);
    }
}


void updateEnemies() {
    for (int col = 0; col < 5; col++) {
        for (int row = 0; row < 4; row++) {
            if (enemies[row][col].active) {

                if (score == 12) {
                    enemies[row][col].cdel = 2;
                    shootSpeed = 10;
                }


                if (enemies[row][col].row > 160 - 50) {
                    player.health = 0;
                }


                if (enemies[row][col].col <= 0 || enemies[row][col].col+enemies[row][col].width >= (240)-1) {
                    direction = direction*-1;
                    moveDownRow();
                    break;
                } else {

                    enemies[row][col].col += direction*enemies[row][col].cdel;
                }
            }
        }
    }


    srand(shootTimer);
    int randCol = (int) rand() % 5;
    if (shootTimer % shootSpeed == 0) {
        for (int row = 4 -1; row >= 0; row--) {
            if (enemies[row][randCol].active) {
                shootShot(1, enemies[row][randCol].col, 10 + enemies[row][randCol].row);
                break;
            }
        }
    }
}


void moveDownRow() {
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 5; col++) {
            enemies[row][col].row += enemies[row][col].cdel;
        }
    }
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 5; col++) {
            enemies[row][col].col += direction*enemies[row][col].cdel;
        }
    }
}


void updateShots() {
    for (int i = 0; i < 6; i++) {

        if (shots[i].row > 160 || shots[i].row < 18) {
            shots[i].active = 0;
        }


        else if (shots[i].shotType == 1) {
            shots[i].row += shots[i].cdel;


            for (int b = 0; b < 4; b++) {
                if(collision(blockades[b].col, blockades[b].row, blockades[b].width, blockades[b].height, shots[i].col,
                    shots[i].row, shots[i].width, shots[i].height) && blockades[b].active && shots[i].active) {
                    shots[i].active = 0;
                    if (blockades[b].health > 0) {
                        blockades[b].health -= 1;
                    } else {
                        blockades[b].health = 0;
                    }
                }
            }


            if(collision(shots[i].col, shots[i].row, shots[i].width, shots[i].height, player.col, player.row,
                player.width, player.height) && shots[i].active) {
                    shots[i].active = 0;
                    player.health = 0;
            }
        }


        else {
            shots[i].row -= shots[i].cdel;


            for (int row = 0; row < 4; row++) {
                for (int col = 0; col < 5; col++) {
                    if(collision(enemies[row][col].col, enemies[row][col].row, enemies[row][col].width, enemies[row][col].height,
                        shots[i].col, shots[i].row, shots[i].width, shots[i].height) && enemies[row][col].active && shots[i].active) {
                        enemies[row][col].active = 0;
                        score++;
                        shots[i].active = 0;
                    }
                }
            }


            for (int b = 0; b < 4; b++) {
                if(collision(blockades[b].col, blockades[b].row, blockades[b].width, blockades[b].height,
                    shots[i].col, shots[i].row, shots[i].width, shots[i].height) && blockades[b].active && shots[i].active) {
                    shots[i].active = 0;

                }
            }
        }
    }
}


void updateBlockades() {
    for (int i = 0; i < 4; i++) {
        if (blockades[i].active && blockades[i].health < 4) {
            if (blockades[i].health == 3) {
                blockades[i].height = blockades[i].originalHeight * .75;
                blockades[i].row = blockades[i].originalRow + (blockades[i].originalHeight - blockades[i].height);
            } else if (blockades[i].health == 2) {
                blockades[i].height = blockades[i].originalHeight * .5;
                blockades[i].row = blockades[i].originalRow + (blockades[i].originalHeight - blockades[i].height);
            } else if (blockades[i].health == 1) {
                blockades[i].height = blockades[i].originalHeight * .25;
                blockades[i].row = blockades[i].originalRow + (blockades[i].originalHeight - blockades[i].height);
            } else {
                blockades[i].color = BLACKID;
                blockades[i].active = 0;
            }
        }
    }
}


void drawGame() {
    drawFullscreenImage4(backgroundBitmap);
    drawPlayer();
    drawEnemies();
    drawShots();
    drawBlockades();
}


void drawPlayer() {
    drawImage4(player.col, player.row, player.width, player.height, playerBitmap);
}


void drawEnemies() {
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 5; col++) {
            if(enemies[row][col].active) {
                drawImage4(enemies[row][col].col, enemies[row][col].row, enemies[row][col].width,
                    enemies[row][col].height, enemyBitmap);
            }
        }
    }
}


void drawShots() {
    for (int i = 0; i < 6; i++) {
        if (shots[i].active) {
            drawRect4(shots[i].col, shots[i].row, shots[i].width, shots[i].height, shots[i].color);
        }
    }
}


void drawBlockades() {
    for (int i = 0; i < 4; i++) {
        if (blockades[i].active) {
            drawRect4(blockades[i].col, blockades[i].row, blockades[i].width, blockades[i].height, blockades[i].color);
        }
    }
}
