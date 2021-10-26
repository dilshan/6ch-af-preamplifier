# 5.1 channel audio preamplifier

This project introduces a digitally controlled 5.1 channel audio preamplifier system. This amplifier is specifically designed to increase the gain of the multi-channel PC sound cards.

This preamplifier consists of six *TL074*/*TL072* preamplifier stages and *PT2258* electronic volume control. The input stage of this preamplifier consists of six *TL074*/*TL072* buffer stages. The *PIC16F886* microcontroller manages the *PT2258* electronic volume control IC. All the volume levels and menu options are displayed on *HD44780*, 16×2 character LCD screen.

The provided PCB design contains a preamplifier, buffer stages, digital volume control circuit, driver circuit, and power supply unit.

The project was sponsored by *PCBWay*. The accurately configured PCB of this preamplifier can directly order from *PCBWay* through their website. The dimension of the PCB is 151.45 × 50.76mm.

This preamplifier is an open hardware project. All source codes, *KiCAD* design files, and compiled binaries are available at this repository.

The complete documentation of this project is available in the wiki section of this repository. The PCB *Gerber files* and compiled binaries are also available in the release section of this repository.

All the content of this project are distributed under the terms of the following license:

-   Hardware License: CERN-OHL-W 2.0
-   Software License: MIT
-   Documentation License: CC BY 4.0
