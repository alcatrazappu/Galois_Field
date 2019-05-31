`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:07:24 05/28/2019 
// Design Name: 
// Module Name:    GF_Add 
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
module GF_add(a,b,out);

	parameter N=8;
	
	input [N-1:0] a,b;
	output [N-1:0] out;
	
	assign out=a^b;

endmodule
