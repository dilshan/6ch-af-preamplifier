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

#include <string.h>

#include "sysconfig.h"
#include "main.h"
#include "lcd.h"
#include "i2c.h"
#include "pt2258.h"
#include "util.h"

#define VOLUME_UPDATE_LEVEL 400

#define EEPROM_OFFSET_MODE      0x00
#define EEPROM_OFFSET_VOLUME    0x01
#define EEPROM_OFFSET_CHANNEL   0x02

__EEPROM_DATA(0xFF, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);

void main(void) 
{
    uint16_t volumeIdleCounter;
    
    initSystem();
    i2cInit();
    __delay_ms(10);
    
    // Initialize LCD display.
    initLCD();
    clearLCD();
    
    // Turn on LCD back-light.
    PORTC = 0x04;
    
    // Allow time to initialize PT2258 with atleast 200ms delay.    
    printString("Initializing...", 15);    
    __delay_ms(500);
    
    // Insert mute symbols into LCD CGRAM.
    setGraphicRAM(LCD_CCHAR_SPEAKER, charSpeakerSymbol);
    setGraphicRAM(LCD_CCHAT_CROSS, charCrossSymbol);
    
    // Initialize PT2258 volume controller.    
    volControlInit();
    
    // Initialize global variables.    
    lastInputState = PORTB;
    sleepCounter = 0;
    updateMsg = 0x01;
    muteState = MUTE_OFF;
    volumeIdleCounter = 0;
    
    // Load EEPROM configuration and update global variables.
    masterVol = eeprom_read(EEPROM_OFFSET_VOLUME);
    if(masterVol > VOLUME_MAX_ATT)
    {
        // Invalid master attenuation level!
        masterVol = VOLUME_MAX_ATT;
    }
    
    channelMode = eeprom_read(EEPROM_OFFSET_MODE);
    if(!((channelMode == CHANNEL_MODE_CUSTOM) || (channelMode == CHANNEL_MODE_AUTO)))
    {
        // Invalid channel mode!
        channelMode = CHANNEL_MODE_CUSTOM;
    }
            
    // Restore master attenuation and channel attenuation levels.
    for(chCount = 0; chCount < MAX_CHANNEL_COUNT; chCount++)
    {
        // Load custom channel attenuation levels into RAM.
        chVol[chCount] = eeprom_read((EEPROM_OFFSET_CHANNEL + chCount));
        if(chVol[chCount] > VOLUME_MAX_ATT)
        {
            // Invalid channel attenuation level!
            chVol[chCount] = masterVol;
        }
        
        // Assign custom attenuation levels only if the mode is CUSTOM. 
        volSetChannelAtt(chCount, ((channelMode == CHANNEL_MODE_CUSTOM) ? chVol[chCount] : masterVol));
        __delay_ms(5);
    }
    
    // Activate audio outputs of the pre-amplifier.
    volSetMute(muteState);
    
    // Main service loop.
    while(1)
    {
        // Handle rotary encoder change events.
        if(((PORTB & 0x03) != 0x03) && (channelMode == CHANNEL_MODE_AUTO))
        {                        
            if(((PORTB & 0x01) == 0x00) && ((lastInputState & 0x01) == 0x01))
            {
                if(PORTB & 0x02)
                {
                    // Rotary encoder is changing on increment direction.
                    masterVol += ((masterVol >= VOLUME_MAX_ATT) ? 0 : 1);
                }
                else
                {
                    // Rotary encoder is changing on decrement direction.
                    masterVol -= ((masterVol == 0) ? 0 : 1);
                }
                
                // Request for LCD update.
                updateMsg = 0x01;
                sleepCounter = 0;
                volumeIdleCounter = VOLUME_UPDATE_LEVEL;
                volSetMasterAtt(masterVol);
            }
        }
        
        // Handle rotary switch press event (to access the system menu).
        if(((lastInputState & 0x04) == 0x00) && (PORTB & 0x04))
        {
            sleepCounter = 0;
            systemMenuHandler();
            updateMsg = 0x01;
        }
        
        // Handle mute button press event.
        if(((lastInputState & 0x08) == 0x00) && (PORTB & 0x08))
        {
            sleepCounter = 0;
            toggleMuteState();
            updateMsg = 0x01;            
        }
        
        // Handle LCD update due to master volume control changes.
        if(updateMsg & 0x01)
        {
            if(channelMode == CHANNEL_MODE_AUTO)
            {
                strncpy(lcdBuffer, "Att:   dB", 10);
                numToStrBuffer(&masterVol, lcdBuffer, 5);

                clearLCD();
                printString(lcdBuffer, 9);
            }
            else
            {
                clearLCD();
                printString("Custom Profile", 14);
            }
            
            updateMsg = 0;
            
            // Update mute symbol on LCD.
            displayMuteIcon();
        }
        
        // Detect idle state in volume control to update the EEPROM.
        if(volumeIdleCounter > 0)
        {
            volumeIdleCounter--;
            
            // Avoid multiple calls to update EEPROM (with volume).
            if(volumeIdleCounter == 2)
            {
                // Volume control is almost idle, lets write current volume level into EEPROM.
                eeprom_write(EEPROM_OFFSET_VOLUME, masterVol);
            }
        }
        
        // Check sleep counter status to enter LCD into sleep mode.
        if(sleepCounter >= SLEEP_COUNTER_LIMIT)
        {
            // Sleep timer exceed the idle limit.
            execIdleMode();
            
            lastInputState = PORTB;
            continue;
        }
                        
        lastInputState = PORTB;        
        __delay_ms(4);  
    }
    
    return;
}

