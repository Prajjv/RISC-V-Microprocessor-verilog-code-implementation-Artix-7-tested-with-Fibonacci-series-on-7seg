module MUX #(parameter Width = 32)(input [Width-1 : 0] a,b,
 input  s,
 output reg [Width-1 : 0] out);

always @(s or a or b)
begin
out = (s == 1'b0) ? a : b;
end
endmodule