#include "myLib.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location in Mode 3
void drawChar3(int col, int row, char ch, unsigned short color)
{

    for (int r = 0; r < 8; r++)
    {
        for (int c = 0; c < 6; c++)
        {
            if (fontdata_6x8[48 * ch + OFFSET(c, r, 6)])
            {
                setPixel3(col + c, row + r, color);
            }
        }
    }
}

// Draws the specified character at the specified location in Mode 4
void drawChar4(int col, int row, char ch, unsigned char colorIndex)
{

    for (int r = 0; r < 8; r++)
    {
        for (int c = 0; c < 6; c++)
        {
            if (fontdata_6x8[48 * ch + OFFSET(c, r, 6)])
            {
                setPixel4(col + c, row + r, colorIndex);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString3(int col, int row, char *str, unsigned short color)
{

    // Until the null character appears
    while (*str != '\0')
    {

        drawChar3(col, row, *str, color);
        col += 6;

        // Point to the next character
        str++;
    }
}

// Draws the specified string at the specified location in Mode 4
void drawString4(int col, int row, char *str, unsigned char colorIndex)
{

    // Until the null character appears
    while (*str != '\0')
    {

        drawChar4(col, row, *str, colorIndex);
        col += 6;

        // Point to the next character
        str++;
    }
}