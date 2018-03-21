module ram(edb,din,eab,cword,clk2,reset);
output reg [7:0]edb;
input [7:0]din,eab;
input [1:0]cword;
input clk2,reset;
reg [7:0]mem[255:0];

always @(*)
begin
$monitor("%d %d %d %d %d %d %d %d %d %d",mem[0],mem[1],mem[2],mem[3],mem[4],mem[5],mem[6],mem[7],mem[8],mem[9]);
edb=mem[eab];
end

always @(posedge clk2)//P4
begin
if(reset)
begin
mem[0]=8'b11000100;//lbi
mem[1]=8'b00000110;//6
mem[2]=8'b00000101;//add r0 r1
mem[3]=8'b01010110;//and r1 r2
mem[4]=8'b10100100;//or r2 r0
mem[5]=8'b00001011;//add r0 @(r3)
mem[6]=8'b00001100;//add r0 @(b+d)
mem[7]=8'b00000011;//3
mem[8]=8'b00000000;//halt
mem[9]=8'b00000010;//data=2
edb=8'd0;
end
else if(cword[1:0]==2'b01)
mem[eab]=din;
end

endmodule
