class axi_master_config extends uvm_object;
	/////.....factory registration ...../////
	`uvm_object_utils(axi_master_config)
	
	/////..... function new constructor ...../////
	function new(string name = "axi_master_config");
		super.new(name);
	endfunction
endclass
