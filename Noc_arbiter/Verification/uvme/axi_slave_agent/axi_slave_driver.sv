class axi_slave_driver extends uvm_driver #(uvm_sequence_item);

	/////.....factory registration...../////
	`uvm_component_utils(axi_slave_driver)

	/////.....function new constructor...../////
	function new (string name = "axi_slave_driver",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

endclass

