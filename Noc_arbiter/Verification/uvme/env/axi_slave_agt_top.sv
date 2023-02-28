class axi_slave_agt_top extends uvm_env;
	/////.....factory registration ...../////
	`uvm_component_utils(axi_slave_agt_top)
	axi_slave_agent sagnt[];
	noc_arb_env_config cfg;

	/////..... function new constructor ...../////
	function new(string name = "axi_slave_agt_top",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		foreach(sagnt[i])
			sagnt[i] = axi_slave_agent::type_id::create($sformatf("sagnt[%0d]",i),this);
	endfunction
endclass
