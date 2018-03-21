module clkgen(clk1,clk2,clkin,reset);
output reg clk1,clk2;
input clkin,reset;
reg clk;

always @(posedge clkin)
begin
if(reset)
clk=1'd1;
else
clk=~clk;
end

always @(*)
begin
clk1=(~clk)|(~clkin);
clk2=(clk)|(~clkin);
end

endmodule
