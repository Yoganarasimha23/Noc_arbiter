interface axi_slave_if (input logic ACLK, ARESETn, ASW_RESET);
	////....write address chanel....////
	////....input signals....////
	logic AWREADY;
	logic WREADY;
	logic [1:0]BRESP;
	logic BVALID;
	logic [3:0]BID;
	////....read address chanel....////
	logic [3:0]RID;
	logic ARREADY;
	logic [31:0]RDATA;
	logic [1:0]RESP;
	logic RVALID;
	logic RLAST;
	logic RREADY;
endinterface
