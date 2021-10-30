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
#include "i2c.h"

void i2cInit()
{
    // Initialize I2C master mode with 100kHz clock. ((_XTAL_FREQ/(4 * 100000)) - 1).
    SSPCON  = 0x28;  
    SSPCON2 = 0x00;
    
    // I2C clock frequency : ((4000000/(4 * 100000)) - 1) = 9
    SSPADD  = 9;    
    SSPSTAT = 0x00;
}

void i2cStart()
{
    while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
    SEN = 1;
}

void i2cStop()
{
    while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
    PEN = 1;
}

void i2cWrite(uint8_t data)
{
    while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
    SSPBUF = data;
}

#ifdef ENABLE_I2C_RESTART

void i2cRepeatedStart()
{
    while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
    RSEN = 1;
}

#endif

#ifdef ENABLE_I2C_READ

uint8_t i2cRead(uint8_t ack)
{
    uint8_t data;
    while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
    
    RCEN = 1;
    while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
    
    data = SSPBUF;
    while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));

    ACKDT = !ack;
    ACKEN = 1;
    return data;
}

#endif