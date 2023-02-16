class noc_arb_axi_slave_transaction extends uvm_sequence_item;

	////....factory registration ....////
	`uvm_object_utils(noc_arb_axi_slave_transaction)

	////....input signals....////
	rand bit wr_en;
	rand bit ARESETn;
	rand bit ASW_RESET;
	rand bit AWREADY;
	rand bit WREADY;
	rand logic [1:0]BRESP;
	rand logic BVALID;
	rand logic [3:0]BID;
	/////.....output signals...../////
	rand logic AWVALID;
	rand logic [31:0]AWADDR;
	rand logic AWLEN;
	rand logic [1:0]AWBURST;
	rand logic WVALID;
	rand logic [31:0]WDATA;
	rand logic WLAST;
	rand logic [3:0]WSTRB;
	rand logic BREADY;
	/////.....read address chanel....////
	rand logic [3:0]RID;
	rand logic ARREADY;
	rand logic [31:0]RDATA;
	rand logic [1:0]RRESP;
	rand logic RVALID;
	rand logic RLAST;
	rand logic RREADY;

	/////.....OUTPUT SIGNALS.....//////
	rand logic ARVALID;
	rand logic [31:0]ARADDR;
	rand logic [3:0]ARLEN;
	rand logic [1:0]ARBURST;
	//logic RREADY;	

	////....function new constructor ....////
	function new(name="noc_arb_axi_slave_transaction");
		super.new(name);
	endfunction
endclass
