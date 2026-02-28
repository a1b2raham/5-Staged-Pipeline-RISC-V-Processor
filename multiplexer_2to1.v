`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2026 18:17:53
// Design Name: 
// Module Name: multiplexer_2to1
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


module multiplexer_2to1 #(parameter Data_width=4)
(
input  [Data_width-1:0]A,
input  [Data_width-1:0]B,
input  control,
output [Data_width-1:0]out
);
    
    assign out=(control)? B : A;
     
    
endmodule

