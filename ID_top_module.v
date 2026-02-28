`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 10:33:36
// Design Name: 
// Module Name: ID_top_module
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



module ID_top_module(

            input wire [31:0]instruction_in, // input instruction 
            
            input wire [3:0]write_add,    // write address
            input wire [31:0] write_data, // write data
            input wire write, // write signal make sure to enable if writing (isWb from the RWB stage)
            
            input wire clk, // clock
            input wire RST, // RESET
            input wire [31:0]PC_in, // Program counter
      
           
    
           
    
            
           
           
            output [31:0]branchTarget,    // offset out for branch
        
            
            output [31:0]instruction_out,
            output [31:0]op2,           // data from the register read port 2 without coming from the mux (mux input is)
            output [21:0]control_out,   // signal from the control unit
            output [31:0]PC_out,         // for passing the original PC
            output [31:0]A_connection,  // data from the register read port 1
            output [31:0]B_connection   // rd_data_2 after going through mux
    );
    assign instruction_out=instruction_in;
    
    wire [26:0]offset_in;
    wire [17:0]imm_in;
    assign offset_in=instruction_in[26:0]; // from the instruction  Branch type
    assign imm_in=instruction_in[17:0];    // from the instruction  imm type
    
    wire [31:0]offset;
    wire [31:0]immx;
    wire [31:0]rd_data2;
    
    assign PC_out=PC_in;
    assign branchTarget=offset+PC_in;  // PC + offset
    
    wire [31:0]rd_data1;
    assign A_connection=rd_data1;
    
   wire [3:0]rs1;// source register 1
   wire [3:0]rs2;// source register 2
   wire [3:0]rd; // destination register
   wire [3:0]ra;  // return address
    
   assign rd=instruction_in[25:22]; 
   assign rs1=instruction_in[21:18];
   assign rs2=instruction_in[17:14];
   assign ra=4'b1111;
    
    wire [31:0]rd_data_2_mux; // output of this mux is connected to interstage B buffer
   // assign rd_data_2_mux=rd_data2;
    assign op2=rd_data2;
    
   
    wire [3:0]A_mux_out; // start mux output
    wire [3:0]B_mux_out; // start mux output
    wire isImmediate;// from controll unit
    
    
    
   // controll unit_signals
   wire isSt_out;
   wire isLd_out;
   wire isBeq_out;
   wire isBgt_out;
   wire isRet_out;
   wire isImmediate_out;
   wire isWb_out;
   wire isUbranch_out;
   wire isCall_out;
   
   assign control_out[0]=isSt_out;
   assign control_out[1]=isLd_out;
   assign control_out[2]=isBeq_out;
   assign control_out[3]=isBgt_out;
   assign control_out[4]=isRet_out;
   assign control_out[5]=isImmediate_out;
   assign control_out[6]=isWb_out;
   assign control_out[7]=isUbranch_out;
   assign control_out[8]=isCall_out;
   
   
    
    // ALU Control Signals
   wire isAdd_out;
   wire isSub_out;
   wire isCmp_out;
   wire isMul_out;
   wire isDiv_out;
   wire isMod_out;
   wire isLsl_out;
   wire isLsr_out;
   wire isAsr_out;
   wire isOr_out;
   wire isAnd_out;
   wire isNot_out;
   wire isMov_out;
   
   assign control_out[9]=isAdd_out;
   assign control_out[10]=isSub_out;
   assign control_out[11]=isCmp_out;
   assign control_out[12]=isMul_out;
   assign control_out[13]=isDiv_out;
   assign control_out[14]=isMod_out;
   assign control_out[15]=isLsl_out;
   assign control_out[16]=isLsr_out;
   assign control_out[17]=isAsr_out;
   
   assign control_out[18]=isOr_out;
   assign control_out[19]=isAnd_out;
   assign control_out[20]=isNot_out;
   assign control_out[21]=isMov_out;
  
    
    
    Mux_2to1 #(.Data_width(4)) m1 (.A(rs1),.B(ra),.control(isRet_out),.out(A_mux_out));
    
    Mux_2to1 #(.Data_width(4)) m2 (.A(rs2),.B(rd),.control(isSt_out),.out(B_mux_out));
    
    reg_bank bank(
                  .rd1_add(A_mux_out), // read port address1
                  .rd2_add(B_mux_out), // read port address2
                  .wrData(write_data), // write data
                  .wrAdd(write_add),   // write data address
                  .write(write),        // write signal
                  .clk(clk),          // clock
                  .RST(RST),          // reset the read ports
                  .data_out1(rd_data1), // data out for reading 1
                  .data_out2(rd_data2)  // data out for reading 2
           
            );
    
    sign_extend se1(
                    .imm(imm_in),
                    .offset(offset_in),
                    .off_ext(offset),
                    .imm_ext(immx)
                    );
                    

   
      Mux_2to1  #(.Data_width(32)) // output of this mux is connected to interstage B buffer
                m3 (.A(rd_data2),.B(immx),
               .control(isImmediate_out),
               .out(B_connection)); // goes to B register in interstage buffer
     
       control_unit CU(


            // Inputs from the Instruction Register
            .opcode(instruction_in[31:27]), // op5, op4, op3, op2, op1
            .I(instruction_in[26]),            // Immediate bit
        
            // Control Signal Outputs
            .isSt(isSt_out),
            .isLd(isLd_out),
            .isBeq(isBeq_out),
            .isBgt(isBgt_out),
            .isRet(isRet_out),
            .isImmediate(isImmediate_out),
            .isWb(isWb_out),
            .isUbranch(isUbranch_out),
            .isCall(isCall_out),
            
            // ALU Control Signals
            .isAdd(isAdd_out),
            .isSub(isSub_out),
            .isCmp(isCmp_out),
            .isMul(isMul_out),
            .isDiv(isDiv_out),
            .isMod(isMod_out),
            .isLsl(isLsl_out),
            .isLsr(isLsr_out),
            .isAsr(isAsr_out),
            .isOr(isOr_out),
            .isAnd(isAnd_out),
            .isNot(isNot_out),
            .isMov(isMov_out)
);
    
endmodule
