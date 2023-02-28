interface axi4m1_if(input logic ACLK,ARESETn,ASW_RESET);
	logic [3:0]M0_MID;
	logic [3:0]M0_AWID;
	logic [2:0]M0_AWPROT;
	logic [2:0]M0_ARPROT;
	////....write address signals....////
	////....input signals ....////
	logic M0_AWVALID;
	logic [31:0]M0_AWADDR;
	logic [3:0]M0_AWLEN;
	logic [1:0]M0_AWBURST;

	////....output signals....////
	logic AWREADY;
	logic WREADY;
	logic BVALID;
	logic [1:0]BRESP;
	
	////....write data signals....////
	logic M0_WVALID;
	logic [31:0]WDATA;
	logic WLAST;
	logic [3:0]M0_WSTRB;

	////....write response signal....////
	logic M0_BREADY;

	////....read address signals....////
	////....input signals.....////
	logic M0_ARVALID;
	logic [31:0]M0_ARADDR;
	logic [3:0]M0_ARLEN;
	logic [1:0]M0_ARBURST;

	////....output signals....////
	logic ARREADY;
	logic RVALID_O;
	logic [31:0]RDATA;
	logic [1:0]RRESP;

	////....read response signal....////
	logic M0_RREADY;
endinterface

	
