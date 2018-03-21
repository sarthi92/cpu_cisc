module cisc(clk1,clk2,cword,ird,eab,edb,dout,ib,sb,state,di,t1,t2,b,pc,irf,ire,aluout,abus,bbus,clk,reset,clkreset);
input clk,reset,clkreset;
output clk1,clk2;
output [20:0]cword;
output [7:0]ird,eab,edb,dout;
output [2:0]ib,sb,state;
output [7:0]di,t1,t2,b,pc,irf,ire,aluout,abus,bbus;

execUnit EU(di,t1,t2,b,pc,irf,ire,aluout,abus,bbus,ird,eab,dout,edb,cword[20:5],clk1,clk2,reset);
clkgen CLKGEN(clk1,clk2,clk,clkreset);
creg CREG(cword,state,clk2,reset);
insdec IDEC(ib,sb,ird,reset);
nsreg NSREG(state,cword[4:3],ib,sb,cword[2:0],clk2,reset);
ram MEM(edb,dout,eab,cword[15:14],clk2,reset);
endmodule
