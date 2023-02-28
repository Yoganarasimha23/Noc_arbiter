interface axi4m2_if(input logic ACLK,ARESETn,ASW_RESET);
	logic [3:0]M1_MID;
	logic [3:0]M1_AWID;
	logic [2:0]M1_AWPROT;
	logic [2:0]M1_ARPROT;
	////....write address signals....////
	logic M0_AWVALID;
	logic [31:0]M1_AWADDR;
	logic [3:0]M1_AWLEN;
	logic [1:0]M1_AWBURST;
	
	////....write data signals....////
	logic M1_WVALID;
	logic [31:0]M1_WDATA;
	logic M1_WLAST;
	logic [3:0]M1_WSTRB;

	////....write response signal....////
	logic M1_BREADY;

	////....read address signals....////
	logic M1_ARVALID;
	logic [31:0]M1_ARADDR;
	logic [3:0]M1_ARLEN;
	logic [1:0]M1_ARBURST;

	////....read response signal....////
	logic M1_RREADY;
endinterface

