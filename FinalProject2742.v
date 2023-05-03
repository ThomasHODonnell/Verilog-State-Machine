`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Thomas O'Donnell
// 
// Create Date: 04/20/2023 01:28:09 PM
// Module Name: FinalProject_TO
// Project Name: 2742 Final Project
// Additional Comments:
//  - This is the main module for the intersection controller. 
//  - This module includes the sequential, combinational, counter, and clocking modules. 
//////////////////////////////////////////////////////////////////////////////////


module FinalProject_TO (
    clk, BtnClk, X, reset, load, S, Y, RLED, LLED, StateLED, Display, AN, s, sLED
    );
    
    input clk, reset, load, s, BtnClk;  
    input [5:0]X; 
    input [0:3]S;
    
     output [5:0]Y; 
     output RLED, LLED, sLED; 
     output [7:0]Display;
     output [3:0]AN; 
     output [3:0]StateLED;  

     wire [5:0]Z;
     wire [1:0]J; 
     wire [3:0]W; 
     wire [2:0]T; 
         
     
     Sequential_TO Sequential_Unit (clk, reset, load, X, S, Z, RLED, LLED, StateLED, W, s, sLED, BtnClk);
     
     Combinational_TO Combinational_Unit (Z, Y); 
     
     SevenSegmentDisplay_TO Display (Z, Display, AN, J, W, s, T );  
     
//     ClockChoice_TO (s, ClockChoice, BtnClk, clk); 
     
//     Clk_div (clk, SlowedClock);  

     CountParam_TO (clk, J); 
     
//     Clk_div2 (clk, VerySlowedClock);
     
     CountParam_TO2 (clk, T); 
     
//     RunClk_TO ( clk, ClockChoice ); 
    
endmodule


module Sequential_TO (
    clk, reset, load, X, S, Z, RLED, LLED, StateLED, W, s, sLED, BtnClk
); 

    input clk, reset, load, s, BtnClk;    
    input [5:0]X; 
    input [0:3]S;
//    input [2:0]T; 
    
    output reg [5:0]Z; 
    output reg [3:0]StateLED;
    output reg RLED, LLED, sLED;
    output reg [3:0]W;  
    
    parameter R = 6'b000001; //R -> A
    parameter A = 6'b000001, B = 6'b000010, C = 6'b000100, D = 6'b001000;
    parameter E = 6'b010000, F = 6'b100000;
    
//   Weighted State Sequence: {A,B,E,C,A,D,E,C,A,F,E};

    ClockChoice_TO ( s, ClockChoice, BtnClk, clk ); 

initial
begin
    W = 'b0000; 
    Z = A; 
end  

            always@( posedge ClockChoice )
                begin  
                         
                         RLED <= reset; 
                         LLED <= load; 
                         sLED <= s;                         
                         
                    if ( reset )
                        begin                         
                            Z <= R;  
                            W <= 'b0000; 
                            StateLED <= 'b0000; 
                        end 
                    else if ( load ) 
                        begin 
                                 
                            W <= S;     
                                             
                        case(S)
                            4'b0000:
                                begin 
                                    Z <= A; 
                                    StateLED <= S; 
                                end 
                            4'b0001: 
                                begin 
                                    Z <= B; 
                                    StateLED <= S;  
                                end
                            4'b0010:
                                begin 
                                    Z <= E;
                                    StateLED <= S;
                                end                   
                            4'b0011:
                                begin 
                                    Z <= C;
                                    StateLED <= S;
                                end
                            4'b0100: 
                                begin 
                                    Z <= A;
                                    StateLED <= S;
                                end                                           
                            4'b0101: 
                                begin 
                                    Z <= D;
                                    StateLED <= S;
                                    W <= W + 1; 
                                end  
                            4'b0110: 
                                begin 
                                    Z <= E;
                                    StateLED <= S;
                                end                    
                            4'b0111: 
                                begin 
                                    Z <= C;
                                    StateLED <= S; 
                                end  
                            4'b1000: 
                                begin 
                                    Z <= A;
                                    StateLED <= S; 
                                end 
                            4'b1001:
                                begin 
                                    Z <= F;
                                    StateLED <= S;
                                end      
                            4'b1010: 
                                begin 
                                    Z <= E;
                                    StateLED <= S;
                                end
                            default: 
                                begin 
                                    Z <= A;
                                    StateLED <= S;
                                end  
                        endcase   
                      end    
                      
                    else 
                    begin 
                        if ( X != 'b000000 )  
                            begin
                               if ( X[0] ) 
                                  begin 
                                    Z <= A; 
                                    StateLED <= 'b0000; 
                                  end 
                               else if ( X[1] ) 
                                  begin 
                                    Z <= B;
                                    StateLED <= 'b0001; 
                                  end 
                               else if ( X[4] ) 
                                  begin 
                                    Z <= E;
                                    StateLED <= 'b0010; 
                                  end 
                               else if ( X[2] ) 
                                  begin 
                                    Z <= C;
                                    StateLED <= 'b0011; 
                                  end  
                               else if ( X[3] )
                                  begin 
                                    Z <= D; 
                                    StateLED <= 'b0101;
                                  end   
                               else 
                                  begin
                                    Z <= F; 
                                    StateLED <= 'b1001; 
                                  end 
                            end
                        else
                        begin 
                            StateLED <= W;
                        case(W)
                            
                            'b0000: 
                            begin 
                                Z <= A;
                                W <= W + 1;
                            end  
                            'b0001: 
                            begin 
                                Z <= B;
                                W <= W + 1;
                            end
                            'b0010:
                            begin 
                                Z <= E;
                                W <= W + 1;
                            end
                            'b0011: 
                            begin 
                                Z <= C;
                                W <= W + 1;
                            end
                            'b0100: 
                            begin 
                                Z <= A;
                                W <= W + 1;
                            end
                            'b0101: 
                            begin    
                                Z <= D;
                                W <= W + 1;
                            end
                            'b0110: 
                            begin 
                                Z <= E;
                                W <= W + 1;
                            end
                            'b0111:
                            begin 
                                Z <= C;
                                W <= W + 1;
                            end
                            'b1000:
                            begin 
                                Z <= A;
                                W <= W + 1;
                            end
                            'b1001: 
                            begin     
                                Z <= F;
                                W <= W + 1;
                            end
                            'b1010:
                            begin 
                                Z <= E;
                                W <= 'b0000; 
                            end                   
                            
                        endcase
                      end    
               end
        end 
endmodule

module Combinational_TO (
    Z, Y
); 

    input [5:0]Z; 
    output reg [5:0]Y;
    parameter A = 6'b000001, B = 6'b000010, C = 6'b000100, D = 6'b001000;
    parameter E = 6'b010000, F = 6'b100000;
        
    always@(Z)
        begin         
                
            case(Z)          
                A: 
                    begin
                        Y <= 6'b110010;  

                    end    
                B: 
                    begin 
                        Y <= 6'b110010;  
                    end 
                C: 
                    begin 
                        Y <= 6'b001100;                       
                    end 
                D: 
                    begin 
                        Y <= 6'b001100;  
                    end 
                E: 
                    begin 
                        Y <= 6'b110010;
                    end 
                F: 
                    begin 
                        Y <= 6'b000011;

                    end
                default: 
                    begin 
                        Y <= 6'b110010; 
                    end 
            endcase   
        end
endmodule 

module SevenSegmentDisplay_TO (
    Z, Display, AN, J, W, s, T //V
); 
    input s; 
    input [0:5]Z; 
    input [1:0]J;
    input [2:0]T; 
//    input [1:0]V; 
    input [3:0]W; 
    output reg [7:0]Display;
    output reg [3:0]AN;
    
    parameter A = 6'b000001, B = 6'b000010, C = 6'b000100, D = 6'b001000;
    parameter E = 6'b010000, F = 6'b100000;
       
    parameter Y1 = 6'b110010, Y2 = 6'b001100, Y3 = 6'b000011;     
    parameter N1 = 8'b10011111, N2 = 8'b00100101, N3 = 8'b00001101;
     
    parameter PSA = 8'b00010001, PSB = 8'b11000001, PSC = 8'b01100011; 
    parameter PSD = 8'b10000101, PSE = 8'b01100001, PSF = 8'b01110001;
    
    parameter zero = 'b00000011, one = 'b10011111, two = 'b00100101; 
    parameter three = 'b00001101, four = 'b10011001, five = 'b01001001; 
    parameter six = 'b01000001, seven = 'b00011111, eight = 'b00000001; 
    parameter nine = 'b00001001; 
    
    
    always @ ( J )
         begin 
                            case ( J )
                                'b00: 
                                    begin
                                    
                                              AN <= 4'b1110;                                                      
                                                                                          
                                    case (W)                                                                                                                                                                                                                                             
                                        'b0000: Display <= zero;                                        
                                        'b0001: Display <= one;                                         
                                        'b0010: Display <= two;                                         
                                        'b0011: Display <= three;                                       
                                        'b0100: Display <= four;                                        
                                        'b0101: Display <= five;                                        
                                        'b0110: Display <= six;                                         
                                        'b0111: Display <= seven;                                       
                                        'b1000: Display <= eight;                                       
                                        'b1001: Display <= nine;                                        
                                        'b1010: Display <= zero;                                        
                                                                                          
                                    endcase                                                                  
                                        
                                    end  
                                 'b01: 
                                    begin 
                                    
                                        AN <= 'b1101; 
                                                                                 
                                        case (T)                                        
                                        'b000: 
                                            begin
                                                Display <= five; 
                                            end 
                                        'b001: 
                                            begin
                                                Display <= four;
                                            end
                                        'b010: 
                                            begin
                                                Display <= three; 
                                            end  
                                        'b011: 
                                            begin
                                                Display <= two; 
                                            end
                                        'b100: 
                                            begin 
                                                Display <= one;
                                            end
                                        default: 
                                            begin 
                                                Display <= zero; 
                                            end 
                                     endcase       
                                       
                               
                                    end 
                                 'b10: 
                                    begin
                                    
                                                                                  
                                         AN <= 4'b1011;               
                                                              
                                        case (Z)                           
                                            A: Display <= N3;             
                                            B: Display <= N3;             
                                            C: Display <= N2;             
                                            D: Display <= N2;             
                                            E: Display <= N3;             
                                            F: Display <= N2;             
                                        endcase                           
                                                              
                                    
                                    end 
                                 'b11: 
                                    begin
                                    
                                              case(Z)                                          
                                             A:                                       
                                             begin                                    
                                                 Display <= PSA;                     
                                                AN <= 4'b0111;                      
                                            end                                      
                                               B:                                      
                                              begin                                   
                                                  Display <= PSB;                      
                                                  AN <= 4'b0111;                       
                                             end                                     
                                           C:                                       
                                               begin                                    
                                                  Display <= PSC;                      
                                                 AN <= 4'b0111;                       
                                            end                                      
                                            D:                                       
                                             begin                                    
                                                Display <= PSD;                      
                                                AN <= 4'b0111;                       
                                              end                                      
                                            E:                                       
                                           begin                                    
                                                  Display <= PSE;                      
                                                  AN <= 4'b0111;                       
                                            end                                      
                                            F:                                       
                                            begin                                    
                                                Display <= PSF;                      
                                                AN <= 4'b0111;                       
                                            end                                      
                                            default:                                 
                                            begin                                    
                                                Display <= PSA;                      
                                                AN <= 4'b0111;                       
                                            end                                      
                                    endcase                                           
                                    
                                    end      
                               endcase  
                          end       
     
endmodule 
 
module Clk_div (
     clk, SlowedClock
); 

    input clk;
    output reg SlowedClock;
    
    reg [19:0] count;
    always @(posedge clk)
    begin
    if (count == 200000)
    begin
    count <= 0;
    SlowedClock = ~SlowedClock;
    // Clock toggles, every 200000 positive edges of clk
    end
    else count <= count+1;
    end
    
endmodule

module CountParam_TO (                          
    clk, J                             
);                                              
    input clk;                         
    output reg [1:0]J;                          
                                                
    wire clock;                                 
                                                
    Clk_div(clk, SlowedClock);         
                                                
    always @( posedge SlowedClock )             
        begin                                   
            J <= J + 1;                         
        end                                     
                                                
endmodule 

module Clk_div2 (                                                      
     clk, VerySlowedClock                                        
);                                                                  
                                                                    
    input clk;                                             
    output reg VerySlowedClock;                                         
                                                                    
    reg [27:0] count;                                               
    always @(posedge clk)                                  
    begin                                                           
    if (count == 50000000)                                            
    begin                                                           
    count <= 0;                                                     
    VerySlowedClock = ~VerySlowedClock;                                     
    // Clock toggles, every 200000 positive edges of clk            
    end                                                             
    else count <= count+1;                                          
    end                                                             
                                                                    
endmodule


module CountParam_TO2 (                          
    clk, T                            
);                                              
    input clk;                         
    output reg [2:0]T;                          
                                                
    wire clock;                                 
                                                
    Clk_div2(clk, VerySlowedClock);         
        
    initial 
        begin
            T = 'b010; 
        end
                                                
    always @( posedge VerySlowedClock )             
        begin   
        
            if ( T == 'b100 ) 
                T <= 'b000; 
            else                               
            T <= T + 1;                         
        end                                     
                                                
endmodule     

module ClockChoice_TO ( 
    s, ClockChoice, BtnClk, clk 
); 

    input s, BtnClk, clk ; 
    output reg ClockChoice; 
    
    RunClk_TO ( clk, RunClk );  
    
    always @ ( posedge clk ) 
        begin         
            if ( s ) 
                ClockChoice = BtnClk; 
            else 
                ClockChoice = RunClk; 
        end
endmodule 

module RunClk_TO (
    clk, RunClk 
 );                                                                    
    input clk;                                             
    output reg RunClk;                                         
                                                                    
    reg [29:0] count;   
                                                   
    always @(posedge clk)                                  
    begin                                                           
    if (count == 250000000)                                            
        begin                                                           
            count <= 0;                                                     
            RunClk = ~RunClk;                                 
        end                                                             
    else    
        count <= count+1;                                          
    end                                                             
            
endmodule                                     

                                                                                          
