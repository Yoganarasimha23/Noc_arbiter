class axi_master_monitor extends uvm_monitor;
	/////.....factory registratio ...../////
	`uvm_component_utils(axi_master_monitor)

	/////.....function new constructor ...../////
	function new(string name = "axi_master_monitor",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase ...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

endclass
