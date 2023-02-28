interface axi4_master_if(input logic ACLK,ARESETn,ASW_RESET);
	logic [3:0]MID;
	logic [3:0]AWID;
	logic [2:0]AWPROT;
	logic [2:0]ARPROT;
	////....write address signals....////
	/////.....input signals ...../////
	logic AWVALID;
	logic [31:0]AWADDR;
	logic [3:0]AWLEN;
	logic [1:0]AWBURST;
	/////.....output signals ...../////
	logic AWREADY;
	logic WREADY;
	logic BVALID;
	logic [1:0]BRESP;
	
	////....write data signals....////
	logic WVALID;
	logic [31:0]WDATA;
	logic WLAST;
	logic [3:0]WSTRB;

	////....write response signal....////
	logic BREADY;

	////....read address signals....////
	/////.....input signals...../////
	logic ARVALID;
	logic [31:0]ARADDR;
	logic [3:0]ARLEN;
	logic [1:0]ARBURST;
	/////.....output signals...../////
	logic ARREADY;
	logic RVALID_O;
	logic [31:0]RDATA;
	logic [1:0]RRESP;

	////....read response signal....////
	logic RREADY;
endinterface
