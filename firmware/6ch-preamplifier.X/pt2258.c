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
#include "pt2258.h"
#include "i2c.h"

#define TO_BCD(num) (((num / 10) << 4) | (num % 10))

#define PT2258_ADDRESS  0x88

uint8_t channelAddress01[MAX_CHANNEL_COUNT] = {
    CHANNEL1_VOLUME_STEP_01, CHANNEL2_VOLUME_STEP_01, CHANNEL3_VOLUME_STEP_01, 
    CHANNEL4_VOLUME_STEP_01, CHANNEL5_VOLUME_STEP_01, CHANNEL6_VOLUME_STEP_01
};

uint8_t channelAddress10[MAX_CHANNEL_COUNT] = {
    CHANNEL1_VOLUME_STEP_10, CHANNEL2_VOLUME_STEP_10, CHANNEL3_VOLUME_STEP_10, 
    CHANNEL4_VOLUME_STEP_10, CHANNEL5_VOLUME_STEP_10, CHANNEL6_VOLUME_STEP_10
};

void volSetChannelAtt(uint8_t channelID, uint8_t level)
{
    i2cStart();
    i2cWrite(PT2258_ADDRESS); 
    i2cWrite(channelAddress01[channelID] | (TO_BCD(level) & 0x0F));   
    i2cWrite(channelAddress10[channelID] | ((TO_BCD(level) & 0xf0) >> 4));
    i2cStop(); 
}

void volSetMasterAtt(uint8_t level)
{
    i2cStart();
    i2cWrite(PT2258_ADDRESS); 
    i2cWrite(MASTER_VOLUME_1STEP | (TO_BCD(level) & 0x0F));   
    i2cWrite(MASTER_VOLUME_10STEP | ((TO_BCD(level) & 0xf0) >> 4));
    i2cStop();
}

void volSetMute(uint8_t mute)
{
    i2cStart();
    i2cWrite(PT2258_ADDRESS);
    i2cWrite(MUTE | mute);  
    i2cStop();
}

void volControlInit()
{    
    // Send reset command to the PT2258 controller.
    __delay_ms(5);
    i2cStart();
    i2cWrite(PT2258_ADDRESS);
    i2cWrite(PT2258_SYSTEM_RESET);  
    i2cStop();
        
    // Mute audio output from the PT2258 controller.
    __delay_ms(5);
    volSetMute(MUTE_OFF);
}

