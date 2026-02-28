`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:41:00
// Design Name: 
// Module Name: move_unit
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



module move_unit(
    input [31:0] B,
    input isMov,
    output reg [31:0] out
    );
    
    always@(*)
        begin
            if(isMov)
                out = B;
            else
                out = 32'b0;
        end
endmodule
