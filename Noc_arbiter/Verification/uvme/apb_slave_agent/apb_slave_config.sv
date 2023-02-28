class apb_slave_config extends uvm_object;
	/////.....factory registration...../////
	`uvm_object_utils(apb_slave_config)

	/////.....function new constructor...../////
	function new(string name = "apb_slave_config");
		super.new(name);
	endfunction
endclass
