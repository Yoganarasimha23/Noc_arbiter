class noc_arb_env extends uvm_env;
	/////.....factory registration...../////
	`uvm_component_utils(noc_arb_env)

	axi_master_agt_top axi_master_top;
	axi_slave_agt_top axi_slave_top;
	apb_slave_agt_top apb_slave_top;
	

	//noc_arb_env_config e_cfg;

	/////.....function new constructor...../////
	function new(string name = "noc_arb_env",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase ...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		apb_slave_top = apb_slave_agt_top::type_id::create("apb_slave_top",this);
		axi_master_top = axi_master_agt_top::type_id::create("axi_master_top",this);
		axi_slave_top = axi_slave_agt_top::type_id::create("axi_slave_top",this);
	endfunction

endclass 

	
