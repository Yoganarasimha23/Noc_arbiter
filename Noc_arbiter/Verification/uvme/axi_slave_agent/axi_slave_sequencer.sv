class axi_slave_sequencer extends uvm_sequencer #(noc_arb_axi_slave_transaction);
	
	/////.....factory registration ...../////
	`uvm_component_utils(axi_slave_sequencer)

	/////.....function new constructor ...../////
	function new(string name = "axi_slave_sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction 

endclass
