class axi_master_sequencer extends uvm_sequencer #(uvm_sequence_item);
	/////.....factory registration...../////
	`uvm_component_utils(axi_master_sequencer)

	/////.....function new constructor...../////
	function new(string name = "axi_master_sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction 
endclass
