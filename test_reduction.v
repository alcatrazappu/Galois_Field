`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:30:31 05/31/2019 
// Design Name: 
// Module Name:    test_reduction 
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
module test_reduction();

	parameter N=12;
	parameter M=6;
	parameter OUT=(N/M)*(M/2+1);

	reg [N-1:0] in;
	wire [OUT-1:0] out;
	
	reduction #(.N(N),.M(M)) uut(.in(in),.out(out));
	
	initial begin
		in=12'b100100100100;
		$monitor("%d",out);
	end

endmodule
