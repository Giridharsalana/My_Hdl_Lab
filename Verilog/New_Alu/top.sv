module top_module_tb;
wire [7:0]y_out;
wire carry,zero,done;
reg [7:0] accum,b_reg;
reg[3:0]a_in;
reg in_it,mux_s;
wire [7:0] mux_o;
top_module arthmetic( y_out,carry,zero,done,mux_o,accum,b_reg,in_it,mux_s,a_in);

initial
begin
/*#5 a_in =4'b0001; accum = 255;b_reg =255;n1 =1'b0;
 #5 a_in =4'b0010; accum =8'b10000010; b_reg = 8'b10101010; n1 = 1'b0;in_it =1'b0;
 #5 a_in =4'b0101; accum =8'b10110011; b_reg = 8'b0011; n3 = 1'b0;in_it = 1'b0;
#5 a_in =4'b1100; accum = 8'b1010; b_reg = 8'b1010; comp_en =1'b0;in_it = 1'b0;
#5 a_in =4'b1100; accum = 8'b1010; b_reg = 8'b1011; comp_en =1'b0;in_it = 1'b0;
#5 a_in =4'b1100; accum = 8'b1011; b_reg = 8'b1010; comp_en =1'b0;in_it = 1'b0;
#5 a_in = 4'b1101; accum  = 8'b10101010; b_reg= 8'b00010001; shift_en =1'b0; in_it = 1'b0;
#5 a_in = 4'b1101; accum  = 8'b10101010; b_reg= 8'b01000001; shift_en =1'b0; in_it = 1'b0;
#5  a_in = 4'b1101;accum  = 8'b10101110; b_reg= 8'b10000001; shift_en =1'b0;  in_it = 1'b0;
#5  a_in = 4'b1101; accum  = 8'b10100000; b_reg= 8'b00010001; shift_en =1'b0; in_it = 1'b1;
 #5 b_reg = 8'b01101110; mux_s = 1'b0;
#5 b_reg = 8'b11110000; mux_s = 1'b1;
#5  b_reg = 8'b10000001;converter_en= 1'b0;a_in = 4'b1101;
#5  b_reg = 8'b00010010;converter_en= 1'b0 ; a_in = 4'b1101;
#5  b_reg = 8'b00100100;converter_en= 1'b0;a_in = 4'b1101;
#5  b_reg = 8'b01001000;converter_en= 1'b1;a_in = 4'b1101;*/

			#2 a_in = 4'b0000; in_it = 1'b0; accum = 255;b_reg =255;
			#2 a_in = 4'b0001; in_it = 1'b0; accum = 155;b_reg =25;
			#2 a_in = 4'b0010; in_it = 1'b0; accum = 5;b_reg =25;
			#2 a_in = 4'b0011; in_it = 1'b0; accum = 25;b_reg =5;
			#2 a_in = 4'b0100; in_it = 1'b0; accum = 50;b_reg =5; 
	 		#2 a_in = 4'b0101; in_it = 1'b0; accum = 5;b_reg =5;
			#2 a_in = 4'b0110; in_it = 1'b0; accum = 5;b_reg =5;
			#2 a_in = 4'b0111; in_it = 1'b0; accum = 5;b_reg =5;
			#2 a_in = 4'b1000; in_it = 1'b0; accum = 5;b_reg =5;
			#2 a_in = 4'b1001; in_it = 1'b0; accum = 5;b_reg =5;
			#2 a_in = 4'b1010; in_it = 1'b0; accum = 5;b_reg =5;
			#2 a_in = 4'b1011; in_it = 1'b0; accum = 5;b_reg =5; 
			#2 a_in = 4'b1100; in_it = 1'b0;accum = 10;b_reg =5; 
			#2 a_in = 4'b1100; in_it = 1'b0;accum = 50;b_reg =5;//comp_en = 1'b0;
			#2 a_in = 4'b1100; in_it = 1'b0;accum = 10;b_reg =55;// comp_en = 1'b0;
			#2 a_in = 4'b1100; in_it = 1'b0;accum = 10;b_reg =10;//comp_en = 1'b0;

			#2 a_in = 4'b1101; in_it = 1'b0;accum = 10;b_reg =5;
			#2 a_in = 4'b1110; in_it = 1'b0;accum = 10;b_reg =5;
			#2 a_in = 4'b1111; in_it = 1'b0;accum = 10;b_reg =5;
  				#2 a_in = 4'b1100; in_it = 1'b0;accum = 50;b_reg =5;//comp_en = 1'b0;
			#2 a_in = 4'b1100; in_it = 1'b0;accum = 10;b_reg =55;// comp_en = 1'b0;
			#2 a_in = 4'b1100; in_it = 1'b0;accum = 10;b_reg =10;//comp_en = 1'b0;

			#2 a_in = 4'b1101; in_it = 1'b0;accum = 10;b_reg =8'b00010001;
 			#2 a_in = 4'b1101; in_it = 1'b0;accum = 10;b_reg =8'b00100001;
 			#2 a_in = 4'b1101; in_it = 1'b0;accum = 10;b_reg =8'b01000001;
			#2 a_in = 4'b1101; in_it = 1'b0;accum = 10;b_reg =8'b10000001;
			#2 a_in = 4'b1110; in_it = 1'b0;accum = 8'b10100001;b_reg = 8'b00010001;mux_s = 1'b0;
			#2 a_in = 4'b1110; in_it = 1'b0;accum = 8'b10100010;b_reg =8'b00100010;mux_s =1'b0;
			#2 a_in = 4'b1110; in_it = 1'b0;accum = 8'b10100001;b_reg =8'b01000100;mux_s = 1'b1;
			#2 a_in = 4'b1110; in_it = 1'b0;accum = 8'b10100010;b_reg =8'b10001000;mux_s = 1'b1;
			#2 a_in = 4'b1111; in_it = 1'b0;accum = 10;b_reg =5;




                                  

end
initial
$monitor("y_out = %d,carry = %b zero = %b,done= %b,accum= %d,b_reg = %b,a_in =%b\n",y_out,carry,zero,done,accum,b_reg,a_in);
endmodule