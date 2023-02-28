class noc_arb_env_config extends uvm_object;
	/////.....factory registration ...../////
	`uvm_object_utils(noc_arb_env_config)
	bit has_sb = 1;
	bit has_axi_master_agent = 1;
	bit has_axi_slave_agent = 1;
	bit has_apb_slave_agent = 1;

	axi_master_config axim_cfg[];
	axi_slave_config axis_cfg[];
	apb_slave_config apbs_cfg[];


	int no_of_agents = 8;

	/////.....function new constructor ...../////
	function new(string name = "noc_arb_env_config");
		super.new(name);
	endfunction
endclass
