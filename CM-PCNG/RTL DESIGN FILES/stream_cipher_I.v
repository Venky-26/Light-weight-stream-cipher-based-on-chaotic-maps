
module stream_cipher_I(clk,reset,start,keystream);

//input [146:0]key;
//input [31:0]iv;
input clk,reset,start;
//parameter Ns=3'b100;
output [31:0]keystream;
wire read0,s,en,done,en1;
wire [31:0] iv_o,Xp0,Xs0,Xpn,Xsn,Xl0,Xln;
wire [188:0]key_o; 




reg_k_iv_stream_I reg_k_iv(.read0(read0),.clk(clk),.reset(reset),.key_o(key_o),.iv_o(iv_o));
key_setup_stream_I key_set_up(.key(key_o),.iv(iv_o),.Xp0(Xp0),.Xs0(Xs0) ,.Xl0(Xl0));
internal_state_stream_I internal_state(.Xp0(Xp0),.Xpn(Xpn),.Xs0(Xs0),.Xsn(Xsn),.Xl0(Xl0),.Xln(Xln),.key(key_o),.s(s),.clk(clk),.reset(reset),.en1(en1));
output_func_stream_I output_func(.Xpn(Xpn),.Xsn(Xsn),.Xln(Xln),.Xn(keystream));

 counter_stream_I counter(.clk(clk),.reset(reset),.en(en),.done(done));

controller_fsm_stream_I fsm(.clk(clk),.reset(reset),.read0(read0),.s(s),.en1(en1),.en(en),.done(done),.start(start));

endmodule