`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2023 01:28:55 PM
// Design Name: 
// Module Name: Combinational_TB_TO
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


module Combinational_TB_TO( 
    );
    
      reg [5:0]X; 
      
      wire [5:0]Y; 
 Combinational_TO uut (X, Y); 


 // initialize inputs
 initial
 begin
 $display ("Testbench start");
 $display ("-> X       | -> Y");
 {X} = 1; 
 end

 // Repeated Execution block
 always
 begin
 #10; // wait for 10 ns

 $display ("%d %d %d %d %d %d| %d %d %d %d %d %d", 
 X[5], X[4], X[3], X[2], X[1], X[0], Y[5], Y[4], 
 Y[3], Y[2], Y[1], Y[0]);

 if ({X} == 'b100000) 
 begin
 $display ("Testbench end");
 $finish;
 end
 else
 begin 
    if (X == 1)
        X = X + 1; 
    else 
        X = X * 2; 
end 
        

 end
 endmodule

