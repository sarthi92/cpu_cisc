module creg(cword,addr,clk2,reset);
output reg [20:0]cword;
input [2:0]addr;
input clk2,reset;
reg [20:0]mem[7:0];

always @(posedge clk2)//P4
begin
if(reset)
begin
mem[0]=21'b00_00_0_00_00_00_00_00_0_00_000;
mem[1]=21'b01_01_1_11_00_01_00_10_0_01_000;
mem[2]=21'b01_01_1_00_00_01_00_00_1_10_000;
mem[3]=21'b01_01_1_11_00_01_00_00_0_00_100;
mem[4]=21'b10_10_0_10_00_01_10_01_0_01_000;
mem[5]=21'b11_10_0_01_01_10_01_00_0_00_010;
mem[6]=21'b00_01_0_11_10_00_10_00_0_01_000;
mem[7]=21'b11_00_0_00_11_01_00_00_0_00_010;
cword=mem[1];
end
else
cword=mem[addr];
end

endmodule