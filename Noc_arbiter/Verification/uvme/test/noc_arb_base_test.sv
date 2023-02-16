class noc_arb_base_test extends uvm_test;
	/////.....factory registration...../////
	`uvm_component_utils(noc_arb_base_test)

	int no_of_axim_agent = 2;
	int no_of_axis_agent = 2;
	int no_of_apbs_agent = 4;

	virtual axi4_master_if mvif;
	virtual axi_slave_if svif;
	virtual apb_slave_if avif;

	noc_arb_env envh;
	noc_arb_env_config env_cfg;

	axi_master_config axim_cfg[];
	axi_slave_config axis_cfg[];
	apb_slave_config apbs_cfg[];

	int has_axi_master_agent = 1;
	int has_axi_slave_agent = 1;
	int has_apb_slave_agent = 1;
	//int no_of_agent = 8;

	/////.....function new constructor ...../////
	function new(string name = "noc_arb_base_test",uvm_component parent);
		super.new(name,parent);
	endfunction 

	/////.....build phase...../////
	function void build_phase(uvm_phase phase);
		envh = noc_arb_env::type_id::create("envh",this);
		env_cfg = noc_arb_env_config::type_id::create("env_cfg");

		if(has_axi_master_agent) begin
			axim_cfg = new[no_of_axim_agent];
		end
		foreach(axim_cfg[i])begin
			axim_cfg[i] = axi_master_config::type_id::create($sformatf("axim_cfg[%0d]",i));
		
		if(!uvm_config_db#(virtual axi4_master_if)::get(this,"",$sformatf("mvif%0d",i),axim_cfg[i].mvif))
			`uvm_fatal("axi_master","unable to get the interface")
			axim_cfg[i].is_active = UVM_ACTIVE;	
			env_cfg.axim_cfg = axim_cfg;
		//end
		end
		
		/////..... axi slave agent configure...../////
		if(has_axi_slave_agent)begin
			axis_cfg = new[no_of_axis_agent];
		end
		foreach(axis_cfg[i])begin
			axis_cfg[i] = axi_slave_config::type_id::create($sformatf("axis_cfg[%0d]",i));
		if(!uvm_config_db#(virtual axi_slave_if)::get(this,"",$sformatf("svif%0d",i),axis_cfg[i].svif))
			`uvm_fatal("axi_slave","unable to get axi slave interface")
			axis_cfg[i].is_active = UVM_ACTIVE;
						
		env_cfg.axis_cfg = axis_cfg;
		end
		//end

		/////.....apb slave configure...../////
		if(has_apb_slave_agent)begin
			apbs_cfg = new[no_of_apbs_agent];
		end
			
		foreach(apbs_cfg[i])begin
			apbs_cfg[i] = apb_slave_config::type_id::create($sformatf("apbs_cfg[%0d]",i));
		if(!uvm_config_db#(virtual apb_slave_if)::get(this,"",$sformatf("avif%0d",i),apbs_cfg[i].avif))
			`uvm_fatal("apb_slave","unable to get apb interface ")
			apbs_cfg[i].is_active = UVM_ACTIVE;
		
		env_cfg.apbs_cfg = apbs_cfg;
		end
		//end
		env_cfg.axi_master = no_of_axim_agent;
		env_cfg.axi_slave = no_of_axis_agent;
		env_cfg.apb_slave = no_of_apbs_agent;
		env_cfg.has_axi_master_agent = has_axi_master_agent;
		env_cfg.has_axi_slave_agent = has_axi_slave_agent;
		env_cfg.has_apb_slave_agent = has_apb_slave_agent;
				
		
		uvm_config_db#(noc_arb_env_config)::set(this,"*","env_config",env_cfg);
		//`uvm_fatal("env_config","env config is set")
		//`uvm_info(get_type_name(),"env config is set",UVM_LOW)
		super.build_phase(phase);
		endfunction
	/////.....end of elaboration phase for printing topology...../////
	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		begin
		phase.raise_objection(this);

		phase.drop_objection(this);
		end
	endtask
endclass

