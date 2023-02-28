class axi_master_agt_top extends uvm_env;
	/////.....factory registration ...../////
	`uvm_component_utils(axi_master_agt_top)
	axi_master_agent magnt[];
	noc_arb_env_config cfg;

	/////..... function new constructor ...../////
	function new(string name = "axi_master_agt_top",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		foreach(magnt[i])
			magnt[i] = axi_master_agent::type_id::create($sformatf("magnt[%0d]",i),this);
	endfunction
endclass

