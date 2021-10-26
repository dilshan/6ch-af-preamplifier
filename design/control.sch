EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
Title "5.1 Channel Audio Preamplifier"
Date "2021-08-05"
Rev "1.0.0"
Comp "Dilshan R Jayakody"
Comment1 "jayakody2000lk@gmail.com"
Comment2 "http://jayakody2000lk.blogspot.com"
Comment3 ""
Comment4 "Licensed under CERN-OHL-W Version 2.0"
$EndDescr
$Comp
L MCU_Microchip_PIC16:PIC16F886-IP U4
U 1 1 610E0D3E
P 3400 2400
F 0 "U4" H 2300 1400 50  0000 C CNN
F 1 "PIC16F886-IP" H 4250 3400 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 3400 2400 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/41291D.pdf" H 3400 2200 50  0001 C CNN
	1    3400 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR029
U 1 1 610E527B
P 3500 3750
F 0 "#PWR029" H 3500 3500 50  0001 C CNN
F 1 "GNDD" H 3504 3595 50  0000 C CNN
F 2 "" H 3500 3750 50  0001 C CNN
F 3 "" H 3500 3750 50  0001 C CNN
	1    3500 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3500 3500 3650
Wire Wire Line
	3400 3500 3400 3650
Wire Wire Line
	3400 3650 3500 3650
Connection ~ 3500 3650
Wire Wire Line
	3500 3650 3500 3750
$Comp
L power:+5V #PWR028
U 1 1 610E5AFA
P 3400 1100
F 0 "#PWR028" H 3400 950 50  0001 C CNN
F 1 "+5V" H 3415 1273 50  0000 C CNN
F 2 "" H 3400 1100 50  0001 C CNN
F 3 "" H 3400 1100 50  0001 C CNN
	1    3400 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1100 3400 1300
$Comp
L Device:C C12
U 1 1 610E67F5
P 1800 1900
F 0 "C12" H 1915 1946 50  0000 L CNN
F 1 "0.1MFD" H 1915 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 1838 1750 50  0001 C CNN
F 3 "~" H 1800 1900 50  0001 C CNN
	1    1800 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 610E6F57
P 1800 1300
F 0 "R8" H 1870 1346 50  0000 L CNN
F 1 "22K" H 1870 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1730 1300 50  0001 C CNN
F 3 "~" H 1800 1300 50  0001 C CNN
	1    1800 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 610E70C3
P 1800 1100
F 0 "#PWR023" H 1800 950 50  0001 C CNN
F 1 "+5V" H 1815 1273 50  0000 C CNN
F 2 "" H 1800 1100 50  0001 C CNN
F 3 "" H 1800 1100 50  0001 C CNN
	1    1800 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1100 1800 1150
Wire Wire Line
	1800 1450 1800 1600
Wire Wire Line
	2100 1600 1800 1600
Connection ~ 1800 1600
Wire Wire Line
	1800 1600 1800 1750
$Comp
L power:GNDD #PWR024
U 1 1 610E7C2B
P 1800 2100
F 0 "#PWR024" H 1800 1850 50  0001 C CNN
F 1 "GNDD" H 1804 1945 50  0000 C CNN
F 2 "" H 1800 2100 50  0001 C CNN
F 3 "" H 1800 2100 50  0001 C CNN
	1    1800 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2050 1800 2100
Wire Wire Line
	1450 1600 1800 1600
Text Label 1450 1600 2    50   ~ 0
RESET
NoConn ~ 4700 2000
NoConn ~ 4700 2100
NoConn ~ 4700 2300
NoConn ~ 4700 2200
NoConn ~ 2100 2500
NoConn ~ 2100 2600
NoConn ~ 2100 3000
NoConn ~ 2100 3100
NoConn ~ 2100 3200
Wire Wire Line
	1650 2700 2100 2700
Text Label 1650 2700 2    50   ~ 0
BACK-LIGHT-CNT
Text GLabel 1650 2800 0    50   Output ~ 0
SCL
Text GLabel 1650 2900 0    50   BiDi ~ 0
SDA
Wire Wire Line
	1650 2800 2100 2800
Wire Wire Line
	1650 2900 2100 2900
Wire Wire Line
	5200 1600 4700 1600
Text Label 5200 1600 0    50   ~ 0
LCD-DATA4
Wire Wire Line
	5200 1700 4700 1700
Wire Wire Line
	5200 1800 4700 1800
Wire Wire Line
	5200 1900 4700 1900
Text Label 5200 1700 0    50   ~ 0
LCD-DATA5
Text Label 5200 1800 0    50   ~ 0
LCD-DATA6
Text Label 5200 1900 0    50   ~ 0
LCD-DATA7
Wire Wire Line
	5200 2500 4700 2500
