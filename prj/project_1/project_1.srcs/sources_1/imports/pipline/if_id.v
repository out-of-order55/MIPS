`include    "E:\MIPS\work\rtl\pipline\defines.v"
module	if_id(
	input	wire			clk,
	input	wire			rst,
	input	wire	[31:0]	if_pc,
	input	wire	[31:0]	if_inst,
	
	output	reg		[31:0]	id_pc,
	output	reg		[31:0]	id_inst
);

always@(posedge	clk)
	if(rst==`RstEnable)begin
		id_pc<=`ZeroWord;
		id_inst<=`ZeroWord;
	end
	else   begin
		id_pc<=if_pc;
		id_inst<=if_inst;	
	end
		
		

endmodule