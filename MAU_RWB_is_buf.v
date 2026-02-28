`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:49:13
// Design Name: 
// Module Name: MAU_RWB_is_buf
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


module MAU_RWB_is_buf(
            input clk,
            input reset,
            
            input [31:0]PC,
            input [31:0]ld_result,
            input [31:0]alu_result,
            input [31:0]instruction,
            input is_load,
            
            input is_call,
            input is_wb,
            
            
            output reg [31:0]ld_result_out,
            output reg [31:0]alu_result_out,
            output reg [31:0]PC_out,
            output reg [31:0]instruction_out,
            output reg is_load_out,
            
            output reg is_call_out,
            output reg is_wb_out
            
            
        );
        
        always@(posedge clk or posedge reset)
            begin
                 if(reset==1)
                    begin
                        ld_result_out<=32'b0;
                        alu_result_out<=32'b0;
                        PC_out<=10'b0;
                        instruction_out<=32'b0;
                        
                        is_load_out<=1'b0;
                        
                        is_call_out<=1'b0;
                        is_wb_out<=1'b0;
                    end
                 else 
                    begin
                        ld_result_out<=ld_result;
                        alu_result_out<=alu_result;
                        PC_out<=PC;
                        instruction_out<=instruction;
                        
                        is_load_out<=is_load;
                        
                        is_call_out<=is_call;
                        is_wb_out<=is_wb;
                    end
            end
endmodule