Wire Wire Line
	5200 2600 4700 2600
Wire Wire Line
	5200 2700 4700 2700
Wire Wire Line
	5200 2800 4700 2800
Wire Wire Line
	5200 2900 4700 2900
Wire Wire Line
	5200 3000 4700 3000
Wire Wire Line
	5200 3100 4700 3100
Wire Wire Line
	5200 3200 4700 3200
Text Label 5200 3200 0    50   ~ 0
ICSPDAT
Text Label 5200 3100 0    50   ~ 0
ICSPCLK
Text Label 5200 2500 0    50   ~ 0
ROT-SW1
Text Label 5200 2600 0    50   ~ 0
ROT-SW2
Text Label 5200 2700 0    50   ~ 0
ROT-PRESS-SW
Text Label 5200 2800 0    50   ~ 0
BUTTON-MUTE
Text Label 5200 2900 0    50   ~ 0
LCD-RS
Text Label 5200 3000 0    50   ~ 0
LCD-EN
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 610F47C2
P 9700 1500
F 0 "J4" H 9780 1542 50  0000 L CNN
F 1 "5-pin Micro JST" H 9780 1451 50  0000 L CNN
F 2 "Connector_JST:JST_EH_B5B-EH-A_1x05_P2.50mm_Vertical" H 9700 1500 50  0001 C CNN
F 3 "~" H 9700 1500 50  0001 C CNN
	1    9700 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 1300 9500 1300
Wire Wire Line
	9150 1500 9500 1500
Wire Wire Line
	9150 1600 9500 1600
Text Label 9150 1300 2    50   ~ 0
ROT-SW1
Text Label 9150 1500 2    50   ~ 0
ROT-SW2
Text Label 9150 1600 2    50   ~ 0
ROT-PRESS-SW
$Comp
L power:GNDD #PWR040
U 1 1 610F74D5
P 9350 1950
F 0 "#PWR040" H 9350 1700 50  0001 C CNN
F 1 "GNDD" H 9354 1795 50  0000 C CNN
F 2 "" H 9350 1950 50  0001 C CNN
F 3 "" H 9350 1950 50  0001 C CNN
	1    9350 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1950 9350 1700
Wire Wire Line
	9350 1400 9500 1400
Wire Wire Line
	9500 1700 9350 1700
Connection ~ 9350 1700
Wire Wire Line
	9350 1700 9350 1400
Text Notes 9400 1050 0    50   ~ 0
EC11 30 Position \nRotary Encoder
$Comp
L Connector_Generic:Conn_01x05 J5
U 1 1 610F9EBC
P 9700 3300
F 0 "J5" H 9780 3342 50  0000 L CNN
F 1 "5-pin 2.54mm Male Header" H 9780 3251 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 9700 3300 50  0001 C CNN
F 3 "~" H 9700 3300 50  0001 C CNN
	1    9700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3100 9500 3100
Wire Wire Line
	9150 3400 9500 3400
Wire Wire Line
	9150 3500 9500 3500
Text Label 9150 3100 2    50   ~ 0
RESET
Text Label 9150 3400 2    50   ~ 0
ICSPDAT
Text Label 9150 3500 2    50   ~ 0
ICSPCLK
$Comp
L power:+5V #PWR037
U 1 1 610FD879
P 8500 3100
F 0 "#PWR037" H 8500 2950 50  0001 C CNN
F 1 "+5V" H 8515 3273 50  0000 C CNN
F 2 "" H 8500 3100 50  0001 C CNN
F 3 "" H 8500 3100 50  0001 C CNN
	1    8500 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR038
U 1 1 610FDE84
P 8500 3600
F 0 "#PWR038" H 8500 3350 50  0001 C CNN
F 1 "GNDD" H 8504 3445 50  0000 C CNN
F 2 "" H 8500 3600 50  0001 C CNN
F 3 "" H 8500 3600 50  0001 C CNN
	1    8500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3200 8500 3200
Wire Wire Line
	8500 3200 8500 3100
Wire Wire Line
	9500 3300 8500 3300
Wire Wire Line
	8500 3300 8500 3600
Text Notes 9600 2900 0    50   ~ 0
ICSP
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 61100F10
P 9650 4900
F 0 "J3" H 9730 4892 50  0000 L CNN
F 1 "2-pin Micro JST" H 9730 4801 50  0000 L CNN
F 2 "Connector_JST:JST_EH_B2B-EH-A_1x02_P2.50mm_Vertical" H 9650 4900 50  0001 C CNN
F 3 "~" H 9650 4900 50  0001 C CNN
	1    9650 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 4900 9450 4900
