module output_func_stream(Xpn,Xsn,Xn);

input [31:0]Xpn,Xsn;
output reg [31:0]Xn;

always @(*)
begin
  Xn=Xpn^Xsn;  
end

endmodule
