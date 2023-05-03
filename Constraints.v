// Thomas O'Donnell - EE 2742
// Constraints for a Basys 3 FPGA Board 
// Runs the Intersection Traffic Controller - FinalProject_TO.v


#SWITCHES
set_property PACKAGE_PIN V17 [get_ports {S[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[3]}]
set_property PACKAGE_PIN V16 [get_ports {S[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[2]}]
set_property PACKAGE_PIN W16 [get_ports {S[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[1]}]
set_property PACKAGE_PIN W17 [get_ports {S[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[0]}]
#set_property PACKAGE_PIN W15 [get_ports {S[4]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {S[4]}]
set_property PACKAGE_PIN V15 [get_ports {load}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {load}]
set_property PACKAGE_PIN W14 [get_ports {reset}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
set_property PACKAGE_PIN W13 [get_ports {s}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {s}]
	
#UNUSED SWITCHES 
#set_property PACKAGE_PIN V2 [get_ports {sw[8]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]


set_property PACKAGE_PIN T2 [get_ports {X[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {X[5]}]
set_property PACKAGE_PIN R3 [get_ports {X[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {X[4]}]
set_property PACKAGE_PIN W2 [get_ports {X[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {X[3]}]
set_property PACKAGE_PIN U1 [get_ports {X[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {X[2]}]
set_property PACKAGE_PIN T1 [get_ports {X[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {X[1]}]
set_property PACKAGE_PIN R2 [get_ports {X[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {X[0]}]
	
	
	
#LEDS
set_property PACKAGE_PIN U16 [get_ports {StateLED[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {StateLED[0]}]
set_property PACKAGE_PIN E19 [get_ports {StateLED[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {StateLED[1]}]
set_property PACKAGE_PIN U19 [get_ports {StateLED[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {StateLED[2]}]
set_property PACKAGE_PIN V19 [get_ports {StateLED[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {StateLED[3]}]
#set_property PACKAGE_PIN W18 [get_ports {StateLED[4]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {StateLED[4]}]
set_property PACKAGE_PIN U15 [get_ports {LLED}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LLED}]
set_property PACKAGE_PIN U14 [get_ports {RLED}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {RLED}] 
set_property PACKAGE_PIN V14 [get_ports {sLED}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sLED}]
	
#UNUSED
#set_property PACKAGE_PIN V13 [get_ports {led[8]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
#set_property PACKAGE_PIN V3 [get_ports {led[9]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]


set_property PACKAGE_PIN W3 [get_ports {Y[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Y[0]}]
set_property PACKAGE_PIN U3 [get_ports {Y[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Y[1]}]
set_property PACKAGE_PIN P3 [get_ports {Y[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Y[2]}] 
set_property PACKAGE_PIN N3 [get_ports {Y[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Y[3]}]
set_property PACKAGE_PIN P1 [get_ports {Y[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Y[4]}]
set_property PACKAGE_PIN L1 [get_ports {Y[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Y[5]}]
	
#BUTTON
set_property PACKAGE_PIN J1 [get_ports BtnClk] 
set_property IOSTANDARD LVCMOS33 [get_ports BtnClk] 
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets BtnClk_IBUF]
	
##CLK
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	
	

#SEVEN SEGMENT DISPLAY 
set_property PACKAGE_PIN U2 [get_ports {AN[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]
set_property PACKAGE_PIN U4 [get_ports {AN[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property PACKAGE_PIN V4 [get_ports {AN[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property PACKAGE_PIN W4 [get_ports {AN[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]

set_property PACKAGE_PIN W7 [get_ports {Display[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Display[7]}]
set_property PACKAGE_PIN W6 [get_ports {Display[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Display[6]}]
set_property PACKAGE_PIN U8 [get_ports {Display[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Display[5]}]
set_property PACKAGE_PIN V8 [get_ports {Display[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Display[4]}]
set_property PACKAGE_PIN U5 [get_ports {Display[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Display[3]}]
set_property PACKAGE_PIN V5 [get_ports {Display[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Display[2]}]
set_property PACKAGE_PIN U7 [get_ports {Display[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Display[1]}]
	
set_property PACKAGE_PIN V7 [get_ports {Display[0]}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {Display[0]}]