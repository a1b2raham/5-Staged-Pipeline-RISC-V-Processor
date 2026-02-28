`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2026 17:31:32
// Design Name: 
// Module Name: TB_CPU_Assembled
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


module TB_CPU_Assembled;

reg clk;
reg rst;
parameter s_delay=10;  //`timescale 1ns / 1ps
parameter clock_period=10; 


CPU_v1_wrapper DUV
        (
        .clk_0(clk),
        .rst_0(rst)
        );
        
        
        
        initial 
            begin
                clk=0;
                rst=1;
                #(s_delay);
                
                rst=0;
                
                
                
                
                
                
                
                
            end
                
        always #(clock_period/2) clk=~clk;      
endmodule
