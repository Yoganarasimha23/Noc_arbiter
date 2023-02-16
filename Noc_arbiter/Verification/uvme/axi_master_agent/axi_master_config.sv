class axi_master_config extends uvm_object;
	/////.....factory registration ...../////
	`uvm_object_utils(axi_master_config)
	
	virtual axi4_master_if mvif;
	//virtual axi4_master_if mvif1;
	/////.....active/passive setting...../////
	uvm_active_passive_enum is_active = UVM_ACTIVE;
	
	/////..... function new constructor ...../////
	function new(string name = "axi_master_config");
		super.new(name);
	endfunction
endclass
