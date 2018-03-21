module nsreg(state,ty,ib,sb,db,clk2,reset);
output reg [2:0]state;
input [2:0]ib,sb,db;
input [1:0]ty;
input clk2,reset;

always @(negedge clk2)//P3
begin
case(ty)
2'b00:state=db;
2'b01:state=sb;
2'b10:state=ib;
endcase
end

always @(posedge clk2)//P4
begin
if(reset) state=3'd0;
end

endmodule
