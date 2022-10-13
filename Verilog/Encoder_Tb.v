module Encoder_Tb; 
	wire [0:3] X;
	reg [0:15] In;

	Encoder Encoder_Dut(X,In);
	initial begin	
	#0 In = 16'b0000000000000001;
	#5 In = 16'b0000000000000010;
	#5 In = 16'b0000000000000100;
	#5 In = 16'b0000000000001000;
	#5 In = 16'b0000000000010000;
	#5 In = 16'b0000000000100000;
	#5 In = 16'b0000000001000000;
	#5 In = 16'b0000000010000000;
	#5 In = 16'b0000000100000000;
	#5 In = 16'b0000001000000000;
	#5 In = 16'b0000010000000000;
	#5 In = 16'b0000100000000000;
	#5 In = 16'b0001000000000000;
	#5 In = 16'b0010000000000000;
	#5 In = 16'b0100000000000000;
	end
	initial
	begin
	$dumpfile("Encoder.vcd");	
	$dumpvars(0,Encoder_Dut);
	end
endmodule