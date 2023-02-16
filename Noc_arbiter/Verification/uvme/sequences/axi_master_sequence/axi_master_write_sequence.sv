class axi_master_write_sequence extends axi_master_base_sequence;

	/////.....factory registration...../////
	`uvm_object_utils(axi_master_write_sequence)

	/////.....function new constructor...../////
	function new(string name = "axi_master_write_sequence");
		super.new(name);
	endfunction

	/////.....task body to start a write transaction...../////
	task body();
		`uvm_info(get_full_name(),"axi write transaction",UVM_MEDIUM)
		req = noc_arb_axi_master_transaction::type_id::create("req");
		start_item(req);
		req.wr_en = 1;
		req.ARESETn = 1;
		req.ASW_RESET = 0;
		req.AWADDR = $urandom_range(32'hA0000000, 32'hA0039999);
		req.AWSIZE = 3'd2;
		req.AWBURST = 0;
		req.AWLEN = 0;
		req.AWVALID = 1'b1;
		req.WDATA = $random;
		req.WVALID = 1;
		req.WSTRB = 4'hF;
		req.BREADY = 1;
		finish_item(req);
		`uvm_info(get_full_name(),"write transaction completed",UVM_MEDIUM)
	endtask

endclass
