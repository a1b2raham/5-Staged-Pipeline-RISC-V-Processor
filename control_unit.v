`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:34:17
// Design Name: 
// Module Name: control_unit
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


module control_unit(


    // Inputs from the Instruction Register
    input wire [4:0] opcode, // op5, op4, op3, op2, op1
    input wire I,            // Immediate bit

    // Control Signal Outputs
    output wire isSt,
    output wire isLd,
    output wire isBeq,
    output wire isBgt,
    output wire isRet,
    output wire isImmediate,
    output wire isWb,
    output wire isUbranch,
    output wire isCall,
    
    // ALU Control Signals
    output wire isAdd,
    output wire isSub,
    output wire isCmp,
    output wire isMul,
    output wire isDiv,
    output wire isMod,
    output wire isLsl,
    output wire isLsr,
    output wire isAsr,
    output wire isOr,
    output wire isAnd,
    output wire isNot,
    output wire isMov
);

    // Internal wires for opcode bits to match table nomenclature
    wire op5 = opcode[4];
    wire op4 = opcode[3];
    wire op3 = opcode[2];
    wire op2 = opcode[1];
    wire op1 = opcode[0];

    // --- Main Control Signals ---
    
    assign isSt        = (~op5 & op4 & op3 & op2 & op1);
    assign isLd        = (~op5 & op4 & op3 & op2 & ~op1);
    assign isBeq       = (op5 & ~op4 & ~op3 & ~op2 & ~op1);
    assign isBgt       = (op5 & ~op4 & ~op3 & ~op2 & op1);
    assign isRet       = (op5 & ~op4 & op3 & ~op2 & ~op1);
    assign isImmediate = I;
    
    // isCall is needed for isWb logic
    assign isCall      = (op5 & ~op4 & ~op3 & op2 & op1);

    // Complex logic for isWb: ~ (op5 + ~op5.op3.op1.(op4 + ~op2)) + isCall
    assign isWb        = ~(op5 | (~op5 & op3 & op1 & (op4 | ~op2))) | isCall;

    // isUbranch: op5.~op4.(~op3.op2 + op3.~op2.~op1)
    assign isUbranch   = (op5 & ~op4 & ((~op3 & op2) | (op3 & ~op2 & ~op1)));

    // --- ALU Signals ---

    // isAdd: ~op5.~op4.~op3.~op2.~op1 + ~op5.op4.op3.op2
    assign isAdd = (~op5 & ~op4 & ~op3 & ~op2 & ~op1) | (~op5 & op4 & op3 & op2);

    assign isSub = (~op5 & ~op4 & ~op3 & ~op2 & op1);
    assign isCmp = (~op5 & ~op4 & op3 & ~op2 & op1);
    
    assign isMul = (~op5 & ~op4 & ~op3 & op2 & ~op1);
    assign isDiv = (~op5 & ~op4 & ~op3 & op2 & op1);
    
    assign isMod = (~op5 & ~op4 & op3 & ~op2 & ~op1);
    assign isLsl = (~op5 & op4 & ~op3 & op2 & ~op1);
    
    assign isLsr = (~op5 & op4 & ~op3 & op2 & op1);
    assign isAsr = (~op5 & op4 & op3 & ~op2 & ~op1);
    
    assign isOr  = (~op5 & ~op4 & op3 & op2 & op1);
    assign isAnd = (~op5 & ~op4 & op3 & op2 & ~op1);
    
    assign isNot = (~op5 & op4 & ~op3 & ~op2 & ~op1);
    assign isMov = (~op5 & op4 & ~op3 & ~op2 & op1);

endmodule