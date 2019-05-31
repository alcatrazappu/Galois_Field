`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:11 05/28/2019 
// Design Name: 
// Module Name:    test_GF_log 
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
module test_GF_log();

	reg [7:0] in;
	wire [7:0] out;
	
	GF_log uut(.in(in),.out(out));
	
	initial begin
		in=8'h65;
		$monitor("%h,%h",in,out);
	end

endmodule