Text Label 9100 4900 2    50   ~ 0
BUTTON-MUTE
$Comp
L power:GNDD #PWR039
U 1 1 61103C97
P 9300 5250
F 0 "#PWR039" H 9300 5000 50  0001 C CNN
F 1 "GNDD" H 9304 5095 50  0000 C CNN
F 2 "" H 9300 5250 50  0001 C CNN
F 3 "" H 9300 5250 50  0001 C CNN
	1    9300 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 5000 9300 5000
Wire Wire Line
	9300 5000 9300 5250
$Comp
L Connector_Generic:Conn_01x16 J2
U 1 1 61105503
P 1550 6100
F 0 "J2" H 1468 7017 50  0000 C CNN
F 1 "16-pin 2.54mm Male Header" H 1468 6926 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x16_P2.54mm_Vertical" H 1550 6100 50  0001 C CNN
F 3 "~" H 1550 6100 50  0001 C CNN
	1    1550 6100
	-1   0    0    -1  
$EndComp
Text Notes 9400 4650 0    50   ~ 0
MUTE Button \n(Tactile Switch)
$Comp
L power:GNDD #PWR025
U 1 1 61113419
P 1950 7100
F 0 "#PWR025" H 1950 6850 50  0001 C CNN
F 1 "GNDD" H 1954 6945 50  0000 C CNN
F 2 "" H 1950 7100 50  0001 C CNN
F 3 "" H 1950 7100 50  0001 C CNN
	1    1950 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5400 1950 5400
Wire Wire Line
	1950 5400 1950 5800
$Comp
L power:+5V #PWR026
U 1 1 6111579F
P 2450 5300
F 0 "#PWR026" H 2450 5150 50  0001 C CNN
F 1 "+5V" H 2465 5473 50  0000 C CNN
F 2 "" H 2450 5300 50  0001 C CNN
F 3 "" H 2450 5300 50  0001 C CNN
	1    2450 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5500 2450 5500
Wire Wire Line
	2450 5500 2450 5300
Wire Wire Line
	2150 5600 1750 5600
Text Label 2150 5600 0    50   ~ 0
CONTRAST-CNT
Wire Wire Line
	2150 5700 1750 5700
Text Label 2150 5700 0    50   ~ 0
LCD-RS
Wire Wire Line
	1750 5800 1950 5800
Connection ~ 1950 5800
Wire Wire Line
	1950 5800 1950 6000
Wire Wire Line
	2150 5900 1750 5900
Text Label 2150 5900 0    50   ~ 0
LCD-EN
Wire Wire Line
	1750 6000 1950 6000
Connection ~ 1950 6000
Wire Wire Line
	1950 6000 1950 6100
Wire Wire Line
	1750 6100 1950 6100
Connection ~ 1950 6100
Wire Wire Line
	1950 6100 1950 6200
Wire Wire Line
	1750 6200 1950 6200
Connection ~ 1950 6200
Wire Wire Line
	1950 6200 1950 6300
Wire Wire Line
	1750 6300 1950 6300
Connection ~ 1950 6300
Wire Wire Line
	1950 6300 1950 7100
Wire Wire Line
	2150 6400 1750 6400
Wire Wire Line
	2150 6500 1750 6500
Wire Wire Line
	2150 6600 1750 6600
Wire Wire Line
	2150 6700 1750 6700
Text Label 2150 6400 0    50   ~ 0
LCD-DATA4
Text Label 2150 6500 0    50   ~ 0
LCD-DATA5
Text Label 2150 6600 0    50   ~ 0
LCD-DATA6
Text Label 2150 6700 0    50   ~ 0
LCD-DATA7
Wire Wire Line
	2150 6900 1750 6900
Text Label 2150 6900 0    50   ~ 0
LCD-BK-K
Text Notes 1350 4950 0    50   ~ 0
HD44780 LCD\n(1602 - BLUE)
$Comp
L Device:R_POT RV1
U 1 1 6112FDB1
P 3950 5750
F 0 "RV1" H 3881 5796 50  0000 R CNN
F 1 "50K" H 3881 5705 50  0000 R CNN
F 2 "Potentiometer_SMD:Potentiometer_Bourns_TC33X_Vertical" H 3950 5750 50  0001 C CNN
F 3 "~" H 3950 5750 50  0001 C CNN
	1    3950 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR030
U 1 1 61130A1A
P 3950 5300
F 0 "#PWR030" H 3950 5150 50  0001 C CNN
F 1 "+5V" H 3965 5473 50  0000 C CNN
F 2 "" H 3950 5300 50  0001 C CNN
F 3 "" H 3950 5300 50  0001 C CNN
	1    3950 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR031
U 1 1 611346C5
P 3950 6250
F 0 "#PWR031" H 3950 6000 50  0001 C CNN
F 1 "GNDD" H 3954 6095 50  0000 C CNN
F 2 "" H 3950 6250 50  0001 C CNN
F 3 "" H 3950 6250 50  0001 C CNN
	1    3950 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5300 3950 5600
