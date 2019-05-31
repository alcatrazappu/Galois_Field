module test_LZC();

   parameter W_IN=8;
   parameter W_OUT=$clog2(W_IN);
   
   reg [W_IN-1:0] in;
   wire [W_OUT-1:0] out;
   
   integer i;
   
   LZC #(.W_IN(W_IN),.W_OUT(W_OUT)) uut(.in(in),.out(out));
   
   initial begin
     for(i=0;i<256;i=i+1) begin
      #1;
      in=i;
      $display("%d,%b,%d",i,in,out);
   end
   end
   
endmodule