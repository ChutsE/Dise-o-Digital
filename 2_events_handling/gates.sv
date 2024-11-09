`timescale 1ns / 1ps

module gates#(parameter WIDTH = 4)(
  input reg [WIDTH-1:0] a, b,
  output reg [WIDTH-1:0] bitwise_and,
  output reg [WIDTH-1:0] bitwise_or,
  output reg [WIDTH-1:0] bitwise_xor
);
    assign  bitwise_and=a&b;
    assign  bitwise_or = a|b;
    assign  bitwise_xor = a^b; 
endmodule
