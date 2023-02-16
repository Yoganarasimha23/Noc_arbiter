class noc_arb_axi_master_transaction extends uvm_sequence_item;
	
	////....factory registration ....////
	`uvm_object_utils(noc_arb_axi_master_transaction)
	rand bit wr_en;
	rand logic ARESETn;
	rand logic ASW_RESET;
	rand logic [3:0]MID;
	rand logic [3:0]AWID;
	rand logic [2:0]AWPROT;
	rand logic [2:0]ARPROT;
	////....write address signals....////
	/////.....input signals ...../////
	rand logic AWVALID;
	rand logic [31:0]AWADDR;
	rand logic [3:0]AWLEN;
	rand logic [1:0]AWBURST;
	rand logic [2:0]AWSIZE;
	/////.....output signals ...../////
	rand logic AWREADY;
	rand logic WREADY;
	rand logic BVALID;
	rand logic [1:0]BRESP;
	
	////....write data signals....////
	rand logic WVALID;
	rand logic [31:0]WDATA;
	rand logic WLAST;
	rand logic [3:0]WSTRB;

	////....write response signal....////
	rand logic BREADY;

	////....read address signals....////
	/////.....input signals...../////
	rand logic ARVALID;
	rand logic [31:0]ARADDR;
	rand logic [3:0]ARLEN;
	rand logic [1:0]ARBURST;
	rand logic ARSIZE;
	/////.....output signals...../////
	rand logic ARREADY;
	rand logic RVALID;
	rand logic [31:0]RDATA;
	rand logic [1:0]RRESP;

	////....read response signal....////
	rand logic RREADY;


	////....function new constructor ....////
	function new(string name="noc_arb_axi_master_transaction");
		super.new(name);
	endfunction


endclass

