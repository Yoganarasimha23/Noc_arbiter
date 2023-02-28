class noc_arb_base_test extends uvm_test;
	/////.....factory registration...../////
	`uvm_component_utils(noc_arb_base_test)

	noc_arb_env envh;
	//noc_arb_env_config env_cfg;

	//axi_master_config m_cfg[];
	//axi_slave_config s_cfg[];
	//apb_slave_config apbs_cfg[];

	int has_axi_master_agent = 2;
	int has_axi_slave_agent = 2;
	int has_apb_slave_agent = 4;
	int no_of_agent = 8;

	/////.....function new constructor ...../////
	function new(string name = "noc_arb_base_test",uvm_component parent);
		super.new(name,parent);
	endfunction 

	/////.....build phase...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		envh = noc_arb_env::type_id::create("envh",this);
		//env_cfg = noc_arb_env_config::type_id::create("env_cfg",this);
		/*foreach(m_cfg[i])begin
			m_cfg[i] = axi_master_config::type_id::create($sformatf("m_cfg[%0d]",i));
		end
		foreach(s_cfg[i])begin
			s_cfg[i] = axi_slave_config::type_id::create($sformatf("s_cfg[%0d]",i));
		end
		foreach(apbs_cfg[i])begin
			apbs_cfg[i] = apb_slave_config::type_id::create($sformatf("apbs_cfg[%0d]",i));
		end*/
	endfunction
	/////.....end of elaboration phase for printing topology...../////
	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction
endclass

