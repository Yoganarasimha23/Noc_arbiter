interface axi4s1_if(input logic ACLK, ARESETn, ASW_RESET);
	////....write address chanel....////
	logic S0_AWREADY;
	logic S0_WREADY;
	logic [1:0]S0_BRESP;
	logic S0_BVALID;
	logic [3:0]S0_BID;
	////....read address chanel....////
	logic [3:0]S0_RID;
	logic S0_ARREADY;
	logic [31:0]S0_RDATA;
	logic [1:0]S0_RESP;
	logic S0_RVALID;
	logic S0_RLAST;
	logic S0_RREADY;
endinterface
