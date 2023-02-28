class noc_arb_axi_slave_transaction extends uvm_sequence_item;

	////....factory registration ....////
	`uvm_object_utils(noc_arb_axi_slave_transaction)

	////....function new constructor ....////
	function new(name="noc_arb_axi_slave_transaction");
		super.new(name);
	endfunction
endclass
