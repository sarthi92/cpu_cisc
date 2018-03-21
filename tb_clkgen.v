module tb_clkgen();
wire clk1,clk2;
reg clkin,reset;
clkgen C(clk1,clk2,clkin,reset);
initial
begin
clkin=1'd0;
reset=1'd1;
#11 reset=1'd0;
end
always #10 clkin=~clkin;
endmodule
