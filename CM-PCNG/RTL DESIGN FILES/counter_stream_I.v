

module counter_stream_I(clk,reset,en,done);

parameter Ns= 3'd5;
input clk,reset,en;

output done;
 reg [$clog2(Ns):0]count;

always@(posedge clk)
begin
  if(reset)
    count <= 0;
  else if(en)
    count <= count + 1;
  else
    count <= 0;

end
assign done= (count==(Ns-1))?1:0;

endmodule


