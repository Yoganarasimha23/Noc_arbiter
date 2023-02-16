class noc_arb_virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);

	/////.....factory registration...../////
	`uvm_component_utils(noc_arb_virtual_sequencer)

	//////.....declare a dynamic  handles for axi master, slave sequencer and apb sequencer...../////
	axi_master_sequencer mseqrh[];
	axi_slave_sequencer sseqrh[];
	apb_slave_sequencer apbseqrh[];

	/////.....declare a handle for  env config db...../////
	noc_arb_env_config env_cfg;

	/////.....function new constructor ...../////
	function new(string name = "noc_arb_virtual_sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build_phase ...../////
	function void build_phase(uvm_phase phase);
		/////.....get the env config db...../////
		if(!uvm_config_db#(noc_arb_env_config)::get(this,"","env_config",env_cfg))begin
			`uvm_fatal("virtual config","unable to get the env config. have you set() it ?")
		end
		super.build_phase(phase);
		mseqrh = new[env_cfg.axi_master];
		sseqrh = new[env_cfg.axi_slave];
		apbseqrh = new[env_cfg.apb_slave];
	endfunction

endclass

