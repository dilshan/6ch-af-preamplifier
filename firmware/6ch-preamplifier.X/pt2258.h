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

#ifndef PREAMP_PT2258_H
#define	PREAMP_PT2258_H

#include <stdint.h>

// Based on https://github.com/sunrutcon/PT2258.

#define CHANNEL1_VOLUME_STEP_01 0x90
#define CHANNEL1_VOLUME_STEP_10 0x80

#define CHANNEL2_VOLUME_STEP_01 0x50
#define CHANNEL2_VOLUME_STEP_10 0x40

#define CHANNEL3_VOLUME_STEP_01 0x10
#define CHANNEL3_VOLUME_STEP_10 0x00

#define CHANNEL4_VOLUME_STEP_01 0x30
#define CHANNEL4_VOLUME_STEP_10 0x20

#define CHANNEL5_VOLUME_STEP_01 0x70
#define CHANNEL5_VOLUME_STEP_10 0x60

#define CHANNEL6_VOLUME_STEP_01 0xB0
#define CHANNEL6_VOLUME_STEP_10 0xA0

#define MASTER_VOLUME_1STEP     0xE0
#define MASTER_VOLUME_10STEP    0xD0

#define MUTE        0xF8
#define MUTE_OFF    0x00
#define MUTE_ON     0x01

#define  PT2258_SYSTEM_RESET    0xC0

void volControlInit(void);

void volSetChannelAtt(uint8_t channelID, uint8_t level);
void volSetMasterAtt(uint8_t level);
void volSetMute(uint8_t mute);

#endif	/* PREAMP_PT2258_H */

