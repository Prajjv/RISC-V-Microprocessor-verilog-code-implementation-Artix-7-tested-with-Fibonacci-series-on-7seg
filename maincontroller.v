module mainctrl2(
input [6:0] RD,
output Branch,jump,MemWrite,MemRead,ALUSrc,RegWrite,[1:0]immsrc,[1:0]Aluop,[1:0]Resultsrc);

reg [11:0] control;


assign {Branch,jump,ALUSrc,immsrc,RegWrite,MemWrite,Aluop,Resultsrc,MemRead} = control;
always @(*)
begin
case(RD)
7'b0110011 : control <= 12'b0_0_0_xx__1_0_10_00_0; // R-type
7'b0000011 : control <= 12'b0_0_1_00__1_0_00_01_1; // lw-type
7'b0100011 : control <= 12'b0_0_1_01__0_1_00_xx_0; // s-type//sw
7'b1100011 : control <= 12'b1_0_0_01__0_0_01_xx_0; // sb-type
7'b0010011 : control <= 12'b0_0_1_00__1_0_11_00_0; // I-type
7'b1100111 : control <= 12'b0_1_1_11__1_x_00_10_0; // jalr-type
7'b1101111 : control <= 12'b0_1_1_11__1_x_00_10_0; // jal-type
default : control    <= 12'bx_x_x_xx__x_x_xx_xx_x;
endcase
end
endmodule