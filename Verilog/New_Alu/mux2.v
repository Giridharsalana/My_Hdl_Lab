module  mux_2x1(output  reg [7:0]y,
		input [7:0]s_out,b_in,
		input s_in);
always@(*)
	begin
		case(s_in)
		1'b0: y= s_out;
		1'b1: y = b_in;
		endcase
	end
endmodule