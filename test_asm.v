module test_asm();
  
  parameter SIZE=8;
  parameter WIDTH=SIZE/2;
  parameter OUT=SIZE/2+1;
  
  reg [SIZE-1:0] in;
  wire [OUT-1:0] out;
  
  integer i;
  
  asm #(.SIZE(SIZE)) uut(.in(in),.out(out));
  
  initial begin
    //for(i=0;i<64;i=i+1) begin
      //in=i;
		in=8'b01010001;
      $monitor("%b %b,%b",in[SIZE-1:SIZE/2],in[SIZE/2-1:0],out);
      #1;
    //end
  end

endmodule