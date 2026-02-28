`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:47:57
// Design Name: 
// Module Name: MAU
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



module MAU( 
    input clk,     // clock signal 

    input is_load, // Load instruction control signal 
    input is_store,// Store instruction control signal
    
    input [31:0]op2,                // data from ALU
    input [31:0]alu_result,         // read address for Memory (RAM) coming from the ALU
    
    output reg [31:0]ld_result    // The data from the memory for register write back
    
    
    );
    
   parameter RAMsize=1024;
   reg [31:0] D_mem[RAMsize-1:0]; // size may change 

   
 
/*  initial 
    begin
        $readmemh("data_mem.mem",D_mem);       
    end
*/       
  
    always@(posedge clk)
        begin
            
            if(is_store==1)

                begin            
                        D_mem[alu_result[9:0]]<=op2; // write synchronously      
                end
                        
        end  
        
        always@(*)
            begin
                if(is_load==1)
                    begin
                        ld_result=D_mem[alu_result[9:0]]; // read asynchronously
                    end                   
                else 
                    begin
                        ld_result=32'd0;
                    end                   
            end       
        
        
          
                    
endmodule