module arch2(clk,ReadData);

input clk;

output [31:0]ReadData;

wire [31:0]ALUResult,result;
wire [31:0]PCNext;
wire zero;
wire Branch;
wire [31:0]RD1,RD2;
wire [31:0]PC,RD,PCPlus4,PCTarget;
wire RegWrite,jump;
wire [1:0]Aluop,immsrc,Resultsrc;
wire [3:0] Control;
wire ALUSrc,MemWrite,MemRead;
wire [31:0]immext,srcB,Resultmux1;


PCCounter P1(.clk(clk),.PCNext(PCNext),.PC(PC));
instructionmemory I1(.PC(PC),.RD(RD));
mainctrl2 M1(.RD(RD[6:0]),.Branch(Branch),.jump(jump),.MemWrite(MemWrite),.MemRead(MemRead),.ALUSrc(ALUSrc),.RegWrite(RegWrite),.immsrc(immsrc),.Aluop(Aluop),.Resultsrc(Resultsrc));
Registerfile R1(.clk(clk),.RegWrite(RegWrite),.A1(RD[19:15]),.A2(RD[24:20]),.A3(RD[11:7]),.WD3(Resultmux1),.RD1(RD1),.RD2(RD2),.result(result));
ALUControl AC(.Aluop(Aluop),.funct7(RD[30]),.funct3(RD[14:12]),.Control(Control));
immediategeneration S1(.immsrc(immsrc),.instr(RD),.extimm(immext));
MUX M4(.a(RD2),.b(immext),.s(ALUSrc),.out(srcB));                                
ALU A3(.controlsignal(Control),.A1(RD1),.A2(srcB),.Y(ALUResult),.zero(zero));   //RD1=srcA
DataMemory D1(.clk(clk),.MemWrite(MemWrite),.MemRead(MemRead),.ALUResult(ALUResult),.WriteData(RD2),.ReadData(ReadData));
adder A1(.PC(PC),.PCPlus4(PCPlus4));
MUX1 M2(.a(ALUResult),.b(ReadData),.c(PCPlus4),.s(Resultsrc),.out(Resultmux1));
add A2(.A1(PC),.A2(immext),.Y(PCTarget));
MUX mPC(.a(PCPlus4),.b(PCTarget),.s(Branch),.out(PCNext));


endmodule