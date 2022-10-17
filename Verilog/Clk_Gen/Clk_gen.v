module Clk_Gen (
	Clk_Out,
);
	output reg Clk_Out;

	parameter Freq = 1000;

	initial begin
		Clk_Out = 1'b0;
	end

	always @(*) begin
		#Freq Clk_Out = ~Clk_Out;
	end
	
endmodule


module Clk_Gen_Tb;

	Clk_Gen Clk_Gen_Dut();

	initial begin
		$dumpfile("Clk_Gen.vcd");
		$dumpvars(0,Clk_Gen_Dut);
	end
	
endmodule 