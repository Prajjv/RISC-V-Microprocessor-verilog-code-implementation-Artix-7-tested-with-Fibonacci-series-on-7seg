module immediategeneration #(parameter Width = 32)(
input [1:0]immsrc,[31:0] instr,
output reg [Width-1:0] extimm);

always @(*)
begin
case(immsrc)

//R-type has no immediate

         2'b 00:extimm={{20{instr[31]}},instr[31:20]}; //I type
		 
		 2'b 01:extimm={{21{instr[31]}},instr[30:25],instr[11:7]};//S type
		 
		 2'b 10:extimm={{20{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0};//B type
		 
		 2'b 11:extimm={{12{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0};//U type
		 
		 default:extimm=32'bx;
endcase
end
//assign Out = {{52{In[31]}},In[31:20]};
endmodule