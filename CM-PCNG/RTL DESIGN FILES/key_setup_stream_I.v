module key_setup_stream_I(key,iv,Xp0,Xs0,Xl0);

input [31:0]iv;
input [188:0]key;
output [31:0]Xp0;
output [31:0]Xs0;
output [31:0]Xl0;

wire [31:0] Xp,Xs,Xl,ivp,ivs,ivl;

assign Xp=key[31:0];
assign Xs=key[63:32];
assign Xl=key[95:64];

assign ivp=iv;
assign ivs={{iv[28:0]},{iv[31:29]}};
assign ivl={{iv[29:0]},{iv[31:30]}};

assign Xp0=Xp^ivp;
assign Xs0=Xs^ivs;
assign Xl0=Xl^ivl;

endmodule
