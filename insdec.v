module insdec(ib,sb,ird,reset);
output reg [2:0]ib,sb;
input [7:0]ird;
input reset;

always @(*)
begin
if(reset)begin ib=3'd0; sb=3'd0; end
else
begin
if(ird[7:6]==2'b11) begin ib=3'd1; sb=3'd2; end
else
    begin
    case(ird[3:2])
    2'b00: begin ib=3'd0; sb=3'd0; end//halt instruction
    2'b01: begin ib=3'd7; sb=3'd0; end
    2'b10: begin ib=3'd6; sb=3'd5; end
    2'b11: begin ib=3'd3; sb=3'd5; end
    endcase
    end
end
end

endmodule