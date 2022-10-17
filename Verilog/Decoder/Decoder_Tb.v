module Decoder_Tb; 
	wire [0:15] X;
	reg [3:0] In;

	Decoder Decoder_Dut(X,In);
	initial begin
		#0 In = 4'b0001;
		#2 In = 4'b0010;
		#2 In = 4'b0011;
		#2 In = 4'b0100;
		#2 In = 4'b0101;
		#2 In = 4'b0110;
		#2 In = 4'b0111;
		#2 In = 4'b1000;
		#2 In = 4'b1001;
		#2 In = 4'b1010;
		#2 In = 4'b1011;
		#2 In = 4'b1100;
		#2 In = 4'b1101;
		#2 In = 4'b1110;
		#2 In = 4'b1111;	
		#2 In = 4'b1111;
	end
	initial
	begin
	$dumpfile("Decoder.vcd");	
	$dumpvars(0,Decoder_Dut);
	end
endmodule