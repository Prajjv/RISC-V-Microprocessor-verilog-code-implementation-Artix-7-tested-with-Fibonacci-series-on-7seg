module Registerfile #(parameter Width = 32)(
input clk,RegWrite,[4:0]A1,[4:0]A2,[4:0]A3,[Width-1:0] WD3,
output [Width-1:0] RD1, RD2,result);
reg [Width-1:0] Register [Width-1:0];
//wire [4:0] A1, A2, A3;



 //assign A1=RD[19-:15];  //TEST
 //assign A2=RD[24-:20];  //TEST
 //assign A3=RD[11-:7];   //TEST


initial
begin
Register[0] = 32'h00000000;
Register[1] = 32'h00000001;
Register[2] = 32'h00000002;
Register[3] = 32'h00000007;
Register[4] = 32'h00000008;
Register[5] = 32'h00000005;
Register[6] = 32'h00000006;
Register[7] = 32'h00000007;
Register[8] = 32'h00000008;
Register[9] = 32'h00000009;
Register[10] = 32'h00000010;
end
always @(posedge clk)
begin
if(RegWrite)
Register[A3] <= WD3; //WD3-write data
end
assign RD1 = (A1 != 0) ? Register[A1] : 0; //RD-Read data
assign RD2 = (A2 != 0) ? Register[A2] : 0;
assign result=Register[A3];
endmodule