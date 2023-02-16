interface axi4s2_if(input logic ACLK, ARESETn, ASW_RESET);
	////....write address chanel....////
	logic S1_AWREADY;
	logic S1_WREADY;
	logic [1:0]S1_BRESP;
	logic S1_BVALID;
	logic [3:0]S1_BID;
	////....read address chanel....////
	logic [3:0]S1_RID;
	logic S1_ARREADY;
	logic [31:0]S1_RDATA;
	logic [1:0]S1_RESP;
	logic S1_RVALID;
	logic S1_RLAST;
	logic S1_RREADY;
endinterface
