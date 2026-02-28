module sign_extend(


    input [17:0] imm,
    input [26:0] offset,
    output [31:0] off_ext,
    output [31:0] imm_ext
    );
    
     assign imm_ext = {{14{imm[17]}} , imm};
     assign off_ext = {{5{offset[26]}} , offset};
endmodule