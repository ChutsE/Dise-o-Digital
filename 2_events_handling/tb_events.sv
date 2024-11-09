`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cinvestav
// Engineer: Jesus Eduardo Esparza Soto
// 
// Create Date: 11/09/2024 09:02:09 AM
// Design Name: events handling
// Module Name: tb_events
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


module tb_events#(parameter WIDTH = 4);
 
  // Declaracion de variables //
  bit clk; 
  bit [WIDTH-1:0] a = 4'b0000;
  bit [WIDTH-1:0] b = 4'b0000;
  reg [WIDTH-1:0] bitwise_and;
  reg [WIDTH-1:0] bitwise_or;
  reg [WIDTH-1:0] bitwise_xor;
  
  //events
  event a_ev;
  event b_ev;
  event and_ev;


  // Proceso de la señal de reloj
  always #10ns clk=!clk;
 
 
   // instanciación del modulo y asingacion de entradas y salidas
  gates #(.WIDTH(4)) DUT (
    .a(a),
    .b(b),
    .bitwise_and(bitwise_xor),
    .bitwise_or(bitwise_or),
    .bitwise_xor(bitwise_and)
  );
  
	initial begin 				 // Proceso 1
		forever begin 			 // Debe llevar el forever si no, solo se ejecuta una vez
			@(posedge clk); 	 // El @ es un operador para esperar un evento
			std::randomize(a);   // Randomizamos a utilizando la libreria standard
		end
	end
 
	always begin 					 // Proceso 2
			@(posedge clk); 	 // El @ es un operador para esperar un evento
			std::randomize(b); // Randomizamos a utilizando la libreria standard
			->and_ev;				 // Triggers el evento por 1 timestep
			
	end
 
	initial begin // Se ejecuta en t=0
		fork
			begin // Proceso 3
				repeat(5) begin
					@(posedge clk); 	 // El @ es un operador para esperar un evento
					wait(b_ev.triggered);
					wait(a_ev.triggered);
					$display("a: %b", a); // Tercero a ser visto
				end
			end
			begin // Proceso 4 
				repeat(5) begin
					@(posedge clk); 	 // El @ es un operador para esperar un evento
					wait(b_ev.triggered);
					$display("b: %b", b); // Segundo a ser visto
        			->a_ev;					 // Triggers el evento por 1 timestep
				end
			end
			begin // Proceso 5
				repeat(5) begin
					@(posedge clk); 	 // El @ es un operador para esperar un evento
					wait(and_ev.triggered);
					$display("and: %b", bitwise_and); // Primero a ser visto
					->b_ev; 					 // Triggers el evento por 1 timestep 
				end
			end
		join
	end
endmodule
