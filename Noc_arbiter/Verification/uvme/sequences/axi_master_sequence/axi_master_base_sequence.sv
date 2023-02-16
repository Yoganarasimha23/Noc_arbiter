class axi_master_base_sequence extends uvm_sequence#(noc_arb_axi_master_transaction);

	/////.....factory registration...../////
	`uvm_object_utils(axi_master_base_sequence)

	/////.....function new constructor...../////
	function new(string name = "axi_master_base_sequence");
		super.new(name);
	endfunction

endclass
