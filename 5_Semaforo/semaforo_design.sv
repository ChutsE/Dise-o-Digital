`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 05:57:49 PM
// Design Name: 
// Module Name: semaforo_design
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


module semaforo_design(
    input reg mainageability,
    input reg green_m, yellow_m, red_m,
    input reg clk,
    output wire green_led, yellow_led, red_led
    );
    reg [1:0] cnt = 0;
    always @(posedge clk)begin
        if (cnt == 2) 
            cnt <= 0; 
        else
            cnt <= cnt + 1;
    end
    
    assign green_led = (mainageability == 1) ? green_m :
                       (cnt == 2'b01) ? 1 : 0;
                       
    assign yellow_led = (mainageability == 1) ? yellow_m :
                        (cnt == 2'b10) ? 1 : 0;
                        
    assign red_led = (mainageability == 1) ? red_m :
                     (cnt == 2'b00) ? 1 : 0;
endmodule
