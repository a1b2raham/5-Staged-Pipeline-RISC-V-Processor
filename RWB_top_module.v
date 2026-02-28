`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2026 16:30:49
// Design Name: 
// Module Name: RWB_top_module
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


module RWB_top_module(
            input [31:0]PC_in,
            input [31:0]ld_result_in,
            input [31:0]Alu_result_in,
            input [31:0]instruction_in,
            input isCall_in,
            input isLd_in,
            input isWb_in,
            
            output [31:0]data,
            output [3:0]dest_addr,
            output isWb_out
    );
    
    
    wire [31:0]not_used;
    assign not_used=32'b0; // Not use currently
    
    wire [3:0]ra_15;
    assign ra_15=4'b1111;
    assign isWb_out=isWb_in;
    
    wire [31:0]next_PC;
    assign next_PC=PC_in+31'd1;
    
    mux_4to1 #(.data_width(32)) m1(
        .alu_result(Alu_result_in), // result from alu operation o data
        .ld_result(ld_result_in),  // data loaded from the RAM
        .PC(next_PC),         // The value of the PC from the Return address register
        .not_used(not_used),    // currently not used
        .is_load(isLd_in),
        .is_call(isCall_in),
        
        .data(data) 
         );
    
    multiplexer_2to1 #(.Data_width(4)) m2 (
    .A(instruction_in[25:22]),
    .B(ra_15),
    .control(isCall_in),
    .out(dest_addr)
    );
    
    
    
endmodule
