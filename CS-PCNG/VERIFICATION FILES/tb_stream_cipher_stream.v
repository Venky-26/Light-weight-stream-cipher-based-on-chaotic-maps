module tb_stream_cipher_II();
reg clk,reset,start;

wire [31:0]keystream;
stream_cipher_II dut(clk,reset,keystream,start);


 initial
  begin
     clk = 1'b0;
     forever #(10) clk = ~clk;
   end

 
initial
begin

#20 reset = 0;
   start=1;
#40 start=0;
#500 $stop;


end





endmodule