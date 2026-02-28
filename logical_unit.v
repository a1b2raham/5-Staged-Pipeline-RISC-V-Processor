
module logical_unit(

    input [31:0] A,B,
    input isNot,
    input isOr,
    input isAnd,
    output reg [31:0] out
    );
    
    
    always@(*)
    begin
        if(isNot)
            out = ~B;
        else if(isOr)
            out = A|B;
        else if (isAnd)
            out = A&B;
        else
            out = 32'b0;
    end
    
endmodule