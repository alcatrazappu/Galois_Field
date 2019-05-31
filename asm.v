module asm(in,out);
  
  parameter SIZE=6;
  parameter WIDTH=SIZE/2;
  parameter OUT=SIZE/2+1;
  
  input [SIZE-1:0] in;
  output [OUT-1:0] out;
  reg [OUT-1:0] assembled;
  
  always@* begin: assemble
    if(in[WIDTH-1]==1 && in[2*WIDTH-1]==1) begin
      assembled[OUT-2:0]<=0;
      assembled[OUT-1]<=1'b1;
    end
    else if(in[2*WIDTH-1]==0) begin
      assembled[OUT-2:0]<=in[SIZE-1:WIDTH];
      assembled[OUT-1]<=1'b0;
    end
    else if(in[2*WIDTH-1]==1) begin
      assembled[OUT-3:0]<=in[WIDTH-2:0];
      assembled[(OUT-1)-:2]<=2'b01;
    end
  end 
        
  assign out=assembled;
endmodule