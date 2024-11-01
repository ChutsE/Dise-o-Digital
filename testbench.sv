module testbench;
  reg [3:0] a,b,c;
  reg clk = 0;
  reg [5:0] out;
  reg [2:0] count = 0;
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    
    repeat (10) begin
    	#5 clk = !clk;
    end
  end

  sum sum_module (.a(a),
                  .b(b),
                  .c(c),
                  .out(out)
                 );
 
  always @(clk) begin
    if (count < 5) begin
       a = $random;
       b = $random;
       c = $random;
      count = count + 1;
    end
  end

  
endmodule
