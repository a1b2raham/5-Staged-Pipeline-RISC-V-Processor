module CLA_4bit(
                            input [3:0]A,
                            input [3:0]B,
                            input Cin,
                            output [3:0]S,
                            output  Cout
                            );
                             
 
wire C0,C1,C2,C3;

assign C0=Cin;
wire P0,P1,P2,P3;
wire G0,G1,G2,G3;

assign G0=A[0]&B[0];
assign P0=A[0]^B[0];

assign C1=G0|((P0)&(C0));
assign G1=A[1]&B[1];
assign P1=A[1]^B[1];

assign C2=G1|(G0&P1)|(P1&P0&C0);
assign G2=A[2]&B[2];
assign P2=A[2]^B[2];

assign C3=G2|(G1&P2)|(G0&P2&P1)|(P2&P1&P0&C0);
assign G3=A[3]&B[3];
assign P3=A[3]^B[3];


assign Cout=G3|(G2&P3)|(G1&P3&P2)|(G0&P3&P2&P1)|(P3&P2&P1&P0&C0);

 assign S[0]=P0^C0;
 assign S[1]=P1^C1;
 assign S[2]=P2^C2;
 assign S[3]=P3^C3; 
 
 
endmodule