class axi_slave_write_sequence extends uvm_sequence#(noc_arb_axi_slave_transaction);

	/////.....factory registration...../////
	`uvm_object_utils(axi_slave_write_sequence)

	/////.....function new constructor...../////
	function new(string name = "axi_slave_write_sequence");
		super.new(name);
	endfunction

	/////.....task body to start write transaction...../////
	task body();
		`uvm_info(get_full_name(),"axi slave write operation",UVM_MEDIUM)
		req = noc_arb_axi_slave_transaction::type_id::create("req");
		start_item(req);
		req.wr_en=1;
		req.ARESETn = 1;
		req.ASW_RESET = 0;
		req.AWREADY = 1;
		req.WREADY = 1;
		req.BRESP = 1;
		req.BVALID = 1;
		finish_item(req);
		`uvm_info(get_full_name(),"axi slave write operation completed",UVM_MEDIUM)
		
	endtask
endclass
