# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
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
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar3(int col, int row, char ch, unsigned short color);
void drawString3(int col, int row, char *str, unsigned short color);


void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2


void drawChar3(int col, int row, char ch, unsigned short color)
{

    for (int r = 0; r < 8; r++)
    {
        for (int c = 0; c < 6; c++)
        {
            if (fontdata_6x8[48 * ch + ((r) * (6) + (c))])
            {
                setPixel3(col + c, row + r, color);
            }
        }
    }
}


void drawChar4(int col, int row, char ch, unsigned char colorIndex)
{

    for (int r = 0; r < 8; r++)
    {
        for (int c = 0; c < 6; c++)
        {
            if (fontdata_6x8[48 * ch + ((r) * (6) + (c))])
            {
                setPixel4(col + c, row + r, colorIndex);
            }
        }
    }
}


void drawString3(int col, int row, char *str, unsigned short color)
{


    while (*str != '\0')
    {

        drawChar3(col, row, *str, color);
        col += 6;


        str++;
    }
}


void drawString4(int col, int row, char *str, unsigned char colorIndex)
{


    while (*str != '\0')
    {

        drawChar4(col, row, *str, colorIndex);
        col += 6;


        str++;
    }
}
