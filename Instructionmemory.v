module instructionmemory(PC, RD);
	input [31:0]PC;
	output [31:0] RD;

reg [31:0] mem1[511:0];
initial
begin
mem1[0] = 32'h00000113;
mem1[1] = 32'h00000113; //addi x2 0(x0)
mem1[2] = 32'h00400093; //addi x1 4(x0)
mem1[3] = 32'h00100193; //addi x3 1(x0)
mem1[4] = 32'hFE20AF23; //sw x2 -2(x1)
mem1[5] = 32'hFE30AFA3; //sw x3 -1(x1)
mem1[6] = 32'h00310233; //add x4 x2 x3
mem1[7] = 32'h0040A023; //sw x4 0 (x1)
mem1[8] = 32'h00108093; //addi x1 1 (x1) 
mem1[9] = 32'h00018113; //addi x2 0 (x3)
mem1[10] = 32'h00020193; //addi x3 0 (x4)
mem1[11] = 32'h00310233; //add x4 x2 x3
mem1[12] = 32'h0040A023; //sw x4 0 (x1)
mem1[13] = 32'h00108093; //addi x1 1 (x1) 
mem1[14] = 32'h00018113; //addi x2 0 (x3)
mem1[15] = 32'h00020193; //addi x3 0 (x4)
mem1[16] = 32'h00310233; //add x4 x2 (x3)
mem1[17] = 32'h0040A023; //sw x4 0(x1)
mem1[18] = 32'h00108093; //addi x1 1 x1 
mem1[19] = 32'h00018113; //addi x2 0 x3
mem1[20] = 32'h00020193; //addi x3 0 x4
mem1[21] = 32'h00310233; //add x4 x2 x3
mem1[22] = 32'h0040A023; //sw x4 0 x1
mem1[23] = 32'h00108093; //addi x1 1 x1 
mem1[24] = 32'h00018113; //addi x2 0 x3
mem1[25] = 32'h00020193; //addi x3 0 x4
mem1[26] = 32'h00310233; //add x4 x2 x3
mem1[27] = 32'h0040A023; //sw x4 0 x1
mem1[28] = 32'h00108093; //addi x1 1 x1 
mem1[29] = 32'h00018113; //addi x2 0 x3
mem1[30] = 32'h00020193; //addi x3 0 x4
mem1[31] = 32'h00310233; //add x4 x2 x3
mem1[32] = 32'h0040A023; //sw x4 0 x1
mem1[33] = 32'h00108093; //addi x1 1 x1 
mem1[34] = 32'h00018113; //addi x2 0 x3
mem1[35] = 32'h00020193; //addi x3 0 x4
mem1[36] = 32'h00310233; //add x4 x2 x3
mem1[37] = 32'h0040A023; //sw x4 0 x1
mem1[38] = 32'h00108093; //addi x1 1 x1 
mem1[39] = 32'h00018113; //addi x2 0 x3
mem1[40] = 32'h00020193; //addi x3 0 x4
mem1[41] = 32'h00310233; //add x4 x2 x3
mem1[42] = 32'h0040A023; //sw x4 0 x1
mem1[43] = 32'h00108093; //addi x1 1 x1 
mem1[44] = 32'h00018113; //addi x2 0 x3
mem1[45] = 32'h00020193; //addi x3 0 x4
mem1[46] = 32'h00310233; //add x4 x2 x3
mem1[47] = 32'h0040A023; //sw x4 0 x1
mem1[48] = 32'h00108093; //addi x1 1 x1 
mem1[49] = 32'h00018113; //addi x2 0 x3
mem1[50] = 32'h00020193; //addi x3 0 x4
mem1[51] = 32'h00310233; //add x4 x2 x3
mem1[52] = 32'h0040A023; //sw x4 0 x1
mem1[53] = 32'h00108093; //addi x1 1 x1 
mem1[54] = 32'h00018113; //addi x2 0 x3
mem1[55] = 32'h00020193; //addi x3 0 x4
mem1[56] = 32'h00310233; //add x4 x2 x3
mem1[57] = 32'h0040A023; //sw x4 0 x1
mem1[58] = 32'h00108093; //addi x1 1 x1 
mem1[59] = 32'h00018113; //addi x2 0 x3
mem1[60] = 32'h00020193; //addi x3 0 x4

mem1[61] = 32'h00310233; //add x4 x2 x3
mem1[62] = 32'h0040A023; //sw x4 0 x1
mem1[63] = 32'h00108093; //addi x1 1 x1 
mem1[64] = 32'h00018113; //addi x2 0 x3
mem1[65] = 32'h00020193; //addi x3 0 x4
mem1[66] = 32'h00310233; //add x4 x2 x3
mem1[67] = 32'h0040A023; //sw x4 0 x1
mem1[68] = 32'h00108093; //addi x1 1 x1 
mem1[69] = 32'h00018113; //addi x2 0 x3
mem1[70] = 32'h00020193; //addi x3 0 x4
mem1[71] = 32'h00310233; //add x4 x2 x3
mem1[72] = 32'h0040A023; //sw x4 0 x1
mem1[73] = 32'h00108093; //addi x1 1 x1 
mem1[74] = 32'h00018113; //addi x2 0 x3
mem1[75] = 32'h00020193; //addi x3 0 x4
mem1[76] = 32'h00310233; //add x4 x2 x3
mem1[77] = 32'h0040A023; //sw x4 0 x1
mem1[78] = 32'h00108093; //addi x1 1 x1 
mem1[79] = 32'h00018113; //addi x2 0 x3
mem1[80] = 32'h00020193; //addi x3 0 x4
mem1[81] = 32'h00310233; //add x4 x2 x3
mem1[82] = 32'h0040A023; //sw x4 0 x1
mem1[83] = 32'h00108093; //addi x1 1 x1 
mem1[84] = 32'h00018113; //addi x2 0 x3
mem1[85] = 32'h00020193; //addi x3 0 x4

mem1[86] = 32'h00008093; //addi x1 0 x1


//loading
mem1[87] = 32'h00202303; //lw x7 2( x0)
mem1[88] = 32'h00302303; //lw x7 3( x0)
mem1[89] = 32'hFF00A483; //lw x7 -16( x1)
mem1[90] = 32'hFF10A483; //lw x7 -15( x1)
mem1[91] = 32'hFF20A483; //lw x7 -14( x1)
mem1[92] = 32'hFF30A483; //lw x7 -13( x1)
mem1[93] = 32'hFF40A483; //lw x7 -12( x1)
mem1[94] = 32'hFF50A483; //lw x7 -11( x1)
mem1[95] = 32'hFF60A483; //lw x7 -10( x1)
mem1[96] = 32'hFF70A483; //lw x7 -9( x1)
mem1[97] = 32'hFF80A483; //lw x7 -8( x1)
mem1[98] = 32'hFF90A483; //lw x7 -7( x1)
mem1[99] = 32'hFFA0A483; //lw x7 -6( x1)
mem1[100] = 32'hFFB0A483; //lw x7 -5( x1)
mem1[101] = 32'hFFC0A483; //lw x7 -4( x1)
mem1[102] = 32'hFFD0A483; //lw x7 -3( x1)
mem1[103] = 32'hFFE0A483; //lw x7 -2( x1)
mem1[104] = 32'hFFF0A483; //lw x7 -1( x1)

mem1[105] = 32'hFE4187E3; //beq x3 x4 mem1[87]

end
assign RD = mem1[PC];
endmodule
