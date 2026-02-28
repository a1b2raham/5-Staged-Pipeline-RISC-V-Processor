`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:41:31
// Design Name: 
// Module Name: Adder_unit
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



module Adder_unit #(parameter N=8)(
        input wire [31:0]A,
        input wire [31:0]B,
        
        input wire carry_in,
        output wire [31:0]Sum,
        output wire carry_out
       
    );
    
    wire int_carry[N:0];
    assign int_carry[0]=carry_in;
    assign carry_out=int_carry[N];
    genvar p;
    generate 
        for(p=0;p<N;p=p+1)begin : CLA_block
                CLA_4bit CLA(.A(A[p*4+:4]),.B(B[p*4+:4]),.Cin(int_carry[p]),.S(Sum[p*4+:4]),.Cout(int_carry[p+1]));
            // A[x +: 4]  ==  A[x+3 : x]

           end
    endgenerate
endmodule
