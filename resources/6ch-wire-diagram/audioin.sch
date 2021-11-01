EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L Connector:AudioJack2_Ground_Switch J24
U 1 1 617921C9
P 2150 2100
F 0 "J24" H 2182 2525 50  0000 C CNN
F 1 "3.5mm Stereo Jack Socket" H 2182 2434 50  0000 C CNN
F 2 "" H 2150 2300 50  0001 C CNN
F 3 "~" H 2150 2300 50  0001 C CNN
	1    2150 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 61792CC9
P 3300 1900
F 0 "J6" H 3380 1892 50  0000 L CNN
F 1 "3.5mm Terminal" H 3380 1801 50  0000 L CNN
F 2 "" H 3300 1900 50  0001 C CNN
F 3 "~" H 3300 1900 50  0001 C CNN
	1    3300 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 61792ED3
P 3300 2400
F 0 "J7" H 3380 2392 50  0000 L CNN
F 1 "3.5mm Terminal" H 3380 2301 50  0000 L CNN
F 2 "" H 3300 2400 50  0001 C CNN
F 3 "~" H 3300 2400 50  0001 C CNN
	1    3300 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 2100 2700 2400
Wire Wire Line
	2700 2400 3100 2400
Wire Wire Line
	3100 2000 2900 2000
Wire Wire Line
	2900 2000 2900 2500
Wire Wire Line
	2900 2500 3100 2500
Wire Wire Line
	2150 2400 2150 2500
Wire Wire Line
	2150 2500 2900 2500
Connection ~ 2900 2500
Wire Wire Line
	2350 2100 2700 2100
Wire Wire Line
	2350 1900 3100 1900
NoConn ~ 2350 2000
NoConn ~ 2350 2200
Text Notes 1900 2700 0    50   ~ 0
FRONT AUDIO IN
$Comp
L Connector:AudioJack2_Ground_Switch J25
U 1 1 6179688E
P 5100 2150
F 0 "J25" H 5132 2575 50  0000 C CNN
F 1 "3.5mm Stereo Jack Socket" H 5132 2484 50  0000 C CNN
F 2 "" H 5100 2350 50  0001 C CNN
F 3 "~" H 5100 2350 50  0001 C CNN
	1    5100 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 61796904
P 6250 1950
F 0 "J8" H 6330 1942 50  0000 L CNN
F 1 "3.5mm Terminal" H 6330 1851 50  0000 L CNN
F 2 "" H 6250 1950 50  0001 C CNN
F 3 "~" H 6250 1950 50  0001 C CNN
	1    6250 1950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 6179690E
P 6250 2450
F 0 "J9" H 6330 2442 50  0000 L CNN
F 1 "3.5mm Terminal" H 6330 2351 50  0000 L CNN
F 2 "" H 6250 2450 50  0001 C CNN
F 3 "~" H 6250 2450 50  0001 C CNN
	1    6250 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2150 5650 2450
Wire Wire Line
	5650 2450 6050 2450
Wire Wire Line
	6050 2050 5850 2050
Wire Wire Line
	5850 2050 5850 2550
Wire Wire Line
	5850 2550 6050 2550
Wire Wire Line
	5100 2450 5100 2550
Wire Wire Line
	5100 2550 5850 2550
Connection ~ 5850 2550
Wire Wire Line
	5300 2150 5650 2150
Wire Wire Line
	5300 1950 6050 1950
NoConn ~ 5300 2050
NoConn ~ 5300 2250
Text Notes 4850 2750 0    50   ~ 0
REAR AUDIO IN
$Comp
L Connector:AudioJack2_Ground_Switch J26
U 1 1 6179B5D5
P 8100 2150
F 0 "J26" H 8132 2575 50  0000 C CNN
F 1 "3.5mm Stereo Jack Socket" H 8132 2484 50  0000 C CNN
F 2 "" H 8100 2350 50  0001 C CNN
F 3 "~" H 8100 2350 50  0001 C CNN
	1    8100 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 6179B697
P 9250 1950
F 0 "J10" H 9330 1942 50  0000 L CNN
F 1 "3.5mm Terminal" H 9330 1851 50  0000 L CNN
F 2 "" H 9250 1950 50  0001 C CNN
F 3 "~" H 9250 1950 50  0001 C CNN
	1    9250 1950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J11
U 1 1 6179B6A1
P 9250 2450
F 0 "J11" H 9330 2442 50  0000 L CNN
F 1 "3.5mm Terminal" H 9330 2351 50  0000 L CNN
F 2 "" H 9250 2450 50  0001 C CNN
F 3 "~" H 9250 2450 50  0001 C CNN
	1    9250 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2150 8650 2450
Wire Wire Line
	8650 2450 9050 2450
Wire Wire Line
	9050 2050 8850 2050
Wire Wire Line
	8850 2050 8850 2550
Wire Wire Line
	8850 2550 9050 2550
Wire Wire Line
	8100 2450 8100 2550
Wire Wire Line
	8100 2550 8850 2550
Connection ~ 8850 2550
Wire Wire Line
	8300 2150 8650 2150
Wire Wire Line
	8300 1950 9050 1950
