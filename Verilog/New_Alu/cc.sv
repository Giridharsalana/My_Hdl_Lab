`include "cc.v"
module code_converter_tb;
wire[7:0]y_out;
wire done;
reg [7:0]a_in;
reg en_in;
reg [3:0]temp_in;

code_converter dut(y_out,done,a_in,en_in);
initial
begin
	#5 en_in =1'b0; a_in = 8'b0001_0010; temp_in = 4'b0001;
$display("y_out =----- %b,done =---- %b,a_in = ---%b,en_in = ----%b",y_out, done,a_in,en_in);
         #5 en_in =1'b0; a_in = 8'b0010_0010; temp_in = 4'b0010;
$display("y_out =----- %b,done =---- %b,a_in = ---%b,en_in = ----%b",y_out, done,a_in,en_in);
 #5 en_in =1'b0; a_in = 8'b0100_0010; temp_in = 4'b0010;
$display("y_out =----- %b,done =---- %b,a_in = ---%b,en_in = ----%b",y_out, done,a_in,en_in);
 #5 en_in =1'b0; a_in = 8'b1000_0010; temp_in = 4'b0010;
$display("y_out =----- %b,done =---- %b,a_in = ---%b,en_in = ----%b",y_out, done,a_in,en_in);


	end
initial
$monitor("y_out = %d,done = %b,a_in = %b,en_in = %b",y_out, done,a_in,en_in);
endmodule