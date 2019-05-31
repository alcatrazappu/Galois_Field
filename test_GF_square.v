`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:12:48 05/30/2019 
// Design Name: 
// Module Name:    test_GF_square 
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
module test_GF_square();

	parameter N=8;
	
	reg [N-1:0] in;
	reg [N:0] prim;
	wire [N-1:0] out;
	
	GF_square #(.N(N)) uut(.in(in),.prim(prim),.out(out));
	
	initial begin
		in=8'h3f;
		prim=9'h11d;
	end

endmodule
