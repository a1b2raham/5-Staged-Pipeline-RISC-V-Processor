`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:24:51
// Design Name: 
// Module Name: PC_incrementor
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


module PC_incrementor #(parameter Data_width=32)
(

input wire [Data_width-1:0]IN_PC,

output reg [Data_width-1:0]Out_PC
);
    always@(*)
        begin
            Out_PC<=IN_PC+1;
         end

            
endmodule
