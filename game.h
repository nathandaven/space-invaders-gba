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
	int originalRow; // used to make resizing the blockades easier
	int col;
	int cdel;
	int height;
	int originalHeight; // used to make resizing the blockades easier
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

// size defines
#define ENEMYROWS 4
#define ENEMYCOLS 5
#define TOTALSHOTS 6
#define TOTALBLOCKADES 4


// external objects and variables
extern PLAYER player;
extern ENEMY enemies[ENEMYROWS][ENEMYCOLS];
extern SHOT shots[TOTALSHOTS];
extern BLOCKADE blockades[TOTALBLOCKADES];
extern int score;
extern int direction;


// game colors
#define NUMCOLORS 6
enum {BLACKID=(256-NUMCOLORS), WHITEID, REDID, GREENID, GRAYID};
extern unsigned short colors[NUMCOLORS];
#define ACTIVE 1
#define INACTIVE 0
#define ENEMYSHOT 1
#define PLAYERSHOT 0

// prototypes
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