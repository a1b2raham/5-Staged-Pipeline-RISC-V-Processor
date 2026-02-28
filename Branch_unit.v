
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:39:39
// Design Name: 
// Module Name: Branch_unit
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


module Branch_unit(

                   input wire isBeq,     // from CU
                   input wire isBgt,     // from CU
                   input wire isUBranch, // from CU
                   input wire isEq,   // from ALU
                   input wire isGt,   // from ALU
                   
                   output wire is_branch_taken // signal going to IF stage
                   
                   ); 
                   
                   
                  wire t1;
                  wire t2;
                  
                  and and1(t1,isBeq,isEq);
                  and and2(t2,isBgt,isGt);
                  
                  or or1(is_branch_taken,t1,t2,isUBranch);
                  
                            
                            
                            
                   
endmodule

