`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 02:13:47 PM
// Design Name: 
// Module Name: tb_semaforo
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


module tb_semaforo;
        
    event yellow_ev;
    event red_ev;
    event green_ev;
    
    
    // setted clock
    bit clk = 0;
    initial begin
        ->green_ev;
        fork
            begin
                forever begin
                    wait(green_ev.triggered);
                    clk = !clk;
                    #5
                    clk = !clk;
                    #5
                    ->yellow_ev;
                end
            end
            begin
                forever begin
                    wait(yellow_ev.triggered);
                    clk = !clk;
                    #1
                    clk = !clk;
                    #1
                    ->red_ev;
                end
            end
            begin
                forever begin
                    wait(red_ev.triggered);
                    clk = !clk;
                    #5
                    clk = !clk;
                    #5
                    ->green_ev;
                 end
            end
        join
    end

    
   //`define TEST_M_DIS
   //`define TEST_M_EN
   `define TEST_M_EN_DIS
   
    semaforo_verification semaforo_intf ();
    
    semaforo_design DUT (
        .mainageability(semaforo_intf.mainageability),
        .green_m(semaforo_intf.green_m), 
        .yellow_m(semaforo_intf.yellow_m),
        .red_m(semaforo_intf.red_m),
        .clk(clk),
        .green_led(semaforo_intf.green_led),
        .yellow_led(semaforo_intf.yellow_led),
        .red_led(semaforo_intf.red_led)
    );
    
    interface semaforo_verification();
        logic mainageability;
        logic green_m, yellow_m, red_m;
        logic green_led, yellow_led, red_led;
    
        function mainageability_dis();
            mainageability = 0;
            green_m = 1;
            yellow_m = 1;
            red_m = 1;
        endfunction
        
        function mainageability_en();
            mainageability = 1;
            green_m = 1;
            yellow_m = 1;
            red_m = 1;
        endfunction
        
    endinterface : semaforo_verification


    initial begin
        `ifdef TEST_M_DIS
            semaforo_intf.mainageability_dis();
        `endif
        `ifdef TEST_M_EN
            semaforo_intf.mainageability_en();
        `endif
         `ifdef TEST_M_EN_DIS
            semaforo_intf.mainageability_dis();
            #15
            semaforo_intf.mainageability_en();
        `endif
    end
    
endmodule
