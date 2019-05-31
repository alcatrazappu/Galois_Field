`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:32 05/29/2019 
// Design Name: 
// Module Name:    GF_add_p 
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
module GF_mult(a,b,prim,out);
	
	parameter N=8;
	
	input [N-1:0] a,b;
	input [N:0] prim;
	output [N-1:0] out;
	
	reg [2*N-2:0] product,remainder;
	reg [2*N-2:0] temp,temp2;
	
	integer i;
	integer j;
	
	always@* begin: multiply
		product=0;
		for(i=0;i<N;i=i+1) begin
			if(b[i]==1) begin
				temp=0;
				temp[i+:N]=a;
				//$display("%b",temp);
				product=product^temp;
			end
		end
	end
	
	always@* begin: reduce
		remainder=product;
		//$display("%b :Product",product);
		for(j=0;j<N-1;j=j+1) begin
			if(remainder[2*N-2-j]==1) begin
				temp2=0;
				temp2[(2*N-2-j)-:(N+1)]=prim;
				remainder=remainder^temp2;
				//$display("%b \n%b",temp2,remainder);
			end
		end
	end
	
	assign out=remainder[N-1:0];

endmodule
