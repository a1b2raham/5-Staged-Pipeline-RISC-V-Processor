
    module ASC(
            input  [31:0]A,
            input  [31:0]B,
            input isAdd,
            input isSub,
            input isCmp,
            input  carry_in,
            output reg [31:0]Output,
            output reg carry_out,
            output reg Eq,  // Flag will be one when A=B
            output reg Gt,  // Flag will be one when Value in A greater than that of B
            output reg OF,  // Overflow flag 
            output reg Zero // Flag will be one when A register value is Zero
            
        );
        
        reg [31:0]Areg;
        reg [31:0]Breg;
        reg Cin;
        wire [31:0]Op_CLA;
        wire Cout_CLA;
        
     // This CLA will be used for both addition and subtraction   
        
        Adder_unit #(.N(8)) DUT (
            .A(Areg),
            .B(Breg),
            .carry_in(Cin),
            .Sum(Op_CLA),
            .carry_out(Cout_CLA)
        );
        
      
        
        always@(*)
            begin
                if(isAdd)
                        begin
                                
                             Areg=A;
                             Breg=B;
                             Cin=carry_in;    
                             Zero=1'b0;
                             
                             OF=((~(A[31]^B[31])) & (A[31]^Op_CLA[31]));
                                    
                                    
                             
                           end
                           
                           
                  else if(isSub)begin
                    
                             Areg=A;
                             Breg=(~B);
                             Cin=1'b1;
                             Zero=1'b0;
                             
                             OF=1'b0;
                             
                            end
                            
                            
                   else if(isCmp)begin
                                Areg=A;
                                Breg=~B;
                                Cin=1;
                                
                                Eq=(A==B);
                                Gt=(A>B);
                                Zero=(A==0);
                                
                                OF=1'b0;
                           end
                   else 
                        begin
                                Areg=0;
                                Breg=0;
                                Cin=1'b0;
                                
                                     
                        end
                
            end
            
        
         always@(*)
            begin
                Output = Op_CLA;
                
                carry_out = Cout_CLA;
            end    
            
         
             
        
    endmodule
