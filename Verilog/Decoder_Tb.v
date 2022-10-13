module Decoder_Tb; 
	wire [0:15] X;
	reg [3:0] In;

	Decoder Decoder_Dut(X,In);
	initial begin
		#0 In = 4'b0001;
		#5 In = 4'b0010;
		#5 In = 4'b0011;
		#5 In = 4'b0100;
		#5 In = 4'b0101;
		#5 In = 4'b0110;
		#5 In = 4'b0111;
		#5 In = 4'b1000;
		#5 In = 4'b1001;
		#5 In = 4'b1010;
		#5 In = 4'b1011;
		#5 In = 4'b1100;
		#5 In = 4'b1101;
		#5 In = 4'b1110;
		#5 In = 4'b1111;	
	end
	initial
	begin
	$dumpfile("Decoder.vcd");	
	$dumpvars(0,Decoder_Dut);
	end
endmodule