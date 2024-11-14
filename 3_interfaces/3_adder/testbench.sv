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
    
    parameter ADDER_WIDTH = 8;
    parameter cicles = 100;
    
    // clock setted
    bit clk = 0;
    always #1ns clk = !clk;
    
    //Interface adder module intanced
    adder_intf #(ADDER_WIDTH) adder_intf_module ();
    
    //Adder module instanced
    adder #(ADDER_WIDTH) DUT (
        .a(adder_intf_module.a),
        .b(adder_intf_module.b),
        .result(adder_intf_module.result),
        .carry_out(adder_intf_module.carry_out)
    
    
    );
    
   `define TEST1
   `define TEST2
   `define TEST3
   `define TEST4
   `define TEST5
   `define TEST6
   `define TEST7
   `define TEST8
   `define TEST9
   
    initial begin
        `ifdef TEST1
            adder_intf_module.both_zeros();
            @(posedge clk);
        `endif
        
        `ifdef TEST2
            repeat (cicles) begin
                adder_intf_module.both_are_random();
                @(posedge clk);
            end
        `endif
        
        `ifdef TEST3
            repeat (cicles) begin
                adder_intf_module.a_random_b_zero();
                @(posedge clk);
            end
        `endif
        
        `ifdef TEST4
            repeat (cicles) begin
                adder_intf_module.a_zero_b_random;
                @(posedge clk);
            end
        `endif
        
        `ifdef TEST5
            adder_intf_module.both_max_values();
            @(posedge clk);
        `endif
        
        `ifdef TEST6
            repeat (100) begin
                adder_intf_module.a_max_value_b_random();
                @(posedge clk);
            end
        `endif
        
        `ifdef TEST7
            repeat (100) begin
                adder_intf_module.a_random_b_max_value();
                @(posedge clk);
            end
        `endif
        
        `ifdef TEST8
            adder_intf_module.a_max_value_b_one();
            @(posedge clk);
        `endif
        
        `ifdef TEST9
            adder_intf_module.a_one_b_max_value();
            @(posedge clk);
        `endif
    end
    
endmodule : testbench

interface adder_intf #(parameter WIDTH = 8)();

    logic [WIDTH-1:0] a;
    logic [WIDTH-1:0] b;
    logic [WIDTH-1:0] result;
    logic carry_out;
    
    //TestCase 1
    function void both_zeros();
        a = 0;
        b = 0;
    endfunction
    
    //TestCase 2
    function void both_are_random();
        std::randomize(a);
        std::randomize(b);
    endfunction
    
    //TestCase 3
    function void a_random_b_zero();
        std::randomize(a);
        b = 0;
    endfunction
    
    //TestCase 4
    function void a_zero_b_random();
        a = 0;
        std::randomize(b);
    endfunction
    
    //TestCase 5
    function void both_max_values();
        a = '1;
        b = '1;
    endfunction
    
    //TestCase 6
    function void a_max_value_b_random();
        a = '1;
        std::randomize(b);
    endfunction
    
    //TestCase 7
    function void a_random_b_max_value();
        std::randomize(a);
        b = '1;
    endfunction

    //TestCase 8
    function void a_max_value_b_one();
        a = '1;
        b = 'b1;
    endfunction
    
    //TestCase 9
    function void a_one_b_max_value();
        a = 'b1;
        b = '1;
    endfunction
endinterface : adder_intf