module artmetic(output reg [16:0]y_out,
   		
                input [7:0]a_reg,b_reg,
                 input en_in,
                input [1:0]s);
  reg [7:0] w,q;
//y_out = a_reg + b_reg;
     always@(*)
         begin
if(!en_in)
begin
    case(s)
         3'b01:y_out = a_reg + b_reg;
         3'b10:begin
			y_out = a_reg - b_reg;
                
               	end
             3'b11: y_out = a_reg*b_reg;
             3'b00: if(a_reg> b_reg) begin
                     y_out = a_reg/b_reg;
                      end
                    else
                     y_out = 0;
           default : begin y_out=0;  
end
              endcase
         end
         end        
endmodule
