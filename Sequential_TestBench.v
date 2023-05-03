`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Thomas O'Donnell 
// 
// Create Date: 04/21/2023 08:46:57 PM
// Design Name: 
// Module Name: FinalProject_TO_Sequential_TB
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
//      - Version 1 of my Sequential Testbench, intended to test the counting, reset, and load features. 
//////////////////////////////////////////////////////////////////////////////////


module FinalProject_TO_Sequential_TB(

    );
    
    reg reset, load, clk; 
      reg [5:0]X; 
      reg [3:0]S;
      
      wire [3:0]PState;
      wire [5:0]Z; 
 Sequential_TO uut (X, S, reset, load, clk, Z);
 
 initial
 begin
 $display ("Testbench start");
 $display (" R | L | -> S    | -> X        | -> Z");
 {X, S, load, reset} = 0;
  
// {reset} = 1; 
 end

 // Repeated Execution block
 always
 begin
 #10; // wait for 10 ns

 $display (" %d | %d | %d %d %d %d | %d %d %d %d %d %d | %d %d %d %d %d %d", 
 reset, load, S[3], S[2], S[1], S[0], 
 X[5], X[4], X[3], X[2], X[1], X[0], 
 Z[5], Z[4], Z[3], Z[2], Z[1], Z[0]);

 if (X == 5'b01011) 
 begin
 $display ("Testbench end");
 $finish;
 end
 else
 begin 
       
           
        if ( X == 5'b01011)
            begin
                load = 1; 
                X = X + 1;
            end
        if (reset) 
            begin 
                load = 1; 
                reset = 0; 
                X = X + 1; 
            end 
        if (load)
            begin
                S = S + 1; 
                X = X + 1; 
            end
           
        else 
            begin 
                reset = 0; 
                X = X + 1;  
            end 
            
end 
        
 end
    
endmodule
