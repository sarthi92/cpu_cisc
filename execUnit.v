module execUnit(di,t1,t2,b,pc,irf,ire,aluout,abus,bbus,ird,eab,dout,edb,cword,clk1,clk2,reset);
output reg [7:0]ird,eab,dout;
input [15:0]cword;
input [7:0]edb;
input clk1,clk2,reset;
output reg [7:0]di,t1,t2,b,pc,irf,ire,aluout,abus,bbus;
reg [7:0]r[3:0];

always @(negedge clk1)//P1
begin
case(cword[11])
1'b1:abus=pc;
endcase
case(cword[10:9])
2'b01:bbus=di;
2'b10:bbus=di;
endcase
case(cword[2:1])
2'b01:abus=b;
endcase
case(cword[8:7])
2'b01:abus=r[ire[5:4]];
2'b10:abus=r[ire[1:0]];
2'b11:
    begin
    bbus=r[ire[5:4]];
    abus=r[ire[1:0]];
    end
endcase
case(cword[13:12])
2'b01:eab=abus;
endcase
end

always @(posedge clk1)//P2
begin
case(cword[0])
1'b1:
    begin
    irf=edb;
    ird=irf;
    ire=ird;
    end
endcase
case(cword[10:9])
2'b11:di=edb;
endcase
case(cword[6:5])
2'b01:t1=aluout;
2'b10:t1=aluout;
endcase
end

always @(negedge clk2)//P3
begin
case(cword[6:5])
2'b01:abus=t1;
2'b10:bbus=t1;
endcase
case(cword[4:3])
2'b01:abus=t2;
endcase
case(cword[13:12])
2'b10:eab=abus;
endcase
case(cword[10:9])
2'b11:bbus=di;
2'b01:dout=bbus;
endcase
end

always @(posedge clk2)//P4
begin
if(reset) begin 
pc=8'd1;//next byte pc pointing
abus=8'd0;
irf=8'b11000100;//prefetch first ins here
ird=8'b11000100;
ire=8'b11000100;
di=8'd0;
bbus=8'd0;
dout=8'd0;
b=8'd0;
r[0]=8'd1;//initial conditions
r[1]=8'd2;
r[2]=8'd3;
r[3]=8'd9;
t1=8'd0;
t2=8'd0;
eab=8'd0;
dout=8'd0;
end
else
begin
case(cword[11])
1'b1:pc=abus;
endcase
case(cword[10:9])
2'b10:di=edb;
endcase
case(cword[2:1])
2'b10:b=bbus;
endcase
case(cword[8:7])
2'b11:r[ire[1:0]]=abus;
endcase
case(cword[4:3])
2'b10:t2=abus;
endcase
end
end

always @(*)
begin
$monitor("%d %d %d %d",r[0],r[1],r[2],r[3]);
if(reset) aluout=8'd0;
else
begin
case(cword[15:14])
2'b01:aluout=abus+8'd1;
2'b10:aluout=abus+bbus;
2'b11:
    begin
    case(ire[7:6])
    2'b00:aluout=abus+bbus;
    2'b01:aluout=abus&bbus;
    2'b10:aluout=abus|bbus;
    endcase
    end
endcase
end
end

endmodule