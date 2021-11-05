# 5.1 channel audio preamplifier

This project introduces a digitally controlled 5.1 channel audio preamplifier system. This amplifier is specifically designed to increase the gain of the multi-channel PC sound cards.

This preamplifier consists of six *[TL074](https://octopart.com/tl074idt-stmicroelectronics-410591)*/*[TL072](https://octopart.com/tl072idt-stmicroelectronics-410448)* preamplifier stages and *[PT2258](http://www.princeton.com.tw/Portals/0/Product/PT2258.pdf)* electronic volume control. The input stage of this preamplifier consists of six *TL074*/*TL072* buffer stages. The *[PIC16F886](https://www.microchip.com/en-us/product/PIC16F886)* microcontroller manages the *PT2258* electronic volume control IC. All the volume levels and menu options are displayed on [*HD44780*, 16×2 character LCD screen](https://s.click.aliexpress.com/e/_9iRz4T).

[![5.1 Preamplifier Video](https://raw.githubusercontent.com/dilshan/6ch-af-preamplifier/main/resources/6ch-preamp-youtube-preview.jpg)](https://youtu.be/Fg2yn0mBOQU)

The provided PCB design contains a preamplifier, buffer stages, digital volume control circuit, driver circuit, and power supply unit.

The project was sponsored by *[PCBWay](https://www.pcbway.com/setinvite.aspx?inviteid=341430)*. The accurately configured PCB of this preamplifier can directly [order from *PCBWay*](https://www.pcbway.com/project/shareproject/5_1_channel_audio_preamplifier.html) through their website. The dimension of the PCB is 151.45 × 50.76mm.

This preamplifier is a [certified](https://certification.oshwa.org/lk000010.html) open hardware project. All source codes, *KiCAD* design files, and compiled binaries are available at this repository.

The complete [documentation](https://github.com/dilshan/6ch-af-preamplifier/wiki) of this project is available in the [wiki](https://github.com/dilshan/6ch-af-preamplifier/wiki) section of this repository. The PCB *Gerber files* and compiled binaries are also available in the [release](https://github.com/dilshan/6ch-af-preamplifier/releases) section of this repository.

All the content of this project are distributed under the terms of the following license:

- Hardware License: [CERN-OHL-W 2.0](https://ohwr.org/cern_ohl_w_v2.txt)
- Software License: [MIT](https://github.com/dilshan/6ch-af-preamplifier/blob/main/LICENSE)
- [Documentation](https://github.com/dilshan/6ch-af-preamplifier/wiki) License: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

[![LK000010](https://raw.githubusercontent.com/dilshan/6ch-af-preamplifier/main/resources/6ch-preamp-oshwa-LK000010-small.jpg)](https://certification.oshwa.org/lk000010.html)
