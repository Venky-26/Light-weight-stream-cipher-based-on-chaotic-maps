module internal_state_stream_I(Xp0,Xpn,Xs0,Xl0,Xln,Xsn,key,s,clk,reset,en1);

input [31:0]Xp0;
input [31:0]Xs0; 
input [31:0]Xl0;
input [188:0]key;
input s,clk,reset,en1;
output  [31:0]Xpn;
output  [31:0]Xsn;
output   [31:0]Xln;

reg [64:0]Xpn_temp,Xsn_temp,Xln_temp;

wire [30:0]Pp;
wire [31:0]Ps;

wire [4:0]e12;
wire [4:0]e13;
wire [4:0]e21;
wire [4:0]e23;
wire [4:0]e31;
wire [4:0]e32;

assign Pp=key[126:96];
assign Ps=key[158:127];
assign e12=key[163:159];
assign e13=key[168:164];
assign e21=key[173:169];
assign e23=key[178:174];
assign e31=key[183:179];
assign e32=key[188:184];



always@(posedge clk)
begin
if(reset)
  begin
    Xpn_temp<=64'd0;
    Xsn_temp<=64'd0;
    Xln_temp<=64'd0;
  end
  else if(!en1)
  begin
     Xpn_temp<=64'dx;
     Xsn_temp<=64'dx;
     Xln_temp<=64'dx;
  end
else if(s==1)
    begin
      Xpn_temp<= ((((1<<32)-e12-e13)*(Funp(Xpn,Pp)))+((e12)*(Funs(Xsn,Ps)))+((e13)*(Funl(Xln))));
      Xsn_temp<= (((e21)*(Funp(Xpn,Pp)))+(((1<<32)-e21-e23)*(Funs(Xsn,Ps)))+((e23)*(Funl(Xln))));
      Xln_temp<= (((e31)*(Funp(Xpn,Pp)))+((e32)*(Funs(Xsn,Ps)))+(((1<<32)-e31-e32)*(Funl(Xln))));
  
    end
  else if(s==0)
    begin
      Xpn_temp<= ((((1<<32)-e12-e13)*(Funp(Xp0,Pp)))+((e12)*(Funs(Xs0,Ps)))+((e13)*(Funl(Xl0))));
      Xsn_temp<= (((e21)*(Funp(Xp0,Pp)))+(((1<<32)-e21-e23)*(Funs(Xs0,Ps)))+((e23)*(Funl(Xl0))));
      Xln_temp<= (((e31)*(Funp(Xp0,Pp)))+((e32)*(Funs(Xs0,Ps)))+(((1<<32)-e31-e32)*(Funl(Xl0))));
    end
  end

function automatic [64:0] Funp(input [64:0]a, [64:0]b);
  begin
    if(a>0 && a<=b)
      begin
       if((((1<<32)*(a))%(b))==0)
        Funp=(((1<<32)*(a))/(b));
       else
        Funp=((((1<<32)*(a))/(b))+1);         
      end

    else if(a>b && a<= (1<<31))
      begin
       if((((1<<32)*(a-b))%((1<<31)-b))==0)
        Funp=((((1<<32))*(a-b))/(((1<<31))-b));
       else
        Funp=(((((1<<32))*(a-b))/(((1<<31))-b))+1);
      end

    else if(a>(1<<31) && a<=((1<<32)-b))
      begin
       if(((((1<<32))*(((1<<32))-a-b))/(((1<<31))-b))==0)
        Funp=((((1<<32))*(((1<<32))-a-b))/(((1<<31))-b));
       else
        Funp=(((((1<<32))*(((1<<32))-a-b))/(((1<<31))-b))+1);
      end

    else if(a>((1<<32)-b) && a<=((1<<32)-1))
      begin
       if(((((1<<32))*(((1<<32))-a))/(b))==0)
        Funp=((((1<<32))*(((1<<32))-a))/(b));
       else
        Funp=(((((1<<32))*(((1<<32))-a))/(b))+1);
      end
    else
      begin
        Funp=(((1<<32))-1-b);
      end

  end
endfunction

function automatic [64:0] Funs(input [64:0]c, [64:0]d);
begin

  if(c>0 & c<d)
    begin
      Funs=((((1<<32))*(c))/(d));
    end

  else if(c==d)
    begin
      Funs=(((1<<32))-1);
    end

  else if(c>d & c<((1<<32)))
    begin
       Funs=((((1<<32))*(((1<<32))-c))/(((1<<32))-d));
    end
end
endfunction

function automatic [64:0] Funl(input [64:0]e);
begin
                                                                                       /////consider dividion first ///////
  if(!((e>=(3*((1<<30)))) & (e<=(((1<<32))))))
    begin
      Funl=(((e)*(((1<<32))-e))/(((1<<32))-1));
    end

  else if((e>=(3*((1<<30)))) & (e<=(((1<<32)))))
    begin
      Funl=(((1<<32))-1);
    end


end
endfunction


assign Xpn=Xpn_temp;
assign Xln=Xln_temp;
assign Xsn=Xsn_temp;

endmodule