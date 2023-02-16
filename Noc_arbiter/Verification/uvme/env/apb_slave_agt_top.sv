/*class apb_slave_agt_top extends uvm_env;
	/////.....factory registration ...../////
	`uvm_component_utils(apb_slave_agt_top)
	apb_slave_agent apbsagnt[];
	noc_arb_env_config env_cfg;

	/////.....declare a handle for virtual sequencer...../////
	noc_arb_virtual_sequencer v_seqrh;

	/////..... function new constructor ...../////
	function new(string name = "apb_slave_agt_top",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(noc_arb_env_config)::get(this,"","env_config",env_cfg))begin
			`uvm_fatal("apb slave agt top","unable to get env config")
		end
		//env_cfg = noc_arb_env_config::type_id::create("env_cfg");
		//if(env_cfg.has_apb_slave_agent)begin
			apbsagnt = new[env_cfg.apb_slave];
		foreach(env_cfg.apbs_cfg[i])begin
			uvm_config_db#(apb_slave_config)::set(this,$sformatf("apbsagnt[%0d]*",i),"apb_slave_config",
			env_cfg.apbs_cfg[i]);
				//`uvm_fatal("apb_slave_agent_class","set the apb slave agent config")
			apbsagnt[i] = apb_slave_agent::type_id::create($sformatf("apbsagnt[%0d]",i),this);
		//end
		end
		if(env_cfg.has_virtual_sequencer)begin
			v_seqrh = noc_arb_virtual_sequencer::type_id::create("v_seqrh",this);
		end
	endfunction

		/////.....connect phase ...../////
	function void connect_phase(uvm_phase phase);
		if(env_cfg.has_virtual_sequencer)begin
			if(env_cfg.has_apb_slave_agent)begin
				foreach(apbsagnt[i])begin
					v_seqrh.apbseqrh[i] = apbsagnt[i].apbseqr;
				end
			end
		end
	endfunction 
endclass*/



class apb_slave_agt_top extends uvm_env;
	/////.....factory registration ...../////
	`uvm_component_utils(apb_slave_agt_top)
	apb_slave_agent apbsagnt;
	//noc_arb_env_config env_cfg;

	/////.....declare a handle for virtual sequencer...../////
	//noc_arb_virtual_sequencer v_seqrh;

	/////..... function new constructor ...../////
	function new(string name = "apb_slave_agt_top",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		/*if(!uvm_config_db#(noc_arb_env_config)::get(this,"","env_config",env_cfg))begin
			`uvm_fatal("apb slave agt top","unable to get env config")
		end
		//env_cfg = noc_arb_env_config::type_id::create("env_cfg");
		//if(env_cfg.has_apb_slave_agent)begin
			apbsagnt = new[env_cfg.apb_slave];
		foreach(env_cfg.apbs_cfg[i])begin
			uvm_config_db#(apb_slave_config)::set(this,$sformatf("apbsagnt[%0d]*",i),"apb_slave_config",
			env_cfg.apbs_cfg[i]);
				//`uvm_fatal("apb_slave_agent_class","set the apb slave agent config")
			apbsagnt[i] = apb_slave_agent::type_id::create($sformatf("apbsagnt[%0d]",i),this);
		//end
		end
		if(env_cfg.has_virtual_sequencer)begin
			v_seqrh = noc_arb_virtual_sequencer::type_id::create("v_seqrh",this);
		end*/
		apbsagnt = apb_slave_agent::type_id::create("apbsagnt",this);

	endfunction

		/////.....connect phase ...../////
	/*function void connect_phase(uvm_phase phase);
		if(env_cfg.has_virtual_sequencer)begin
			if(env_cfg.has_apb_slave_agent)begin
				foreach(apbsagnt[i])begin
					v_seqrh.apbseqrh[i] = apbsagnt[i].apbseqr;
				end
			end
		end
	endfunction */
endclass
