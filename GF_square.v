`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:07:42 05/30/2019 
// Design Name: 
// Module Name:    GF_square 
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
module GF_square(in,prim,out);

	parameter N=8;
	
	input [N-1:0] in;
	input [N:0] prim;
	output [N-1:0] out;
	
	reg [2*N-2:0] product,remainder;
	reg [2*N-2:0] temp;
	
	integer i,j;
	
	always@* begin: square
		product=0;
		for(i=0;i<2*N-1;i=i+2) begin
			product[i]=in[i/2];
			$display("%d,%d",i,i/2);
		end
	end
	
	always@* begin: reduce
		remainder=product;
		//$display("%b :Product",product);
		for(j=0;j<N-1;j=j+1) begin
			if(remainder[2*N-2-j]==1) begin
				temp=0;
				temp[(2*N-2-j)-:(N+1)]=prim;
				remainder=remainder^temp;
				//$display("%b \n%b",temp2,remainder);
			end
		end
	end
	
	assign out=remainder[N-1:0];
endmodule
