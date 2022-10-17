`include "dec.v"
`include "arth.v"
`include"logic.v"
`include"comp.v"
`include"sr.v"
`include"mux2.v"
`include"cc.v"
`include"mux16.v"
module top_module(output[15:0] y_out,
	         // output [16:0]d_out,  // arthmetic block output
                 // output [7:0] l_out,  // logic block output
		 // output [7:0]comp_out, // comparator block
		 //output[7:0]shifter_out, //shifter block
	//	output [7:0] converter_out, // code converter block
		output carry_flag,zeroflag,done,
		output [7:0] mux_o,     // 2x1 mux
                  input[7:0]accum,b_reg,
		  input in_it, mux_s,
    		  input [3:0]a_in);





	wire[15:0] w,d_out,l_out;
	wire [7:0] comp_out;         // decoder instantantion 
	wire [16:0]arthmetic_output;    // arthmetic output
	wire n1;
	wire[7:0]n_out,shifter_out,converter_out;	 	// logic block output wire declaration
	wire n3;     			  // logic operatoins nor gate wire
	wire comp_en;       		 // comparator operation wire
	wire shift_en;			// shifer not gate wire
	wire converter_en;		// converter not gate
		
	//	wire[7:0] shifter_out;  	// shifter output wires
// decoder module instantation
	


	decoder in(w,a_in,in_it);     	// decoder module instantation
	nor n(n1,w[1],w[2],w[3],w[4]);	 // nor gate for artmetic block enable input



	nor n4(n3,w[5],w[6],w[7],w[8],w[9],w[10]);//  logical block nor gate is enabled 
 	// arthmetic block instantation
        artmetic block(arthmetic_output,accum,b_reg,n1,{a_in[1],a_in[0]} ); // arthmetic module instantantion
	assign carry_flag = arthmetic_output[8];
        assign d_out = arthmetic_output;

	
	// logic block instantation
 	logical block1(n_out,accum,b_reg,n3,a_in[2:0]); 
        assign l_out = n_out;

	
	// comparator instantation
	//not comp_not(comp_en,w[12]);
	comparator block2(comp_out,carry_flag,zero_flag,accum,b_reg,~w[12]);
	//assign comp_out = comp_out1;
  
	
	
	// shifter module instantation
	not shifter_not(shift_en,w[13]);
        shift_rotate block4(shifter_out,accum,b_reg,shift_en);

	
	// 2x1mux module instantation
        mux_2x1 block5(mux_o,shifter_out,b_reg,mux_s);

	// code converter module instantation
	//not converter_not(converter_en,w[14]);
	code_converter block6(converter_out,done,b_reg,~w[14]);

	
	// 16x1 multiplexer output block instantation
 	mux_16x1 block7(y_out,16'b0,d_out,d_out,d_out,d_out,l_out,l_out,l_out,l_out,l_out,l_out,16'b0,comp_out,shifter_out,converter_out,16'b1,a_in);
				
endmodule  