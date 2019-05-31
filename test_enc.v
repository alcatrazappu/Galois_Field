module test_enc();
  
  parameter N=8;
  
  reg [N-1:0] in;
  wire [N-1:0] out;
  
  enc #(.N(N)) uut(.in(in),.out(out));
  
  initial begin
    in=8'b00101001;
    $monitor("%b",out);
  end
endmodule