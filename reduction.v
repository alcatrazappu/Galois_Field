`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:12:31 05/31/2019 
// Design Name: 
// Module Name:    reduction 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module reduction(in,out);
	
	function integer clog2;
		input integer value;
		begin
			value = value-1;
			for (clog2=0; value>0; clog2=clog2+1)
			value = value>>1;
		end
	endfunction
	
	parameter N=8;
	parameter M=4;
	parameter OUT=(N/M)*(M/2+1);
	parameter W=M/2;
	
	input [N-1:0] in;
	output [OUT-1:0] out;
	
	//wire [OUT-1:0] temp;
  
    initial begin
      $monitor("%d",OUT);
    end
	
	genvar i;
	generate
		for(i=0;i<N;i=i+M) begin: reduction
          asm #(.SIZE(M)) assembler(.in(in[i+:M]),.out(out[(i*(M/2+1)/M)+:(M/2)+1]));
		end
	endgenerate
	
	//assign out=temp;
endmodule
