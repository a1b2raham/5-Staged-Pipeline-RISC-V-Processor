`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:24:27
// Design Name: 
// Module Name: Mux_2to1
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

module Mux_2to1#(parameter Data_width=32)
(
input wire  [Data_width-1:0]A,
input wire  [Data_width-1:0]B,
input wire  control,
output wire [Data_width-1:0]out
);
    
    assign out=(control)? B : A;
     
    
endmodule
