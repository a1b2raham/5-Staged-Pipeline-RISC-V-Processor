`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:39:08
// Design Name: 
// Module Name: IE_top_module
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



module IE_top_module(

    input [31:0] pc,
    output [31:0] pc_out,
    
    input [31:0] branch_target,
    output [31:0] branch_out,//absolute address not offset
    
    input [31:0] A,
    input [31:0] B,
    output [31:0] alu_result,
    
    output branch_taken,
    
    input [31:0] op2,
    output [31:0] op2_out,
    
    input [31:0] instruct,
    output [31:0] instruct_out,
    
    input [21:0] control,
    output isWb,
    output isLd,
    output isCall,
    output isSt
        );
    wire isEq,isGt,OV,zero,carry_out;    
    wire complete;
    Mux_2to1 #(.Data_width(32)) mux1 (.A(branch_target), .B(A),.control(control[4]),
                                        .out(branch_out)
                                        );
    
    
    ALU_top alu (.A(A), .B(B), .isAdd(control[9]), .isSub(control[10]),
                    .isCmp(control[11]), .isMul(control[12]), 
                    .isDiv(control[13]), .isMod(control[14]), 
                    .isLsr(control[16]), .isLsl(control[15]), 
                    .isAsr(control[17]), .isOr(control[18]), 
                    .isNot(control[20]), .isAnd(control[19]), 
                    .isMov(control[21]), .alu_out(alu_result),
                    .Eq(isEq),.Gt(isGt),     
                    .complete(complete)
                    );
                    
    Branch_unit branch_unit1(.isBeq(control[2]),.isBgt(control[3]),
                             .isUBranch(control[7]), .isEq(isEq),
                             .isGt(isGt), .is_branch_taken(branch_taken)
                             );  
                             
    assign instruct_out = instruct;
    assign op2_out = op2;
    assign pc_out = pc;
    assign isWb   = control[6];
    assign isLd   = control[1];
    assign isCall = control[8];
    assign isSt   = control[0];   
        
endmodule