NoConn ~ 8300 2050
NoConn ~ 8300 2250
Text Notes 7850 2750 0    50   ~ 0
CENTER/SUB AUDIO IN
$Comp
L Connector:AudioJack2_Ground_Switch J20
U 1 1 617A2DC9
P 2150 4950
F 0 "J20" H 2182 5375 50  0000 C CNN
F 1 "3.5mm Stereo Jack Socket" H 2182 5284 50  0000 C CNN
F 2 "" H 2150 5150 50  0001 C CNN
F 3 "~" H 2150 5150 50  0001 C CNN
	1    2150 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J15
U 1 1 617A2ED7
P 3300 4750
F 0 "J15" H 3380 4742 50  0000 L CNN
F 1 "3.5mm Terminal" H 3380 4651 50  0000 L CNN
F 2 "" H 3300 4750 50  0001 C CNN
F 3 "~" H 3300 4750 50  0001 C CNN
	1    3300 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J14
U 1 1 617A2EE1
P 3300 5250
F 0 "J14" H 3380 5242 50  0000 L CNN
F 1 "3.5mm Terminal" H 3380 5151 50  0000 L CNN
F 2 "" H 3300 5250 50  0001 C CNN
F 3 "~" H 3300 5250 50  0001 C CNN
	1    3300 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4950 2700 5250
Wire Wire Line
	2700 5250 3100 5250
Wire Wire Line
	3100 4850 2900 4850
Wire Wire Line
	2900 4850 2900 5350
Wire Wire Line
	2900 5350 3100 5350
Wire Wire Line
	2150 5250 2150 5350
Wire Wire Line
	2150 5350 2900 5350
Connection ~ 2900 5350
Wire Wire Line
	2350 4950 2700 4950
Wire Wire Line
	2350 4750 3100 4750
NoConn ~ 2350 4850
NoConn ~ 2350 5050
Text Notes 1900 5550 0    50   ~ 0
FRONT AUDIO OUT
$Comp
L Connector:AudioJack2_Ground_Switch J21
U 1 1 617A2EF8
P 5100 4950
F 0 "J21" H 5132 5375 50  0000 C CNN
F 1 "3.5mm Stereo Jack Socket" H 5132 5284 50  0000 C CNN
F 2 "" H 5100 5150 50  0001 C CNN
F 3 "~" H 5100 5150 50  0001 C CNN
	1    5100 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J12
U 1 1 617A2F02
P 6250 4750
F 0 "J12" H 6330 4742 50  0000 L CNN
F 1 "3.5mm Terminal" H 6330 4651 50  0000 L CNN
F 2 "" H 6250 4750 50  0001 C CNN
F 3 "~" H 6250 4750 50  0001 C CNN
	1    6250 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J13
U 1 1 617A2F0C
P 6250 5250
F 0 "J13" H 6330 5242 50  0000 L CNN
F 1 "3.5mm Terminal" H 6330 5151 50  0000 L CNN
F 2 "" H 6250 5250 50  0001 C CNN
F 3 "~" H 6250 5250 50  0001 C CNN
	1    6250 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4950 5650 5250
Wire Wire Line
	5650 5250 6050 5250
Wire Wire Line
	6050 4850 5850 4850
Wire Wire Line
	5850 4850 5850 5350
Wire Wire Line
	5850 5350 6050 5350
Wire Wire Line
	5100 5250 5100 5350
Wire Wire Line
	5100 5350 5850 5350
Connection ~ 5850 5350
Wire Wire Line
	5300 4950 5650 4950
Wire Wire Line
	5300 4750 6050 4750
NoConn ~ 5300 4850
NoConn ~ 5300 5050
Text Notes 4850 5550 0    50   ~ 0
REAR AUDIO OUT
$Comp
L Connector:AudioJack2_Ground_Switch J22
U 1 1 617A2F23
P 8100 4950
F 0 "J22" H 8132 5375 50  0000 C CNN
F 1 "3.5mm Stereo Jack Socket" H 8132 5284 50  0000 C CNN
F 2 "" H 8100 5150 50  0001 C CNN
F 3 "~" H 8100 5150 50  0001 C CNN
	1    8100 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J17
U 1 1 617A2F2D
P 9250 4750
F 0 "J17" H 9330 4742 50  0000 L CNN
F 1 "3.5mm Terminal" H 9330 4651 50  0000 L CNN
F 2 "" H 9250 4750 50  0001 C CNN
F 3 "~" H 9250 4750 50  0001 C CNN
	1    9250 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J16
U 1 1 617A2F37
P 9250 5250
F 0 "J16" H 9330 5242 50  0000 L CNN
F 1 "3.5mm Terminal" H 9330 5151 50  0000 L CNN
F 2 "" H 9250 5250 50  0001 C CNN
F 3 "~" H 9250 5250 50  0001 C CNN
	1    9250 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4950 8650 5250
Wire Wire Line
	8650 5250 9050 5250
Wire Wire Line
	9050 4850 8850 4850
Wire Wire Line
	8850 4850 8850 5350
Wire Wire Line
	8850 5350 9050 5350
Wire Wire Line
	8100 5250 8100 5350
Wire Wire Line
	8100 5350 8850 5350
Connection ~ 8850 5350
Wire Wire Line
	8300 4950 8650 4950
Wire Wire Line
	8300 4750 9050 4750
NoConn ~ 8300 4850
NoConn ~ 8300 5050
Text Notes 7850 5550 0    50   ~ 0
CENTER/SUB AUDIO OUT
$EndSCHEMATC
