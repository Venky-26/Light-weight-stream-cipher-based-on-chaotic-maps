module controller_fsm_stream_I(clk,en,done,
                      reset,start,
                      read0,s,en1);
                     
                     
                     


input clk,reset,done,start;



output reg read0,s,en,en1;

reg read0_temp,s_temp,en_temp,en1_temp;
reg [1:0] pre_state,next_state;

parameter IDLE  =  2'b00;
parameter S1    =  2'b01;
parameter S2    =  2'b10;
parameter S3    =  2'b11;






//Present state logic
always @ (posedge clk )
begin

  if(reset)
    begin
      pre_state<= IDLE;
    end
  // Else if there is no reset then assign the present_state as next_state
  else
    begin
      pre_state<=next_state;
    end
end

always @(*)
begin
  case(pre_state)

    IDLE:begin
         if(!reset & start)  
           next_state=S1;
         else
           next_state=IDLE;
       end
   
    S1:begin       
//         read0=1;
         next_state=S2;
       end

    S2:begin
//         s=0;
       
//         en1=1;
         next_state=S3;
       end

    S3:begin
//         s=1;
//         en=1;
         if(done)
         begin
          next_state=IDLE;
//          en1=0;
         end
         else
          next_state=S3;
       end

    default: next_state=IDLE;
endcase

end

//temporary output logic
always@(*)
begin
  case(pre_state)
  IDLE:begin
         read0_temp=0;
         en_temp=0;
         en1_temp=0;
         s_temp=0; 
       end
  S1:begin       
      read0_temp=1;
      en_temp=0;
      en1_temp=0;
      s_temp=0; 
     end

  S2:begin
      en1_temp=1;
      read0_temp=1;
      en_temp=0;
      s_temp=0; 
     end

  S3:begin
      s_temp=1;
      en_temp=1;
      read0_temp=1;;
      en1_temp=1; 
       if(done)
         begin
           en1_temp=0;
           read0_temp=0;
           en_temp=0;
           s_temp=0; 
         end
     end
    default: begin
       read0_temp = 0;
       en_temp = 0;
       en1_temp = 0;
       s_temp = 0;
     end
endcase

end

//output logic
always@(posedge clk)
begin
  if(reset)
    begin
      read0<=0;
      en<=0;
      en1<=0;
      s<=0; 
    end
    else
      begin
        read0<=read0_temp;
        en<=en_temp;
        en1<=en1_temp;
        s<=s_temp;      
      end
end

endmodule