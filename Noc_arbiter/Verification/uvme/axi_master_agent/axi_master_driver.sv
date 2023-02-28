class axi_master_driver extends uvm_driver #(uvm_sequence_item);
	/////.....factory registration...../////
	`uvm_component_utils(axi_master_driver)

	/////.....function new constructor...../////
	function new(string name = "axi_master_driver",uvm_component parent);
		super.new(name,parent);
	endfunction

endclass

