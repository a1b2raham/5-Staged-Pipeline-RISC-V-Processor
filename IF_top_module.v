`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:25:55
// Design Name: 
// Module Name: IF_top_module
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


module IF_top_module(


     input clk,
     input rst,
     input [31:0] branch,
     input control_branch,
     output [31:0] instruction,
     output [31:0] pc_out
    );
    

    wire [31:0] pc_plus;
    wire [31:0] mux_out; // mux_out == pc_in

    
    PC pc1(.in_PC(mux_out),
           .clk(clk),
           .reset_p(rst),
           .out_PC(pc_out)
           );
    PC_incrementor pc_inc (
                           .IN_PC(pc_out),
                           .Out_PC(pc_plus)
                           );
                    
    Mux_2to1 mux ( .A(pc_plus),
                   .B(branch),
                   .control(control_branch),
                   .out(mux_out)
                   );
    instruction_mem mem_instruct (
                                  .clk(clk),
                                  .PC(pc_out),
                                  .instruct(instruction)
                                  );
    
    
    
    
endmodule 

