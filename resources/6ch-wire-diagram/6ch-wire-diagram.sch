EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "5.1 Channel Audio Preamplifier Wiring Diagrams"
Date "2021-11-01"
Rev "1.0.0"
Comp "Dilshan R Jayakody"
Comment1 "jayakody2000lk@gmail.com"
Comment2 "http://jayakody2000lk.blogspot.com"
Comment3 "https://github.com/dilshan/6ch-af-preamplifier"
Comment4 "Licensed under CERN-OHL-W Version 2.0"
$EndDescr
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 6175660F
P 3750 2050
F 0 "J4" H 3830 2092 50  0000 L CNN
F 1 "5-pin Micro JST" H 3830 2001 50  0000 L CNN
F 2 "" H 3750 2050 50  0001 C CNN
F 3 "~" H 3750 2050 50  0001 C CNN
	1    3750 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:Rotary_Encoder_Switch SW1
U 1 1 617571ED
P 2800 1950
F 0 "SW1" H 2800 1583 50  0000 C CNN
F 1 "ALPS EC11K" H 2800 1674 50  0000 C CNN
F 2 "" H 2650 2110 50  0001 C CNN
F 3 "~" H 2800 2210 50  0001 C CNN
	1    2800 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	3550 1950 3100 1950
Wire Wire Line
	3550 1850 3100 1850
Wire Wire Line
	3100 2050 3550 2050
Wire Wire Line
	3550 2150 3200 2150
Wire Wire Line
	3200 2150 3200 2250
Wire Wire Line
	3200 2250 2450 2250
Wire Wire Line
	2450 2250 2450 2050
Wire Wire Line
	2450 2050 2500 2050
Wire Wire Line
	3550 2250 3300 2250
Wire Wire Line
	3300 2250 3300 2350
Wire Wire Line
	3300 2350 2350 2350
Wire Wire Line
	2350 2350 2350 1850
Wire Wire Line
	2350 1850 2500 1850
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 6175BD4D
P 3750 3850
F 0 "J3" H 3830 3842 50  0000 L CNN
F 1 "2-pin Micro JST" H 3830 3751 50  0000 L CNN
F 2 "" H 3750 3850 50  0001 C CNN
F 3 "~" H 3750 3850 50  0001 C CNN
	1    3750 3850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 6175C407
P 2800 3850
F 0 "SW2" H 2800 4135 50  0000 C CNN
F 1 "7mm Push Switch" H 2800 4044 50  0000 C CNN
F 2 "" H 2800 4050 50  0001 C CNN
F 3 "~" H 2800 4050 50  0001 C CNN
	1    2800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3850 3000 3850
Wire Wire Line
	3550 3950 2450 3950
Wire Wire Line
	2450 3950 2450 3850
Wire Wire Line
	2450 3850 2600 3850
$Comp
L Connector_Generic:Conn_01x16 J2
U 1 1 6175EB7C
P 7500 2400
F 0 "J2" H 7418 3317 50  0000 C CNN
F 1 "16-pin female connector" H 7418 3226 50  0000 C CNN
F 2 "" H 7500 2400 50  0001 C CNN
F 3 "~" H 7500 2400 50  0001 C CNN
	1    7500 2400
	-1   0    0    -1  
$EndComp
$Comp
L Display_Character:NHD-0420H1Z U10
U 1 1 6176003B
P 9150 2400
F 0 "U10" H 9400 3200 50  0000 C CNN
F 1 "HD44780 - 2x16 Character LCD" H 9150 3500 50  0000 C CNN
F 2 "Display:NHD-0420H1Z" H 9150 1500 50  0001 C CNN
F 3 "http://www.newhavendisplay.com/specs/NHD-0420H1Z-FSW-GBW-33V3.pdf" H 9250 2300 50  0001 C CNN
	1    9150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2300 8750 2300
Wire Wire Line
	7700 2400 8750 2400
Wire Wire Line
	7700 2500 8750 2500
Wire Wire Line
	7700 2600 8750 2600
Wire Wire Line
	8750 2700 7700 2700
Wire Wire Line
	7700 2800 8750 2800
Wire Wire Line
	8750 2900 7700 2900
Wire Wire Line
	7700 3000 8750 3000
