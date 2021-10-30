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

#ifndef PREAMP_MAIN_H
#define	PREAMP_MAIN_H

#include <stdint.h>

#include "sysconfig.h"

#define SLEEP_COUNTER_LIMIT 40

#define VOLUME_MAX_ATT    79

#define CHANNEL_MODE_AUTO       0xFF
#define CHANNEL_MODE_CUSTOM     0x00

#define LCD_CCHAR_SPEAKER   1
#define LCD_CCHAT_CROSS     2

const uint8_t charSpeakerSymbol[8] = { 0x01, 0x03, 0x05, 0x19, 0x19, 0x05, 0x03, 0x01 };
const uint8_t charCrossSymbol[8] = {0x00, 0x11, 0x0A, 0x04, 0x04, 0x0A, 0x11, 0x00};

uint8_t masterVol, chCount, chVol[MAX_CHANNEL_COUNT];
uint8_t channelMode;
uint8_t updateMsg;
uint8_t muteState;
uint8_t lastInputState;

volatile uint8_t sleepCounter;

char lcdBuffer[16];

void initSystem(void);
void execIdleMode(void);

void systemMenuHandler(void);
void changeChannelAttr(uint8_t channel, uint8_t *value);
void changeChannelMode(uint8_t *value);
void toggleMuteState(void);
void displayMuteIcon(void);

#endif	/* PREAMP_MAIN_H */

