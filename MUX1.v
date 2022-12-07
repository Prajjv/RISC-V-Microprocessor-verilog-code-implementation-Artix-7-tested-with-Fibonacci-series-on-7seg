module MUX1 #(parameter Width = 32)(input [Width-1 : 0] a,b,c,
 input  [1:0] s,
 output reg [Width-1 : 0] out);
always @(s or a or b or c)
begin
//assign out = (s == 2'b10) ? c : (s == 2'b01) ? b : a;
if(s==2'b00)
  out=a;
else if(s==2'b01)
  out=b;
else if(s==2'b10)
  out=c;
else
  out=32'h xxxxxxxx;
end
endmodule