module DataMemory #(parameter Width = 32)
(input clk,MemWrite,MemRead, [Width-1:0] ALUResult,WriteData, //WriteData=RD2
output [Width-1:0] ReadData);
reg [Width-1:0] mem1[511:0];
initial
begin
mem1[0] = 32'h00000000;
mem1[1] = 32'h00000000;
mem1[2] = 32'h00000000;
mem1[3] = 32'h00000000;
mem1[4] = 32'h00000000;
mem1[5] = 32'h00000000;
mem1[6] = 32'h00000000;
mem1[7] = 32'h00000000;
mem1[8] = 32'h00000000;
mem1[9] = 32'h00000000;
mem1[10] = 32'h00000000;
mem1[11] = 32'h00000000;
mem1[12] = 32'h00000000;
mem1[13] = 32'h00000000;
mem1[14] = 32'h00000000;
mem1[15] = 32'h00000000;
mem1[16] = 32'h00000000;
mem1[17] = 32'h00000000;
mem1[18] = 32'h00000000;
mem1[19] = 32'h00000000;
mem1[20] = 32'h00000000;
mem1[21] = 32'h00000000;
mem1[22] = 32'h00000000;
mem1[23] = 32'h00000000;
mem1[24] = 32'h00000000;
mem1[25] = 32'h00000000;
mem1[26] = 32'h00000000;
mem1[27] = 32'h00000000;
mem1[28] = 32'h00000000;
mem1[29] = 32'h00000000;
mem1[30] = 32'h00000000;




end


always @(posedge clk)
begin

if(MemWrite==1'b1)
mem1[ALUResult] <= WriteData;

end

assign ReadData = (MemRead==1'b1) ? mem1[ALUResult]: 32'd0; 

endmodule