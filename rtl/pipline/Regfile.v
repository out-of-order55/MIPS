`include	"defines.v"
module	Regfile(
	input				rst,
	input				clk,
	input	[4:0]		waddr,
	input	[31:0]		wdata,
	input				we,
	
	input	[4:0]		raddr1,
	input	[31:0]		rdata1,
	input				re1,
	
	input	[4:0]		raddr2,
	input	[31:0]		rdata2,
	input				re2,
	
	output	reg[31:0]	rdata1,
	output	reg[31:0]	rdata2
);

reg[`RegBus]	mem[0:`RegNum-1];

always@(posedge clk)
	if(rst==`RstDisable)begin
		if(we==`WriteEnable&&waddr!=`RegNumLog2'h0)begin//MIPS规定$0reg只能为零,不能赋值
			mem[waddr]<=wdata;							
		end
	end

always@(posedge clk)
	if(rst==`RstEnable)
		rdata1<=`ZeroWord;
	else	if(raddr1==`RegNumLog2'h0)
		rdata1<=`ZeroWord;
	else	if(raddr1==waddr&&we==`WriteEnable&&re1==`ReadEnable)
		rdata1<=wdata;
	else	if(re1==`ReadEnable)
		rdata1<=mem[raddr1];
	else
		rdata1<=`ZeroWord;

always@(posedge clk)
	if(rst==`RstEnable)
		rdata2<=`ZeroWord;
	else	if(raddr2==`RegNumLog2'h0)
		rdata2<=`ZeroWord;
	else	if(raddr2==waddr&&we==`WriteEnable&&re2==`ReadEnable)
		rdata2<=wdata;
	else	if(re2==`ReadEnable)
		rdata2<=mem[raddr2];
	else
		rdata2<=`ZeroWord;

endmodule