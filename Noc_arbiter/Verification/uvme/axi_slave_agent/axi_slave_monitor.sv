class axi_slave_monitor extends uvm_monitor;

	/////.....factory registration ...../////
	`uvm_component_utils(axi_slave_monitor)

	/////function new constructor...../////
	function new (string name = "axi_slave_monitor",uvm_component parent);
		super.new(name,parent);
	endfunction 

	/////.....build phase ...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction 

endclass
