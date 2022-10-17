module logical ( output reg [7:0]y_out,
                 input [7:0]a_in,b_in,
                 input en_in,
                 input [2:0]s);
             always@(*)
               begin
		 if(!en_in)
			begin
  		
                 case(s)
                 3'b000: y_out = (~(a_in& b_in));
                 3'b001: y_out = (~(a_in|b_in));
                 3'b010: y_out =  (a_in^b_in);
                 3'b101: y_out  = (a_in&b_in);
                 3'b110: y_out = (a_in|b_in);
                 3'b111: y_out = ( !a_in);
                 default: y_out = 8'b00000000; 
                 endcase
end
                    /*if(s===3'b000) begin
                        y_out = ~(a_in& b_in); end
 else if(s == 3'b001) begin
 y_out = ~(a_in|b_in); end
 else if(s ==3'b010)begin
 y_out =  (a_in^b_in); end
else if (s == 3'b101) begin
y_out = (a_in&b_in); end
else if (s ==3'b110) begin
y_out = (a_in|b_in); end
else if (s == 3'b111) begin
 y_out = ( !a_in); end
else y_out =8'b00000000;
else y_out = 8'b00000000;*/  end
endmodule