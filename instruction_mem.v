`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:25:33
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem#(parameter data_width_PC=32)(
    input clk,
    
    
    input [data_width_PC-1:0] PC, 
    
    output [31:0] instruct
    
    );
    
    reg [31:0] I_mem [1023:0]; // need to change
    
    
initial 
    begin
        $readmemh("inst_mem_file.mem",I_mem);       
    end
    
assign instruct = I_mem[PC];
    
endmodule