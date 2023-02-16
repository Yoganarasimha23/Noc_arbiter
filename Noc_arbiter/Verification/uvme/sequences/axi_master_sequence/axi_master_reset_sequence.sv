class axi_master_reset_sequence extends axi_master_base_sequence;

	/////.....factory registration...../////
	`uvm_object_utils(axi_master_reset_sequence)

	int scenario;


	/////.....function new constructor...../////
	function new(string name = "axi_master_reset_sequence");
		super.new(name);
	endfunction

	/////.....task body to start reset sequence...../////
	task body();
		req = noc_arb_axi_master_transaction::type_id::create("req");
		`uvm_info(get_type_name(),"reset sequence started",UVM_MEDIUM)
		start_item(req);
		req.ARESETn = 0;
		$display("ARSETn=%0d",req.ARESETn);
		req.ASW_RESET = 1;
		req.AWVALID = 0;
		req.AWADDR = 0;
		req.AWBURST = 0;
		req.AWLEN = 0;
		finish_item(req);

		start_item(req);
		req.ARESETn = 1;
		req.ASW_RESET = 0;
		req.AWVALID = 0;
		req.AWADDR = 0;
		req.AWBURST = 0;
		req.AWLEN = 0;
		finish_item(req);
	endtask
endclass



