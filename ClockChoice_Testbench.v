`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Thomas O'Donnell 
// 
// Create Date: 05/01/2023 08:46:57 PM
// Design Name: 
// Module Name: ClockChoice_TB_TO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ClockChoice_TB_TO();
    
      reg s, clk, BtnClk; 
      
      wire ClockChoice;
      
 ClockChoice_TO uut (s, ClockChoice, BtnClk, clk);
 
 initial
 begin
 $display ("Testbench start");
 $display (" s | clk | BtnClk | ClockChoice");
 {s, BtnClk, clk, ClockChoice} = 0;
  
 end

 always
 begin
 #10; // wait for 10 ns

 $display (" %d | %d | %d | %d ", 
 s, clk, BtnClk, ClockChoice);

 if ( ClockChoice == 1 ) //arbitrary stopping point that will never occur 
 begin
 $display ("Testbench end");
 $finish;
 end
 else
 begin 
       
           if ( (s && clk && BtnClk && ClockChoice) == 0) //always the initial case
                begin
                    s = 1; //free running mode is off. 
                end 
           else 
                begin
                    s = 0; //free running mode is on
                    ClockChoice = 1;  
                end
end  
end  
endmodule