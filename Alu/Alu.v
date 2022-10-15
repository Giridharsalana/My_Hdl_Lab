module Arithmetic_Unit (
	Op,
	In1,
	In2,
	Out
);
	input [3:0] Op;
	input [7:0] In1,In2;
	output reg [7:0] Out;

	parameter Add = 4'b0001,
			  Sub = 4'b0010,
			  Mul = 4'b0011,
			  Div = 4'b0100;

	always @(Op or In1 or In2) begin
		case (Op)
			Add: Out = In1 + In2;
			Sub: Out = In1 - In2;
			Mul: Out = In1 * In2;
			Div: Out = In1 / In2;
			default: Out = In1 + In2;
		endcase
	end
endmodule  


module Arithmetic_Unit_Tb;

	reg [3:0] Op;
	reg [7:0] In1,In2;
	wire [7:0] Out;
	Arithmetic_Unit Arithmetic_Unit_Dut(Op,In1,In2,Out);

	initial begin

		// Case(1)
		#0
		Op  = 4'b0000;
		In1 = 8'b00000000;
		In2 = 8'b00000000;
		#5
		Op  = 4'b0001;
		In1 = 8'b00000001;
		In2 = 8'b00000001;
		#10
		Op  = 4'b0001;
		In1 = 8'b00000011;
		In2 = 8'b00001001;
	end
	initial begin
		$dumpfile("Alu.vcd");
		$dumpvars(0,Arithmetic_Unit_Dut);
	end
	initial 
		$monitor("Op = %b, In1 = %b, In2 = %b, Out = %b",Op,In1,In2,Out);
	
endmodule