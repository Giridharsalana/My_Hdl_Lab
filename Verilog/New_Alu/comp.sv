module comparator_tb;
reg [7:0]a_in,b_in;
wire [7:0]y_out;
wire carry,zero;
reg en_in;
comparator dut(y_out, carry,zero,a_in,b_in, en_in);
initial 
begin
#2 a_in =10; b_in= 13; en_in =1'b0;
$display(" y_out = %b,a_in = %b,b_in =%b, carry = %b,zero = %b", y_out, a_in,b_in,zero,carry); 
#2 a_in=10; b_in =10; en_in =1'b0;
#2 a_in= 13; b_in =10; en_in = 1'b0;
#2 a_in= 13; b_in =10; en_in = 1'b0;

end
initial
$monitor(" y_out = %b,a_in = %b,b_in =%b, carry = %b,zero = %b", y_out, a_in,b_in,carry,zero); 
endmodule