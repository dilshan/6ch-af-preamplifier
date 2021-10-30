/*******************************************************************************
Copyright (c) 2021 Dilshan R Jayakody.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*******************************************************************************/

#include "sysconfig.h"
#include "lcd.h"

void sendNibble(uint8_t inChar, uint8_t isData)
{
    // Trim nibble of the input data.
    inChar = inChar & 0x0F;
    
    // Send nibble data into LCD.      
    PORTA = PORTA & 0xF0;
    PORTA = PORTA | inChar;
    
    // Set data mode bit. (1 for data, 0 for instructions)
    PORTBbits.RB4 = isData;
    
    // Toggle enable bit to transfer the nibble.
    PORTBbits.RB5 = 0;
    __delay_us(10);
    PORTBbits.RB5 = 1;
    __delay_us(10);
    PORTBbits.RB5 = 0;
}

void sendData(uint8_t val, uint8_t mode)
{
    sendNibble(val >> 4, mode);
    sendNibble(val, mode);
}

void initLCD()
{
    sendNibble(0x03, 0);
    __delay_ms(10);
    sendNibble(0x03, 0);
    __delay_ms(10);
    sendNibble(0x03, 0);
    __delay_us(150);
    
    sendNibble(0x02, 0);
    
    sendCmd(LCD_FUNCTION_SET);
    sendCmd(LCD_DISPLAY_SETUP);
    
    clearLCD();    
    sendCmd(LCD_ENTRY_MODE);    
}

void clearLCD()
{
    sendCmd(LCD_CLEARDISPLAY);
    __delay_ms(3);
}

void setLocation(uint8_t col, uint8_t row)
{
    sendCmd(((row == 1) ? LCD_SET_ROW1 : LCD_SET_ROW2) | col);
}

void printString(char* buffer, int8_t size)
{
    int8_t tempPos = 0;
    
    while(tempPos < size)
    {
        if(buffer[tempPos] == 0)
        {
            // Stop print cycle on NULL character.
            break;
        }
        else
        {
            sendChr(buffer[tempPos]);
        }
        
        tempPos++;
    }
}

void setGraphicRAM(uint8_t location, const uint8_t *buffer)
{
    uint8_t pos;
    
    location = location & 0x07;
    sendCmd(LCD_SET_CGRAM | (location << 3));
    
    for(pos = 0; pos < 8; pos++)
    {
        sendChr(buffer[pos]);
    }
}