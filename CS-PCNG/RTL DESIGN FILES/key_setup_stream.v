module key_setup_stream(key,iv,Xp0,Xs0);

input [31:0]iv;
input [146:0]key;
output [31:0]Xp0;
output [31:0]Xs0;


wire [31:0] Xp,Xs,ivp,ivs;

assign Xp=key[31:0]; 
assign Xs=key[63:32];


assign ivp=iv;
assign ivs={{iv[28:0]},{iv[31:29]}};


assign Xp0=Xp^ivp;
assign Xs0=Xs^ivs;


endmodule
