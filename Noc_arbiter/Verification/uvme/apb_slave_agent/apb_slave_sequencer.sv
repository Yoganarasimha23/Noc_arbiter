class apb_slave_sequencer extends uvm_sequencer #(uvm_sequence_item);
	/////.....factory registration...../////
	`uvm_component_utils(apb_slave_sequencer)

	/////.....function new constructor...../////
	function new(string name = "apb_slave_sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
