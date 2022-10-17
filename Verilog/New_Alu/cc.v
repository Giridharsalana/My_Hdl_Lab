module code_converter(output reg [7:0]y_out,
            output reg done,
            input [7:0] a_in,
            input en_in);
  
  always@(*)
    begin
 //y_out = 8'b00000000;
      if(!en_in)
        begin
          $display("In If");
	done =1'b1;
        		
if(a_in[3:0] == 4'b0001)
          
         begin
                y_out[3] = a_in[7];
                y_out[2] = a_in[7]^a_in[6];
               y_out[1] = a_in[6]^a_in[5];
               y_out[0] = a_in[5]^a_in[4];
            end

/* bcd to xs_3
	     if(temp == 4'b0001) binary to gray */

      else if(a_in[3:0] ==4'b0010)
		begin
			y_out = 8'b00000000;
              case(a_in[7:4])
        4'b0000 :  y_out =8'b0011;
	 4'b0001 : y_out = 8'b0100;
         4'b0010 : y_out = 8'b0101;
	 4'b0011 : y_out = 8'b0110;
	 4'b0100 : y_out = 8'b0111;
	 4'b0101 : y_out = 8'b1000;
 	 4'b0110 : y_out = 8'b1001;
 	 4'b0111  : y_out = 8'b1010;           
	 4'b1000 :  y_out =8'b1011;
	 4'b1001 : y_out = 8'b1100;
         4'b1010 : y_out = 8'b1101;
	 4'b1011 : y_out = 8'b1110;
	 4'b1100 : y_out = 8'b1111;
	 4'b1101 : y_out = 8'b10000;
 	 4'b1110 : y_out = 8'b10001;
 	 4'b1111  : y_out =8'b10010;
 endcase

		end // elseif end
// binary to xs-5
	else if (a_in[3:0] == 4'b0100)
		begin
  			case(a_in[7:4])
			       	4'b0000 :  y_out =8'b0101;
				 4'b0001 : y_out = 8'b0110;
        			 4'b0010 : y_out = 8'b0111;
				 4'b0011 : y_out = 8'b1000;
				 4'b0100 : y_out = 8'b1001;
				 4'b0101 : y_out = 8'b1010;
 			 	 4'b0110 : y_out = 8'b1011;
			 	 4'b0111  : y_out = 8'b1100;
				 4'b1000 :  y_out =8'b1101;
				 4'b1001 : y_out = 8'b1110;
      			        4'b1010 : y_out = 8'b01100101;
				 4'b1011 : y_out = 8'b01100110;
			 4'b1100 : y_out = 8'b01100111;
				 4'b1101 : y_out = 8'b01101000;
			 	 4'b1110 : y_out = 8'b01101001;
			 	 4'b1111  : y_out =8'b01110000;

        
  			endcase   // case end
		end // elseif 0100 end
//binary to bcd
	else if(a_in[3:0] == 4'b1000)
		begin
			case(a_in[7:4])
 			       	4'b0000  :  y_out =8'b0000;
				 4'b0001 : y_out = 8'b0001;
                                4'b0010 : y_out = 8'b0010;
	     			 4'b0011 : y_out = 8'b0011;
	 			4'b0100 : y_out = 8'b0100;
	 			4'b0101 : y_out = 8'b0101;
 	 			4'b0110 : y_out = 8'b0110;
 	 			4'b0111  : y_out = 8'b0111;           
	 			4'b1000 :  y_out =8'b1000;
	 			4'b1001 : y_out = 8'b1001;
         			4'b1010 : y_out = 8'b00010000;
	 			4'b1011 : y_out = 8'b00010001;
	 			4'b1100 : y_out = 8'b00010010;
	 			4'b1101 : y_out = 8'b00010011;
 	 			4'b1110 : y_out = 8'b00010100;
				4'b1111: y_out = 8'b00010101;
			endcase
end // elsif end 1000*/
//else begin  y_out = 8'b00000000;end */
        end // en_in if end
else begin  y_out = 8'b00000000;end 
    end // always end
endmodule