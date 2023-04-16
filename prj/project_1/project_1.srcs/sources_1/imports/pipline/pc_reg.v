`include	"defines.v"
module	pc_reg
(
	input 	wire				clk,
	input 	wire				rst,
	output 	reg		[31:0]		pc,
	output  reg					ce	
);

always@(posedge	clk)
	if(rst==`RstEnable)
		ce<=`ChipDisbale;
	else
		ce<=`ChipEnbale;
		
always@(posedge	clk)
	if(ce==`ChipDisable)
		pc<=32'h00000000;
	else	
		pc<=pc+4'h4;//一条指令32位,对应四个字节,故跳转四个


		
endmodule