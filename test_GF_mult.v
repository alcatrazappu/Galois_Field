`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:31 05/29/2019 
// Design Name: 
// Module Name:    test_GF_add_p 
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
module test_GF_mult();

	parameter N=8;
	
	reg [N-1:0] a,b;
	reg [N:0] prim;
	wire [N-1:0] out;

	GF_mult #(.N(N)) uut(.a(a),.b(b),.prim(prim),.out(out));
	
	initial begin
		a=8'h5f;
		b=8'hd3;
		prim=9'h11d;
	end
endmodule
