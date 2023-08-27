module output_func_stream_I(Xpn,Xsn,Xn,Xln);

parameter T= (1<<30);

input [31:0]Xpn,Xsn,Xln;
output reg [31:0]Xn;

wire [31:0]Xth;

assign Xth=(Xsn^Xln);

always @(*)
begin
  if(Xth>0 & Xth<T)
    begin
      Xn=Xpn;
    end
  else
    begin
      Xn=Xsn;
    end

end


endmodule
