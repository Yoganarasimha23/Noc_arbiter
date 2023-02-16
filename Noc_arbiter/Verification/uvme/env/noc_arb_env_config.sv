class noc_arb_env_config extends uvm_object;
	/////.....factory registration ...../////
	`uvm_object_utils(noc_arb_env_config)

	virtual axi4_master_if mvif;
	virtual axi_slave_if svif;
	virtual apb_slave_if avif;

	bit has_sb = 1;
	bit has_axi_master_agent = 1;
	bit has_axi_slave_agent = 1;
	bit has_apb_slave_agent = 1;
	bit has_virtual_sequencer = 1;

	int axi_master = 2;
	int axi_slave = 2;
	int apb_slave = 4;

	axi_master_config axim_cfg[];
	axi_slave_config axis_cfg[];
	apb_slave_config apbs_cfg[];




	/////.....function new constructor ...../////
	function new(string name = "noc_arb_env_config");
		super.new(name);
		/*axim_cfg = new[axi_master];
		axis_cfg = new[axi_slave];
		apbs_cfg = new[apb_slave];*/
	endfunction
endclass
