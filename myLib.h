#ifndef MY_LIB_H
#define MY_LIB_H

// Common Typedefs
typedef unsigned short u16;

// Common Macros
#define OFFSET(c, r, rowlen) ((r) * (rowlen) + (c))

// ================================= DISPLAY ==================================

// Display Control Register
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define MODE4 4
#define DISP_BACKBUFFER (1 << 4)
#define BG2_ENABLE (1 << 10)

// Display Status Registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Display Constants
#define SCREENHEIGHT 160
#define SCREENWIDTH 240

// Video Buffer
extern volatile unsigned short *videoBuffer;
#define FRONTBUFFER ((unsigned short *)0x6000000)
#define BACKBUFFER ((unsigned short *)0x600A000)

// Palette
#define PALETTE ((unsigned short *)0x5000000)

// Color
#define COLOR(r, g, b) ((r) | (g) << 5 | (b) << 10)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)
#define GRAY COLOR(15, 15, 15)
#define RED COLOR(22, 0, 0)
#define GREEN COLOR(0, 16, 0)
#define BLUE COLOR(0, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define MAGENTA COLOR(31, 0, 31)
#define YELLOW COLOR(31, 31, 0)
// Custom Colors
#define PORTAGE COLOR(18, 19, 27)
#define CADILLAC COLOR(19, 9, 13)
#define ROGUE COLOR(22, 6, 13)
#define VIORED COLOR(28, 8, 16)
#define HOTPINK COLOR(31, 13, 21)
#define LAVPINK COLOR(31, 20, 26)
#define TURQUOISE COLOR(5, 26, 25)
#define PERSIAN COLOR(0, 21, 20)
#define TEAL COLOR(0, 16, 16)

// Mode 3 Drawing Functions
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);

// Mode 4 Drawing Functions
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);

// Miscellaneous Drawing Functions
void waitForVBlank();
void flipPage();

// ================================== INPUT ===================================

// Button Register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

// Button Masks
#define BUTTON_A (1 << 0)
#define BUTTON_B (1 << 1)
#define BUTTON_SELECT (1 << 2)
#define BUTTON_START (1 << 3)
#define BUTTON_RIGHT (1 << 4)
#define BUTTON_LEFT (1 << 5)
#define BUTTON_UP (1 << 6)
#define BUTTON_DOWN (1 << 7)
#define BUTTON_R (1 << 8)
#define BUTTON_L (1 << 9)

// Variables for Button Macros
extern unsigned short oldButtons;
extern unsigned short buttons;

// Button Macros
#define BUTTON_HELD(key) (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons) & (key)) && (~buttons & (key)))

// =================================== DMA ====================================

// DMA Struct
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;

// First DMA Register Address
extern DMA *dma;

// Destination Adjustment
#define DMA_DESTINATION_INCREMENT (0 << 21)
#define DMA_DESTINATION_DECREMENT (1 << 21)
#define DMA_DESTINATION_FIXED (2 << 21)
#define DMA_DESTINATION_RESET (3 << 21)

// Source Adjustment
#define DMA_SOURCE_INCREMENT (0 << 23)
#define DMA_SOURCE_DECREMENT (1 << 23)
#define DMA_SOURCE_FIXED (2 << 23)

// VBlank and HBlank Repeats
#define DMA_REPEAT (1 << 25)

// Chunk Size
#define DMA_16 (0 << 26)
#define DMA_32 (1 << 26)

// Timing Mode
#define DMA_NOW (0 << 28)
#define DMA_AT_VBLANK (1 << 28)
#define DMA_AT_HBLANK (2 << 28)
#define DMA_AT_REFRESH (3 << 28)

// Interrupts
#define DMA_IRQ (1 << 30)

// Begin DMA
#define DMA_ON (1 << 31)

// DMA Functions
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);

// ============================== MISCELLANEOUS ===============================

// Miscellaneous Functions
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);

#endif