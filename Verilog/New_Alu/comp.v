module comparator(output  reg [7:0]y_out,
                   output  reg carry,zero,
                   input [7:0] a_reg,b_reg,
                   input en_in);

always@(*) begin

	if (~en_in) begin
		if(a_reg < b_reg)
			begin y_out = 8'b00000001;carry = 1'b0;zero = 1'b0; end
		else if  (a_reg > b_reg)
		  begin y_out = 8'b10000000;carry = 1'b0;zero = 1'b0;end
		else 
			begin carry = 1'b0; zero = 1'b1;y_out = 8'b00000000;
			#10 force a_reg = 8'b00000000;
			end
	end
 	else begin 
		y_out = 8'b00000000;
		carry = 1'b0; zero = 1'b0;


	end
	end
endmodule