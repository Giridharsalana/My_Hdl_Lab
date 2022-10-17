module shift_rotate(output reg[7:0] y_out,
                    input[7:0] a_reg,b_reg,
                    input en_in);
// mode = 0001 : left shift
// mode = 0010: right shift
// mode = 0100: right rotate
// mode = 1000: left rotate

wire [3:0]mode;
assign mode = b_reg[7:4];

always@(*)
begin
if (en_in ==0)
begin
if(mode == 4'b0001) begin
y_out = a_reg<<b_reg[3:0]; end
else if (mode == 4'b0010)
begin y_out =a_reg>> b_reg[3:0];end

/*if( mode == 4'b0001)
case(b_reg[3:0])
4'b0000 :y_out = a_reg<<4'b0000;
4'b0001 :y_out = a_reg<<4'b0001;
4'b0010 :y_out = a_reg<<4'b0010;
4'b0011 :y_out = a_reg<<4'b0011;
4'b0100 :y_out = a_reg<<4'b0100;
4'b0101 :y_out = a_reg<< 4'b0101;
4'b0110: y_out = a_reg << 4'b0110;
4'b0111: y_out = a_reg <<4'b0111;
4'b1000: y_out = a_reg<< 4'b1000;
default: y_out = 8'b00000000;
endcase
// y_out = b_reg>>;
 else if(mode == 4'b0010)
case(b_reg[3:0])
4'b0000 :y_out = a_reg>>4'b0000;
4'b0001 :y_out = a_reg>>4'b0001;
4'b0010 :y_out = a_reg>>4'b0010;
4'b0011 :y_out = a_reg>>4'b0011;
4'b0100 :y_out = a_reg>>4'b0100;
4'b0101 :y_out = a_reg>> 4'b0101;
4'b0110: y_out = a_reg>> 4'b0110;
4'b0111: y_out = a_reg>>4'b0111;
4'b1000: y_out = a_reg>> 4'b1000;
default: y_out = 8'b00000000;
endcase*/
else if(mode == 4'b0100) begin
case(b_reg[3:0])
0000:y_out = a_reg[7:0];
0001:y_out = {a_reg[0],a_reg[7:1]};
010:y_out = {a_reg[1:0],a_reg[7:2]};
0011:y_out ={a_reg[2:0],a_reg[7:3]};
0100:y_out ={a_reg[3:0],a_reg[7:4]};
0101:y_out = {a_reg[4:0],a_reg[7:5]};
0110:y_out = {a_reg[5:0],a_reg[7:6]};
0111:y_out = {a_reg[6:0],a_reg[7]}; 
1000:y_out = a_reg[7:0];
1001:y_out = {a_reg[0],a_reg[7:1]};
1010:y_out = {a_reg[1:0],a_reg[7:2]};
1011:y_out ={a_reg[2:0],a_reg[7:3]};
1100:y_out ={a_reg[3:0],a_reg[7:4]};
1101:y_out = {a_reg[4:0],a_reg[7:5]};
1110:y_out = {a_reg[5:0],a_reg[7:6]};
1111:y_out = {a_reg[6:0],a_reg[7]}; 
default: y_out = a_reg;
endcase 
end
else if(mode == 4'b1000) begin
case(b_reg[3:0])
0000:y_out = a_reg[7:0];
0001:y_out = {a_reg[6:0],a_reg[7]};
0010:y_out = {a_reg[5:0],a_reg[7:6]};
0011:y_out ={a_reg[4:0],a_reg[7:5]};
0100:y_out ={a_reg[3:0],a_reg[7:4]};
0101:y_out = {a_reg[2:0],a_reg[7:3]};
0110:y_out = {a_reg[1:0],a_reg[7:2]};
0111:y_out = {a_reg[0],a_reg[7:1]}; 
1000:y_out = a_reg[7:0];
1001:y_out = {a_reg[6:0],a_reg[7]};
1010:y_out = {a_reg[5:0],a_reg[7:6]};
1011:y_out ={a_reg[4:0],a_reg[7:5]};
1100:y_out ={a_reg[3:0],a_reg[7:4]};
1101:y_out = {a_reg[2:0],a_reg[7:3]};
1110:y_out = {a_reg[1:0],a_reg[7:2]};
1111:y_out = {a_reg[0],a_reg[7:1]};
default y_out = a_reg; 
endcase
end
else begin y_out = 8'b0000000; end
 end // if en_in ends
end  // always ends
endmodule