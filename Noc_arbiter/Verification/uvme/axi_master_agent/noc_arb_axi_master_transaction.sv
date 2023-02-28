class noc_arb_axi_master_transaction extends uvm_sequence_item;
	
	////....factory registration ....////
	`uvm_object_utils(noc_arb_axi_master_transaction)

	////....function new constructor ....////
	function new(string name="noc_arb_axi_master_transaction");
		super.new(name);
	endfunction


endclass

