
module multiplier_unit(
    input [31:0] A,
    input [31:0] B,
    input isMul,
    output reg [31:0] out
    );
    
    always@(*)
        begin
            if(isMul)
                out = A*B;
            else
                out = 32'b0;
        end
endmodule