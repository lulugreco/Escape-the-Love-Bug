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

//function prototypes
void initPlayer();
void drawPlayer();
void updatePlayer();

//Object Pooling
typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int width;
    int height;
    unsigned short color;
} WALL;

#define WALLCOUNT 5
WALL walls[WALLCOUNT];

//function prototypes
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

