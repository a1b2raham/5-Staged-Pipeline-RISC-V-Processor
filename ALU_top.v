`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2026 23:14:47
// Design Name: 
// Module Name: ALU_top
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


module ALU_top(
    input [31:0] A,
    input [31:0] B,
    input isAdd,
    input isSub,
    input isCmp,
    input isMul,
    input isDiv,
    input isMod,
    input isLsr,
    input isLsl,
    input isAsr,
    input isOr,
    input isNot,
    input isAnd,
    input isMov,
    output reg [31:0] alu_out,
    output reg complete,
    output wire Eq,
    output wire Gt
    );
    wire [31:0] t1,t2,t3,t4,t5,t6;
    
    multiplier_unit mul (A,B,isMul,t1);
    logical_unit log(.A(A), .B(B), .isOr(isOr), .isNot(isNot), .isAnd(isAnd), .out(t2));
    divider_unit divide(.A(A), .B(B) , .isDiv(isDiv),.isMod(isMod), .out(t3));
    shift_unit shift(.A(A), .B(B) , .isLsl(isLsl),.isLsr(isLsr),.isAsr(isAsr), .out(t4));
    move_unit mov(.B(B) ,.isMov(isMov), .out(t5));
    ASC adder(.A(A),.B(B), .isAdd(isAdd), .isSub(isSub), .isCmp(isCmp), .carry_in(1'b0),.Output(t6),.Eq(Eq), .Gt(Gt) );
    always@(*)
        begin
            if(isMul)
                begin
                    alu_out = t1;
                    complete = 1'b1;
                end
            else if(isOr || isAnd || isNot)
                begin
                    alu_out = t2;
                    complete = 1'b1;
                end
            else if( isDiv || isMod)
                begin
                    alu_out = t3;
                    complete = 1'b1;
                end
            else if ( isLsl || isLsr || isAsr)
                begin
                    alu_out = t4;
                    complete = 1'b1;
                end
            else if ( isMov )
                begin
                    alu_out = t5;
                    complete = 1'b1;
                end
           else if( isAdd || isSub || isCmp)
                begin
                    alu_out = t6;
                    complete = 1'b1;
                end     
            else
                alu_out = 32'b0;
                
        
        end
    
    
endmodule