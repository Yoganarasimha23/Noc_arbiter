interface axi_slave_if (input logic ACLK);
	////....write address chanel....////
	////....input signals....////
	logic ARESETn;
	logic ASW_RESET;
	logic AWREADY;
	logic WREADY;
	logic [1:0]BRESP;
	logic BVALID;
	logic [3:0]BID;
	/////.....output signals...../////
	logic AWVALID;
	logic [31:0]AWADDR;
	logic AWLEN;
	logic [1:0]AWBURST;
	logic WVALID;
	logic [31:0]WDATA;
	logic WLAST;
	logic [3:0]WSTRB;
	logic BREADY;
	/////.....read address chanel....////
	logic [3:0]RID;
	logic ARREADY;
	logic [31:0]RDATA;
	logic [1:0]RRESP;
	logic RVALID;
	logic RLAST;
	logic RREADY;

	/////.....OUTPUT SIGNALS.....//////
	logic ARVALID;
	logic [31:0]ARADDR;
	logic [3:0]ARLEN;
	logic [1:0]ARBURST;
	//logic RREADY;

endinterface