void toggleMuteState()
{
    __delay_ms(150);
    
    muteState = (muteState == MUTE_ON) ? MUTE_OFF : MUTE_ON;
    volSetMute(muteState);    
}

void systemMenuHandler()
{
    uint8_t menuPos = 0, updateFlag = 1;
    uint8_t tempId;
    
    lastInputState = PORTB;
    
    while(1)
    {
        // Handle rotary encoder change events.
        if((PORTB & 0x03) != 0x03)
        {                        
            if(((PORTB & 0x01) == 0x00) && ((lastInputState & 0x01) == 0x01))
            {
                if(PORTB & 0x02)
                {
                    menuPos = ((menuPos == 7) ? 0 : (menuPos + 1));
                    if((channelMode == CHANNEL_MODE_AUTO) && (menuPos > 0) && (menuPos < 7))
                    {
                        // In AUTO mode user may not allow to change attenuation on each channel.
                        menuPos = 7;
                    }
                }
                else
                {
                    menuPos = ((menuPos == 0) ? 7 : (menuPos - 1));
                    if((channelMode == CHANNEL_MODE_AUTO) && (menuPos > 0) && (menuPos < 7))
                    {
                        // In AUTO mode user may not allow to change attenuation on each channel.
                        menuPos = 0;
                    }
                } 
                
                // Redraw menu item and value on LCD.
                sleepCounter = 0;
                updateFlag = 1;                
            }                        
        }
        
        // Handle mute button press event.
        if(((lastInputState & 0x08) == 0x00) && (PORTB & 0x08))
        {
            sleepCounter = 0;
            toggleMuteState();
            updateFlag = 1;
        }
        
        // Handle value change event.
        if(((lastInputState & 0x04) == 0x00) && (PORTB & 0x04))
        {
            // Clear pointer from menu item.
            setLocation(0, 1);
            sendChr(0x20);
            
            // Assign pointer to the menu value.
            setLocation(0, 2);
            sendChr(0x07E); 
            
            sleepCounter = 0;
            
            __delay_ms(50);
            
            // Display value edit option.
            if((menuPos > 0) && (menuPos < 7))
            {
                // Change channel attenuation value.
                tempId = menuPos - 1;
                changeChannelAttr(tempId, &(chVol[tempId]));
            }
            else if(menuPos == 0)
            {
                // Change channel mode.
                changeChannelMode(&channelMode);
            }
            else
            {
                // Exit from system menu.
                break;
            }
            
            // Clear pointer on value field.
            setLocation(0, 2);
            sendChr(0x020); 
            
            // Show selected menu item and value on exit.                        
            updateFlag = 1;
        }
        
        // Check for idle timer.
        if(sleepCounter >= SLEEP_COUNTER_LIMIT)
        {
            // Sleep timer exceed the idle limit.
            break;
        }
                        
        if(updateFlag)
        {
            clearLCD();
            strncpy(lcdBuffer, "  dB", 5);
            
            switch(menuPos)
            {
                case 0:
                    printString(" Channel Att", 12);
                    if(channelMode == CHANNEL_MODE_AUTO)
                    {
                        strncpy(lcdBuffer, "Automatic", 10);
                    }
                    else
                    {
                        strncpy(lcdBuffer, "Custom", 7);
                    }
                    break;
                case 1:
                    printString(" Front Left", 11);
                    numToStrBuffer(&(chVol[0]), lcdBuffer, 0);
                    break;
                case 2:
                    printString(" Front Right", 12);
                    numToStrBuffer(&(chVol[1]), lcdBuffer, 0);
                    break;    
                case 3:
                    printString(" Rear Left", 10);
                    numToStrBuffer(&(chVol[2]), lcdBuffer, 0);
                    break;
                case 4:
                    printString(" Rear Right", 11);
                    numToStrBuffer(&(chVol[3]), lcdBuffer, 0);
                    break;
                case 5:
                    printString(" Center", 7);
                    numToStrBuffer(&(chVol[4]), lcdBuffer, 0);
                    break;
                case 6:
                    printString(" Subwoofer", 10);
                    numToStrBuffer(&(chVol[5]), lcdBuffer, 0);
                    break;
                case 7:
                    printString(" Exit", 5);
                    break;
            }
            
            // Pointer is set to menu item (root menu).
            setLocation(0, 1);
            sendChr(0x07E);
            
            // Show attenuation level / menu parameter of the selected channel (except EXIT menu item).
            if(menuPos != 7)
            {
                setLocation(1, 2);
                printString(lcdBuffer, 11); 
            }
            
            // Update mute symbol on LCD.
            displayMuteIcon();
                                   
            updateFlag = 0;
        }
                
        lastInputState = PORTB;        
        __delay_ms(5);
    }
}

