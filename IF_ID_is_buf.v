`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:32:16
// Design Name: 
// Module Name: IF_ID_is_buf
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


module IF_ID_is_buf#(parameter PC_width=32)(
        
        input [PC_width-1:0]IN_PC,
        input [31:0]IN_Instruction,
        input clk,
        input reset_p,
        output reg [PC_width-1:0]OUT_PC,
        output reg [31:0]OUT_instruction
        
        
    );
    
    
    
    always@(posedge clk or posedge reset_p)
        begin  
        
            if(reset_p)
                begin
                    OUT_PC<=0;
                    OUT_instruction<=32'b0;
                end
            else 
                begin
                    OUT_PC<=IN_PC;
                    OUT_instruction<=IN_Instruction;
                end
                     
        end     
            
    
endmodule
