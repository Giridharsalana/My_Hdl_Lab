module  mux_16x1(  output  reg[15:0]y_out,
		   // input [7:0]a0,
                   input [15:0] a0,a1,a2,a3,a4,
                    input[15:0] a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,
		  // input[7:0] a13,a15,
		   input[3:0]s);
		always@(*)
			begin
                        	case(s)
					4'b0000: y_out = a0;
					4'b0001: y_out = a1;
					4'b0010: y_out = a2;
					4'b0011:y_out = a3;
                                        4'b0100:y_out = a4;
                                        4'b0101:y_out = a5;
                                        4'b0110:y_out = a6;
                                        4'b0111:y_out = a7;
					4'b1000: y_out = a8;
					4'b1001: y_out = a9;
					4'b1010: y_out = a10;
					4'b1011:y_out = a11;
                                        4'b1100:y_out = a12;
                                        4'b1101:y_out = a13;
                                        4'b1110:y_out = a14;
                                        4'b1111:y_out = a15;
default: y_out =0;
				endcase
			end
endmodule