void changeChannelMode(uint8_t *value)
{
    uint8_t updateFlag = 1, tmpPos;
    
    lastInputState = PORTB;
    
    while(1)
    {
        // Handle rotary encoder change events.
        if((PORTB & 0x03) != 0x03)
        {
            if(((PORTB & 0x01) == 0x00) && ((lastInputState & 0x01) == 0x01))
            {                
                // Toggle mode between AUTO and MANUAL (in both directions).
                if((*value) == CHANNEL_MODE_AUTO)
                {
                    (*value) = CHANNEL_MODE_CUSTOM;
                    
                    // Load custom attenuation configuration into each channel.
                    for(tmpPos = 0; tmpPos < MAX_CHANNEL_COUNT; tmpPos++)
                    {
                        volSetChannelAtt(tmpPos, chVol[tmpPos]);
                        __delay_ms(5);
                    }
                }
                else
                {
                    (*value) = CHANNEL_MODE_AUTO;
                    
                    // Set attenuation of all 6 channels to one level.
                    volSetMasterAtt(masterVol);
                }
                                
                sleepCounter = 0;
                updateFlag = 1;
            }
        }
        
        // Refresh value on LCD based on update flag.
        if(updateFlag)
        {
            if((*value) == CHANNEL_MODE_AUTO)
            {
                strncpy(lcdBuffer, "Automatic", 10);
            }
            else
            {
                strncpy(lcdBuffer, "Custom   ", 10);
            }
            
            setLocation(1, 2);
            printString(lcdBuffer, 10);
            
            // Update mute symbol on LCD.
            displayMuteIcon();
            
            updateFlag = 0;
        }
        
        // Check for exit event.
        if(((lastInputState & 0x04) == 0x00) && (PORTB & 0x04))
        {
            // Save selected mode into EEPROM.
            sleepCounter = 0;
            eeprom_write(EEPROM_OFFSET_MODE, (*value));
            break;
        }
        
        // Check for idle timer.
        if(sleepCounter >= SLEEP_COUNTER_LIMIT)
        {
            // Sleep timer exceed the idle limit.
            break;
        }
        
        // Handle mute button press event.
        if(((lastInputState & 0x08) == 0x00) && (PORTB & 0x08))
        {
            sleepCounter = 0;
            toggleMuteState();
            updateFlag = 1;
        }
                
        lastInputState = PORTB;        
        __delay_ms(5);
    }
}

