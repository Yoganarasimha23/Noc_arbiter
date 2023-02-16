class axi_slave_config extends uvm_object;
	/////.....factory registration...../////
	`uvm_object_utils(axi_slave_config)

	virtual axi_slave_if svif;
	
	/////.....active/passive setting ...../////
	uvm_active_passive_enum is_active = UVM_ACTIVE;
	/////.....function new constructor ...../////
	function new (string name = "axi_slave_config");
		super.new(name);
	endfunction
endclass
