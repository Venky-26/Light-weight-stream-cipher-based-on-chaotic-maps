module reg_k_iv_stream_I(read0,clk,reset,key_o,iv_o);

//input [146:0]key_i;
//input [31:0]iv_i;

input read0,clk,reset;
output reg [188:0]key_o;
output reg [31:0]iv_o;


always@(posedge clk)
begin
  if(reset)
    begin
      key_o= 189'd0;
      iv_o= 32'd0;

    end

else if(read0)
    begin
      key_o=189'b10101_10101_00100_10010_10001_00110_11110000101010100101001010010100_1100001111001001001100110000111_11111100000000110011000101110001_11100100000000110011000011110001_11100100000000110011000011110001;
      iv_o=32'b11000011001111001011001100110010;
    end


end
endmodule
