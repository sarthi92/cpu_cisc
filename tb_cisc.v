module tb_cisc();
reg clk,reset,clkreset;
wire clk1,clk2;
wire [20:0]cword;
wire [7:0]ird,eab,edb,dout;
wire [2:0]ib,sb,state;
wire [7:0]di,t1,t2,b,pc,irf,ire,aluout,abus,bbus;

cisc CPU(clk1,clk2,cword,ird,eab,edb,dout,ib,sb,state,di,t1,t2,b,pc,irf,ire,aluout,abus,bbus,clk,reset,clkreset);

initial
begin
reset=1'd1;
clkreset=1'd1;
clk=1'd0;
#11 clkreset=1'd0;
#30 reset=1'd0;
end

always #10 clk=~clk;
endmodule
