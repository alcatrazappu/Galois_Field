`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2018 11:14:42 AM
// Design Name: 
// Module Name: Posit_Addition_Test_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Posit_Addition_Test_benchh;

	function [31:0] log2;
	input reg [31:0] value;
		begin
		value = value-1;
		for (log2=0; value>0; log2=log2+1)
				value = value>>1;
			end
	endfunction

	parameter N=16;
	parameter Bs=log2(N);
	parameter es=1;

	reg [N-1:0] Input_A, Input_B;
	reg Operation;

	reg clock;

	wire [N-1:0] Addition_Result;

	integer i,j,f;
	Posit_Addition_Top_module #(.N(N),.es(es)) uut (.Input_AA (Input_A), .Input_BB (Input_B), .Addition_Result (Addition_Result),.clock(clock));

	initial begin  
	    clock=0;
		Input_A=0;
		Input_B=0;
		#10;
		f=$fopen("C:/Users/UUA4KOR/Documents/Test_Posit_Add/output.txt","w");
		for(i=0;i<16;i=i+1) begin
			for(j=0;j<16;j=j+1) begin
				Input_A<=i;Input_B<=j;
				#10;
				$fwrite(f,"%b\n",Addition_Result);
			end
		end

		$fclose(f);            
	end
		
	always 
	   #5  clock =  ! clock; 
       
endmodule
