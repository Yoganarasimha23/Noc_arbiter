class apb_slave_config extends uvm_object;
	/////.....factory registration...../////
	`uvm_object_utils(apb_slave_config)

	virtual apb_slave_if avif;

	/////.....active/passive setting ...../////
	uvm_active_passive_enum is_active = UVM_ACTIVE;
	/////.....function new constructor...../////
	function new(string name = "apb_slave_config");
		super.new(name);
	endfunction
endclass
