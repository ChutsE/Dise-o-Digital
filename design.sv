module sum(
  input wire [3:0] a,b,c,
  output wire [4:0] out
);
  
  assign out = a + b + c;

endmodule