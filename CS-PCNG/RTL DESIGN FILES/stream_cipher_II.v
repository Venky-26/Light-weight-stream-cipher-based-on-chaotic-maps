module stream_cipher_II(clk,reset,keystream,start);

//input [146:0]key;
//input [31:0]iv;
input clk,reset,start;
//parameter Ns=3'b100;
output [31:0]keystream;
wire read0,s,en,done,en1;
wire [31:0] iv_o,Xp0,Xs0,Xpn,Xsn;
wire [146:0]key_o;




reg_k_iv_stream reg_k_iv(.read0(read0),.clk(clk),.reset(reset),.key_o(key_o),.iv_o(iv_o));
key_setup_stream key_set_up(.key(key_o),.iv(iv_o),.Xp0(Xp0),.Xs0(Xs0));
internal_state_stream internal_state(.Xp0(Xp0),.Xpn(Xpn),.Xs0(Xs0),.Xsn(Xsn),.key(key_o),.s(s),.clk(clk),.reset(reset),.en1(en1));
output_func_stream output_func(.Xpn(Xpn),.Xsn(Xsn),.Xn(keystream));

 counter_stream counter(.clk(clk),.reset(reset),.en(en),.done(done));

controller_fsm_stream fsm(.clk(clk),.reset(reset),.read0(read0),.s(s),.en1(en1),.en(en),.done(done),.start(start));

endmodule
 