`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:51:01
// Design Name: 
// Module Name: mux_4to1
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



module mux_4to1#(parameter data_width=32)(
        input [data_width-1:0]alu_result, // result from alu operation o data
        input [data_width-1:0]ld_result,  // data loaded from the RAM
        input [data_width-1:0]PC,         // The value of the PC from the Return address register
        input [data_width-1:0]not_used,    // currently not used
        input is_load,
        input is_call,
        
        output reg [data_width-1:0] data   
    );
    
    always@(*)
        begin
            case({is_call,is_load})
               
                    2'b00:data=alu_result;
                    2'b01:data=ld_result;
                    2'b10:data=PC+1; // since bit addressing
                    2'b11:data=0; // not used
                    default:data=0;
                    
                 endcase
                    
           end         
endmodule
