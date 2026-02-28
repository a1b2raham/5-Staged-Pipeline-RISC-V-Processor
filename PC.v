`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:25:06
// Design Name: 
// Module Name: PC
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


module PC #(parameter Data_width=32)(
        
        input [Data_width-1:0]in_PC,      // program count from the branch unit
        
        input clk, // clock signal
        
        input reset_p, // reset the count
        
        output reg  [Data_width-1:0] out_PC // program count output
        

    );
    
    
    always@(posedge clk or posedge reset_p)
    
        begin
            
            if(reset_p) // reset the program counter
                begin 
                    out_PC<=32'd0;
                     // Make this count zero when doing synthesize because 
                    // In actual hardware the count actually starts from the value zero not 1
                end
            
            else
                begin
                      out_PC<=in_PC; //load the count from the branch unit                      
                end
         end
      
             
endmodule