`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:36:44
// Design Name: 
// Module Name: ID_IE_is_buf
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



module ID_IE_is_buf(
    input clk,
    input rst,

  
    input [31:0] pc,
    input [31:0] branch,
    input [31:0] B,
    input [31:0] A,
    input [31:0] op_two,
    input [31:0] instruct,

   


    
    output reg [31:0] pc_out,
    output reg [31:0] branch_out,
    output reg [31:0] B_out,
    output reg [31:0] A_out,
    output reg [31:0] op_two_out,
    output reg [31:0] instruct_out,

    
    input [21:0] control,
    output reg [21:0] control_out
);


    always @(posedge clk or posedge rst) begin
        if (rst) begin

            pc_out       <= 32'd0;
            branch_out   <= 32'd0;
            A_out        <= 32'd0;
            B_out        <= 32'd0;
            op_two_out   <= 32'd0;
            instruct_out <= 32'd0;
            
            control_out <= 22'b0;
        end 
        else begin

            pc_out       <= pc;
            branch_out   <= branch;
            A_out        <= A;
            B_out        <= B;
            op_two_out   <= op_two;
            instruct_out <= instruct;

           
            control_out <= control;
        end
    end

endmodule