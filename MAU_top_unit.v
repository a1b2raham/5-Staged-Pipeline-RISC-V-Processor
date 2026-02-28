`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2026 16:30:24
// Design Name: 
// Module Name: MA_top_module
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


module MA_top_module(
                input clk,
                input [31:0]aluResult_in,
                input [31:0]op2_in,
                input [31:0]instruction_in,
                input isLd,
                input isSt,
                input isCall,
                input isWb,
                input [31:0]PC_in,
                
                output [31:0]ld_result_out,
                output [31:0]aluResult_out,
                output [31:0] PC_out,
                output isLd_out,
                output isCall_out,
                output isWb_out,
                output [31:0]instruction_out
               
    );
    
  
    wire [31:0]ldResult;
    
    
    assign PC_out=PC_in;                       
    assign instruction_out=instruction_in;  
    
    
    
    
    
   assign isLd_out=isLd;
   assign isCall_out=isCall;
   assign isWb_out=isWb;
   
   assign aluResult_out=aluResult_in;
  
   
    
   
    
    
    MAU M1( 
    
        .clk(clk),                   // clock signal 
          
        .is_load(isLd),              // Load instruction control signal 
        
        .is_store(isSt),             // Store instruction control signal
        
        .op2(op2_in),                // data from ALU
        
        .alu_result(aluResult_in),  // read address for Memory (RAM) coming from the ALU
        
        .ld_result(ld_result_out)    // The data from the memory for register write back
        
    
    );
    
    
    
    
    

    
endmodule
