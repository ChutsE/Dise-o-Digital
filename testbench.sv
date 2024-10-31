module testbench;
  reg [3:0] a,b,c;
  reg clk = 0;
  reg [5:0] out;
  
  sum sum_module (.a(a),
                  .b(b),
                  .c(c),
                  .out(out)
                 );
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    
    repeat (5) begin
      #5
      clk = !clk;
      a = $random;
      b = $random;
      c = $random;
    end
    repeat (5) begin
      #5
      clk = !clk;
    end
  end
  
endmodule
