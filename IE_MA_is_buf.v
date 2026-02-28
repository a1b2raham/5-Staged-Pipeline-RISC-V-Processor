`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:45:35
// Design Name: 
// Module Name: IE_MA_is_buf
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


module IE_MA_is_buf(


    input clk,
    input rst,
    
    input [31:0] pc,
    input [31:0] alu_result,
    input [31:0] op2,
    input [31:0] instruction,
    input isLd,
    input isSt,
    input isCall,
    input isWb,
    
    output reg [31:0] pc_out,
    output reg [31:0] alu_result_out,
    output reg [31:0] op2_out,
    output reg [31:0] instruction_out,
    output reg isLd_out,
    output reg isSt_out,
    output reg isCall_out,
    output reg isWb_out
    );
    
    always@(posedge clk or posedge rst)
        begin
            if(rst)
                begin
                     pc_out <= 32'b00;
                     alu_result_out <= 32'b00;
                     op2_out <= 32'b00;
                     instruction_out <= 32'b00;
                     isLd_out <= 32'b00;
                     isSt_out <= 32'b00;
                     isCall_out <= 32'b00;
                     isWb_out <= 32'b00;
                end
            else
                begin
                     pc_out <= pc;
                     alu_result_out <= alu_result;
                     op2_out <= op2;
                     instruction_out <= instruction;
                     isLd_out <= isLd;
                     isSt_out <= isSt;
                     isCall_out <= isCall;
                     isWb_out <= isWb;
                end
        
        end
    
endmodule
