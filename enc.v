module enc(in,out);
  
  parameter N=8;
  
  input [N-1:0] in;
  output [N-1:0] out;
  reg [N-1:0] encoded;
  
  integer i;
  
  always@* begin: encode
    for(i=0;i<N;i=i+2) begin
      case(in[i+:2])
        2'b00: encoded[i+:2]=2'b10;
        2'b01: encoded[i+:2]=2'b01;
        default: encoded[i+:2]=2'b00;
      endcase
    end
  end      
        
  assign out=encoded;
endmodule