Wire Wire Line
	7700 2200 8550 2200
Wire Wire Line
	8550 2200 8550 2000
Wire Wire Line
	8550 2000 8750 2000
Wire Wire Line
	7700 2100 8450 2100
Wire Wire Line
	8450 2100 8450 1900
Wire Wire Line
	8450 1900 8750 1900
Wire Wire Line
	7700 2000 8350 2000
Wire Wire Line
	8350 2000 8350 1800
Wire Wire Line
	8350 1800 8750 1800
Wire Wire Line
	7700 1900 8250 1900
Wire Wire Line
	8250 1900 8250 1500
Wire Wire Line
	8250 1500 9250 1500
Wire Wire Line
	9250 1500 9250 1600
Wire Wire Line
	7700 1800 8150 1800
Wire Wire Line
	8150 1800 8150 1400
Wire Wire Line
	8150 1400 9150 1400
Wire Wire Line
	9150 1400 9150 1600
Wire Wire Line
	7700 3100 8550 3100
Wire Wire Line
	8550 3100 8550 3300
Wire Wire Line
	8550 3300 9650 3300
Wire Wire Line
	9650 3300 9650 2700
Wire Wire Line
	9650 2700 9550 2700
Wire Wire Line
	7700 3200 8450 3200
Wire Wire Line
	8450 3200 8450 3400
Wire Wire Line
	8450 3400 9750 3400
Wire Wire Line
	9750 3400 9750 2600
Wire Wire Line
	9750 2600 9550 2600
Wire Wire Line
	7700 1700 8050 1700
Wire Wire Line
	8050 1700 8050 3500
Wire Wire Line
	8050 3500 9150 3500
Wire Wire Line
	9150 3500 9150 3200
Text Notes 8900 1200 0    50   ~ 0
BLUE/WHITE LCD
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 6177810D
P 4000 5800
F 0 "J1" H 4080 5842 50  0000 L CNN
F 1 "3.5mm Connector" H 4080 5751 50  0000 L CNN
F 2 "" H 4000 5800 50  0001 C CNN
F 3 "~" H 4000 5800 50  0001 C CNN
	1    4000 5800
	1    0    0    -1  
$EndComp
$Comp
L Transformer:TEZ16.0-D-2 TR1
U 1 1 6177B72A
P 3150 5750
F 0 "TR1" H 3150 6275 50  0000 C CNN
F 1 "230V - 6Vx2 Step Down Transformer" H 3150 6184 50  0000 C CNN
F 2 "Transformer_THT:Transformer_Breve_TEZ-47x57" H 3150 5200 50  0001 C CIN
F 3 "http://www.breve.pl/pdf/ANG/TEZ_ang.pdf" H 3150 5750 50  0001 C CNN
	1    3150 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 5750 3450 5750
Wire Wire Line
	3450 5750 3450 5800
Wire Wire Line
	3450 5850 3350 5850
Wire Wire Line
	3800 5800 3450 5800
Connection ~ 3450 5800
Wire Wire Line
	3450 5800 3450 5850
Wire Wire Line
	3350 5450 3650 5450
Wire Wire Line
	3650 5450 3650 5700
Wire Wire Line
	3650 5700 3800 5700
Wire Wire Line
	3350 6150 3650 6150
Wire Wire Line
	3650 6150 3650 5900
Wire Wire Line
	3650 5900 3800 5900
$Comp
L Connector:Conn_WallPlug P1
U 1 1 61782C38
P 2250 5750
F 0 "P1" H 2250 5550 50  0000 C CNN
F 1 " " H 2267 5984 50  0000 C CNN
F 2 "" H 2650 5750 50  0001 C CNN
F 3 "~" H 2650 5750 50  0001 C CNN
	1    2250 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5650 2700 5650
Wire Wire Line
	2700 5650 2700 5550
Wire Wire Line
	2700 5550 2950 5550
Wire Wire Line
	2450 5850 2700 5850
Wire Wire Line
	2700 5850 2700 5950
Wire Wire Line
	2700 5950 2950 5950
$Sheet
S 8250 4900 1600 1050
U 61791538
F0 "Sheet61791537" 50
F1 "audioin.sch" 50
$EndSheet
$EndSCHEMATC
