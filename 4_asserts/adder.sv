`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2024 05:24:02 PM
// Design Name: 
// Module Name: adder
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


module adder #(parameter WIDTH = 4)( 
    output [WIDTH - 1: 0] result,
    output carry_out,
    input [WIDTH - 1: 0] a,
    input [WIDTH - 1: 0] b 
    );
    
    assign {carry_out, result} = result == {WIDTH{1'b1}} ? a+b+1 : a+b;
endmodule
