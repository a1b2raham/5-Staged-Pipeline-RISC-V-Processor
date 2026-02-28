`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2026 16:10:14
// Design Name: 
// Module Name: reg_bank
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: If the register read address is same for both channels its not handled in this module
//              If prcessor try to write and read from the same location its not handled in this module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_bank(

input wire [3:0]rd1_add, // read port address1
input wire [3:0]rd2_add, // read port address2
input wire [31:0]wrData, // write data
input wire [3:0]wrAdd,   // write data address
input wire write,        // write signal
input wire clk,          // clock
input wire RST,          // reset the registers
output reg [31:0]data_out1, // data out for reading 1
output reg [31:0]data_out2  // data out for reading 2

                 
                           );
         
    
    
    
    reg [31:0] reg_file [0:15]; // 16 - > 32 bit registers
    
    
always@(*)

    begin
    
            
               data_out1 = reg_file[rd1_add]; // data out for reading
               
               data_out2 = reg_file[rd2_add]; // data out for reading
              
          
     
    end
  
        
        

        
    always @(posedge clk)
    
        begin
        
                if(RST==1)
                    begin
                        reg_file[0]<=32'd0;
                        reg_file[1]<=32'd0;
                        reg_file[2]<=32'd0;
                        reg_file[3]<=32'd0;
                        reg_file[4]<=32'd0;
                        reg_file[5]<=32'd0;
                        reg_file[6]<=32'd0;
                        reg_file[7]<=32'd0;
                        
                        reg_file[8]<=32'd0;
                        reg_file[9]<=32'd0;
                        reg_file[10]<=32'd0;
                        reg_file[11]<=32'd0;
                        reg_file[12]<=32'd0;
                        reg_file[13]<=32'd0;
                        reg_file[14]<=32'd0;
                        reg_file[15]<=32'd0;
                            
                    end
              else if(write==1)
                        begin
                    
                                 reg_file[wrAdd] <= wrData;  // Logic for writing into the regster
           
                        end
                        
               
        end
        
 endmodule