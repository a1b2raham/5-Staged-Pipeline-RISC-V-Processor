module divider_unit(
    input [31:0] A,
    input [31:0] B,
 
    input isDiv,
    input isMod,
    
    output reg [31:0] out,
    output reg overflow
    );
    
    always@(*)
        begin
            overflow = 1'b0;
            if(isDiv && B != 32'b0)
                out = A / B;   
            else if(isMod && B != 32'b0)
                out = A%B;
            else if(B==0)
                begin
                    out = 32'b0; 
                    overflow = 1'b1;
                end
            else
                out = 32'b0;    
        end
    
endmodule