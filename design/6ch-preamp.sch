EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title "5.1 Channel Audio Preamplifier"
Date "2021-08-05"
Rev "1.0.0"
Comp "Dilshan R Jayakody"
Comment1 "jayakody2000lk@gmail.com"
Comment2 "http://jayakody2000lk.blogspot.com"
Comment3 "https://github.com/dilshan/6ch-af-preamplifier"
Comment4 "Licensed under CERN-OHL-W Version 2.0"
$EndDescr
$Sheet
S 9150 1000 1600 950 
U 610AADC1
F0 "PSU" 50
F1 "psu.sch" 50
$EndSheet
$Sheet
S 9150 2600 1600 950 
U 610E0728
F0 "MCU-CONTROL" 50
F1 "control.sch" 50
$EndSheet
$Sheet
S 9150 4200 1600 900 
U 6117C9F0
F0 "VOLUME-CNT" 50
F1 "vol-cnt.sch" 50
$EndSheet
$Sheet
S 6900 1000 1600 950 
U 61232116
F0 "BUFFER-AMP" 50
F1 "buffer.sch" 50
$EndSheet
$Sheet
S 6900 2600 1600 950 
U 6120DDCF
F0 "FINAL-AMP_STAGE" 50
F1 "amp-stage.sch" 50
$EndSheet
$Comp
L Mechanical:MountingHole H1
U 1 1 610F85A3
P 7250 4400
F 0 "H1" H 7350 4446 50  0000 L CNN
F 1 "M3" H 7350 4355 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 7250 4400 50  0001 C CNN
F 3 "~" H 7250 4400 50  0001 C CNN
	1    7250 4400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 610F8906
P 8150 4400
F 0 "H3" H 8250 4446 50  0000 L CNN
F 1 "M3" H 8250 4355 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 8150 4400 50  0001 C CNN
F 3 "~" H 8150 4400 50  0001 C CNN
	1    8150 4400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 610F8A6C
P 7250 4900
F 0 "H2" H 7350 4946 50  0000 L CNN
F 1 "M3" H 7350 4855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 7250 4900 50  0001 C CNN
F 3 "~" H 7250 4900 50  0001 C CNN
	1    7250 4900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 610F8B77
P 8150 4900
F 0 "H4" H 8250 4946 50  0000 L CNN
F 1 "M3" H 8250 4855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 8150 4900 50  0001 C CNN
F 3 "~" H 8150 4900 50  0001 C CNN
	1    8150 4900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 610FE8ED
P 1350 6750
F 0 "TP1" H 1408 6868 50  0000 L CNN
F 1 "PCB-PAD" H 1408 6777 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 1550 6750 50  0001 C CNN
F 3 "~" H 1550 6750 50  0001 C CNN
	1    1350 6750
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 610FEB67
P 2050 6750
F 0 "TP4" H 2108 6868 50  0000 L CNN
F 1 "PCB-PAD" H 2108 6777 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 2250 6750 50  0001 C CNN
F 3 "~" H 2250 6750 50  0001 C CNN
	1    2050 6750
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 610FED47
P 2750 6750
F 0 "TP5" H 2808 6868 50  0000 L CNN
F 1 "PCB-PAD" H 2808 6777 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 2950 6750 50  0001 C CNN
F 3 "~" H 2950 6750 50  0001 C CNN
	1    2750 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR01
U 1 1 61100EF6
P 1350 6950
F 0 "#PWR01" H 1350 6700 50  0001 C CNN
F 1 "GNDA" H 1355 6777 50  0000 C CNN
F 2 "" H 1350 6950 50  0001 C CNN
F 3 "" H 1350 6950 50  0001 C CNN
	1    1350 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 6750 1350 6950
$Comp
L 6ch-preamp:-4.5V #PWR02
U 1 1 61102B81
P 2050 6950
F 0 "#PWR02" H 2050 7050 50  0001 C CNN
F 1 "-4.5V" H 2065 7123 50  0000 C CNN
F 2 "" H 2050 6950 50  0001 C CNN
F 3 "" H 2050 6950 50  0001 C CNN
	1    2050 6950
	-1   0    0    1   
$EndComp
$Comp
L 6ch-preamp:+4.5V #PWR03
U 1 1 61102EB8
P 2750 6950
F 0 "#PWR03" H 2750 6800 50  0001 C CNN
F 1 "+4.5V" H 2765 7123 50  0000 C CNN
F 2 "" H 2750 6950 50  0001 C CNN
F 3 "" H 2750 6950 50  0001 C CNN
	1    2750 6950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2050 6750 2050 6950
Wire Wire Line
	2750 6750 2750 6950
$Comp
L Connector:TestPoint TP3
U 1 1 611043C9
P 1500 5800
F 0 "TP3" V 1695 5872 50  0000 C CNN
F 1 "PCB-PAD" V 1604 5872 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 1700 5800 50  0001 C CNN
F 3 "~" H 1700 5800 50  0001 C CNN
	1    1500 5800
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 611047B0
P 1500 5300
F 0 "TP2" V 1695 5372 50  0000 C CNN
F 1 "PCB-PAD" V 1604 5372 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 1700 5300 50  0001 C CNN
F 3 "~" H 1700 5300 50  0001 C CNN
	1    1500 5300
	0    -1   -1   0   
$EndComp
Text GLabel 2050 5300 2    50   Input ~ 0
SCL
Text GLabel 2050 5800 2    50   Input ~ 0
SDA
Wire Wire Line
	1500 5300 2050 5300
Wire Wire Line
	1500 5800 2050 5800
$EndSCHEMATC
