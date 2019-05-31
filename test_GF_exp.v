`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:27 05/28/2019 
// Design Name: 
// Module Name:    test_GF_exp 
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
module test_GF_exp();

	reg [7:0] in;
	wire [7:0] out;
	
	GF_exp uut(.in(in),.out(out));
	
	initial begin
		in=8'hdf;
		$monitor("%d,%d",in,out);
	end

endmodule
