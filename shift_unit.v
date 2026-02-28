module shift_unit(
    input [31:0] A,
    input [31:0] B,
    input isLsl,
    input isLsr,
    input isAsr,
    output reg [31:0] out
    );
    
    always@(*)
        begin
            if(isLsl)
                out = A << B;
            else if(isLsr)
                out = A >> B;
            else if(isAsr)
                out = $signed(A) >>> B;
            else
                out = 32'b0;   
        end
    
    
    
    
endmodule