Wire Wire Line
	3950 6250 3950 5900
Wire Wire Line
	4350 5750 4100 5750
Text Label 4350 5750 0    50   ~ 0
CONTRAST-CNT
Text Notes 4000 5550 0    50   ~ 0
LCD Contrast
$Comp
L Transistor_BJT:BC817 Q1
U 1 1 610B7B3C
P 7100 5250
F 0 "Q1" H 7291 5296 50  0000 L CNN
F 1 "BC817" H 7291 5205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7300 5175 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC818-D.pdf" H 7100 5250 50  0001 L CNN
	1    7100 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR034
U 1 1 610B85A4
P 7200 5600
F 0 "#PWR034" H 7200 5350 50  0001 C CNN
F 1 "GNDD" H 7204 5445 50  0000 C CNN
F 2 "" H 7200 5600 50  0001 C CNN
F 3 "" H 7200 5600 50  0001 C CNN
	1    7200 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 610BCBC1
P 6550 5250
F 0 "R10" V 6343 5250 50  0000 C CNN
F 1 "10K" V 6434 5250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6480 5250 50  0001 C CNN
F 3 "~" H 6550 5250 50  0001 C CNN
	1    6550 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 5450 7200 5600
Wire Wire Line
	7400 4900 7200 4900
Wire Wire Line
	7200 4900 7200 5050
Wire Wire Line
	6700 5250 6900 5250
Wire Wire Line
	6150 5250 6400 5250
Text Label 6150 5250 2    50   ~ 0
BACK-LIGHT-CNT
Text Label 7400 4900 0    50   ~ 0
LCD-BK-K
$Comp
L Device:R R9
U 1 1 610DBA78
P 2900 6450
F 0 "R9" H 2830 6404 50  0000 R CNN
F 1 "470R" H 2830 6495 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2830 6450 50  0001 C CNN
F 3 "~" H 2900 6450 50  0001 C CNN
	1    2900 6450
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR027
U 1 1 610DC2D0
P 2900 6150
F 0 "#PWR027" H 2900 6000 50  0001 C CNN
F 1 "+5V" H 2915 6323 50  0000 C CNN
F 2 "" H 2900 6150 50  0001 C CNN
F 3 "" H 2900 6150 50  0001 C CNN
	1    2900 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 6800 2900 6600
Wire Wire Line
	1750 6800 2900 6800
Wire Wire Line
	2900 6150 2900 6300
$Comp
L power:+5V #PWR032
U 1 1 61103079
P 6600 1100
F 0 "#PWR032" H 6600 950 50  0001 C CNN
F 1 "+5V" H 6615 1273 50  0000 C CNN
F 2 "" H 6600 1100 50  0001 C CNN
F 3 "" H 6600 1100 50  0001 C CNN
	1    6600 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR035
U 1 1 611035A8
P 7550 1100
F 0 "#PWR035" H 7550 950 50  0001 C CNN
F 1 "+5V" H 7565 1273 50  0000 C CNN
F 2 "" H 7550 1100 50  0001 C CNN
F 3 "" H 7550 1100 50  0001 C CNN
	1    7550 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 61105B4B
P 6600 1500
F 0 "C13" H 6715 1546 50  0000 L CNN
F 1 "0.1MFD" H 6715 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6638 1350 50  0001 C CNN
F 3 "~" H 6600 1500 50  0001 C CNN
	1    6600 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C14
U 1 1 611062DE
P 7550 1500
F 0 "C14" H 7665 1546 50  0000 L CNN
F 1 "1MFD" H 7665 1455 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 7550 1500 50  0001 C CNN
F 3 "~" H 7550 1500 50  0001 C CNN
	1    7550 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR033
U 1 1 6110677A
P 6600 1900
F 0 "#PWR033" H 6600 1650 50  0001 C CNN
F 1 "GNDD" H 6604 1745 50  0000 C CNN
F 2 "" H 6600 1900 50  0001 C CNN
F 3 "" H 6600 1900 50  0001 C CNN
	1    6600 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR036
U 1 1 61106E09
P 7550 1900
F 0 "#PWR036" H 7550 1650 50  0001 C CNN
F 1 "GNDD" H 7554 1745 50  0000 C CNN
F 2 "" H 7550 1900 50  0001 C CNN
F 3 "" H 7550 1900 50  0001 C CNN
	1    7550 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1100 6600 1350
Wire Wire Line
	6600 1650 6600 1900
Wire Wire Line
	7550 1100 7550 1350
Wire Wire Line
	7550 1650 7550 1900
Text Notes 7200 850  0    50   ~ 0
PLACE NEAR THE LCD
$EndSCHEMATC
