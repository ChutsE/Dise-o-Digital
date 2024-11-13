`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 06:03:47 PM
// Design Name: 
// Module Name: testbench
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


module testbench;
    
    bit clk = 0;
    bit [3:0] a, b;
    logic [4:0] out;
    
    adder_design DUT (.*);
    
    always #10ns clk = !clk;
    
    //TestCase 1
    function both_zeros();
        a = 0;
        b = 0;
    endfunction
    
    //TestCase 2
    function both_are_random();
        std::randomize(a);
        std::randomize(b);
    endfunction
    
    //TestCase 3
    function a_random_b_zero();
        std::randomize(a);
        b = 0;
    endfunction
    
    //TestCase 4
    function a_zero_b_random();
        a = 0;
        std::randomize(b);
    endfunction
    
    //TestCase 5
    function both_max_values();
        a = '1;
        b = '1;
    endfunction
    
    //TestCase 6
    function a_max_value_b_random();
        a = '1;
        std::randomize(b);
    endfunction
    
    //TestCase 7
    function a_random_b_max_value();
        std::randomize(a);
        b = '1;
    endfunction

    //TestCase 8
    function a_max_value_b_one();
        a = '1;
        b = 'b1;
    endfunction
    
    //TestCase 9
    function a_one_b_max_value();
        a = 'b1;
        b = '1;
    endfunction
    
   initial begin 
        
        both_zeros();
        @(posedge clk);
        repeat (100) begin
            both_are_random();
            @(posedge clk);
        end
        repeat (100) begin
            a_random_b_zero();
            @(posedge clk);
        end
        repeat (100) begin
            a_zero_b_random();
            @(posedge clk);
        end
            both_max_values();
            @(posedge clk);
        repeat (100) begin
            a_max_value_b_random();
            @(posedge clk);
        end
        repeat (100) begin
            a_random_b_max_value();
            @(posedge clk);
        end
            a_max_value_b_one();
            @(posedge clk);
            a_one_b_max_value();
            @(posedge clk);
        
   end
endmodule