void changeChannelAttr(uint8_t channel, uint8_t *value)
{      
    uint8_t updateFlag = 1;
    
    lastInputState = PORTB;  
    
    while(1)
    {
        // Handle rotary encoder change events.
        if((PORTB & 0x03) != 0x03)
        {                        
            if(((PORTB & 0x01) == 0x00) && ((lastInputState & 0x01) == 0x01))
            {
                if(PORTB & 0x02)
                {
                    (*value) += (((*value) >= VOLUME_MAX_ATT) ? 0 : 1);
                }
                else
                {
                    (*value) -= (((*value) == 0) ? 0 : 1);
                }
                
                updateFlag = 1;
            }
            
            sleepCounter = 0;
        }
                
        // Refresh value on LCD based on update flag.
        if(updateFlag)
        {
            setLocation(1, 2);
            strncpy(lcdBuffer, "  dB", 5);
            
            numToStrBuffer(value, lcdBuffer, 0);
            printString(lcdBuffer, 4); 
            
            // Update mute symbol on LCD.
            displayMuteIcon();
            
            volSetChannelAtt(channel, (*value));            
            updateFlag = 0;
        }
        
        // Check for exit event.
        if(((lastInputState & 0x04) == 0x00) && (PORTB & 0x04))
        {
            // Save current channel value into EEPROM.
            sleepCounter = 0;
            eeprom_write((EEPROM_OFFSET_CHANNEL + channel), (*value));            
            break;
        }
        
        // Handle mute button press event.
        if(((lastInputState & 0x08) == 0x00) && (PORTB & 0x08))
        {
            sleepCounter = 0;
            toggleMuteState();
            updateFlag = 1;
        }
        
        // Check for idle timer.
        if(sleepCounter >= SLEEP_COUNTER_LIMIT)
        {
            // Sleep timer exceed the idle limit.
            break;
        }
        
        lastInputState = PORTB;        
        __delay_ms(5);
    }
}

void displayMuteIcon()
{
    // Update mute symbol at lower right corner of the LCD.
    setLocation(14, 2);

    if(muteState == MUTE_ON)
    {
        // Audio output is mute.
        sendChr(LCD_CCHAR_SPEAKER);
        sendChr(LCD_CCHAT_CROSS);
    }
    else
    {
        // Audio output is online.
        sendChr(0x20);
        sendChr(0x20);
    }
}

void execIdleMode()
{
    // Turn off LCD back-light.
    PORTC &= 0xFB;
    lastInputState = PORTB; 
    
    // Stop sleep timer.
    PIE1 &= 0xFE;
    
    while(1)
    {
        if((lastInputState & 0x0F) != (PORTB & 0x0F))
        {
            // User action detected and break the idle state.
            sleepCounter = 0;
            
            // Restart sleep timer.
            TMR1H = 11;
            TMR1L = 220;
    
            PIR1 = 0x00;
            PIE1 = 0x01;
            
            break;
        }
        
        lastInputState = PORTB;        
        __delay_ms(5);
    }
    
    // Turn on LCD back-light.
    PORTC |= 0x04;
}

void __interrupt() isrMain(void)
{
    if(PIR1 & 0x01)
    {
        if(sleepCounter <= SLEEP_COUNTER_LIMIT)
        {
            sleepCounter++;
        }
        
        // Restart TIMER1 with 500ms interval.
        TMR1H = 11;
        TMR1L = 220;
    
        PIR1 = 0x00;
        PIE1 = 0x01;               
    }
}

void initSystem()
{    
    // Enable internal pull-ups on PORTB.
    OPTION_REG = 0x7F;
    
    // RA0...RA3 : [OUT] 1602 (HD44780) LCD - DATA4..DATA7
    PORTA = 0x00;
    TRISA = 0x00;
        
    // RB0 : [IN] Rotary encoder input 1.
    // RB1 : [IN] Rotary encoder input 2.
    // RB2 : [IN] Rotary encoder push switch input.
    // RB3 : [IN] Mute button input.
    // RB4 : [OUT] 1602 (HD44780) LCD - RS [4]
    // RB5 : [OUT] 1602 (HD44780) LCD - En [6]
    PORTB = 0x00;
    TRISB = 0x0F;
    WPUB = 0x0F;
    
    // RC2 : [OUT] LCD back-light control.
    // RC3 : [IN] I2C[SCL] - PT2258 SCL
    // RC4 : [IN] I2C[SDA] - PT2258 SDA
    PORTC = 0x00;
    TRISC = 0x18;
        
    // Disable unused peripherals such as ADC, comparator, ECCP, etc.
    ADCON0 = 0x00;
    ADCON1 = 0x00;
    ANSEL = 0x00;  
    ANSELH = 0x00;
    
    CM1CON0 = 0x00;
    CM2CON0 = 0x00;
    
    CCP1CON = 0x00;

    // Reset SSP control register to known state (for I2C).
    SSPCON = 0x00;
    
    // Initialize TIMER1 with 500ms interval as sleep counter.
    T1CON = 0x3D;
    TMR1H = 11;
    TMR1L = 220;
    
    // Enable interrupts from TIMER1.
    PIR1 = 0x00;
    PIE1 = 0x01;
    INTCON = 0xC0;
}