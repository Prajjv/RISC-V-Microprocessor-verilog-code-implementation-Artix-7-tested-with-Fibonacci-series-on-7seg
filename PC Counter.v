module PCCounter( clk, PCNext, PC);

input clk;
input[31:0]PCNext;
output reg [31:0] PC;

always@(posedge clk)

begin
PC <= PCNext;
end
initial begin
PC=32'b0;
end

endmodule