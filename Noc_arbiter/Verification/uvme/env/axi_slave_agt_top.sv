/*class axi_slave_agt_top extends uvm_env;
	/////.....factory registration ...../////
	`uvm_component_utils(axi_slave_agt_top)
	axi_slave_agent sagnt[];
	noc_arb_env_config env_cfg;

	/////.....declares a handle for virtual sequencer...../////
	noc_arb_virtual_sequencer v_seqrh;

	/////..... function new constructor ...../////
	function new(string name = "axi_slave_agt_top",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(noc_arb_env_config)::get(this,"","env_config",env_cfg))begin
			`uvm_fatal("axi slave agent top","unable to get the env config")
		end
		//env_cfg = noc_arb_env_config::type_id::create("env_cfg");
		//if(env_cfg.has_axi_slave_agent)begin
			sagnt = new[env_cfg.axi_slave];
		foreach(sagnt[i])begin
			uvm_config_db#(axi_slave_config)::set(this,$sformatf("sagnt[%0d]*",i),"axi_slave_config",env_cfg.axis_cfg[i]);
				//`uvm_fatal("slave_agent_top_class","axi agent config is set")
			sagnt[i] = axi_slave_agent::type_id::create($sformatf("sagnt[%0d]",i),this);
		//end
		end
		if(env_cfg.has_virtual_sequencer)begin
			v_seqrh = noc_arb_virtual_sequencer::type_id::create("v_seqrh",this);
		end
	endfunction

	/////.....connect phase ...../////
	function void connect_phase(uvm_phase phase);
		if(env_cfg.has_virtual_sequencer)begin
			if(env_cfg.has_axi_slave_agent)begin
				foreach(sagnt[i])begin
					v_seqrh.sseqrh[i] = sagnt[i].sseqrh;
				end
			end
		end
	endfunction 
endclass*/


class axi_slave_agt_top extends uvm_env;
	/////.....factory registration ...../////
	`uvm_component_utils(axi_slave_agt_top)
	axi_slave_agent sagnt;
	//noc_arb_env_config env_cfg;

	/////.....declares a handle for virtual sequencer...../////
	//noc_arb_virtual_sequencer v_seqrh;

	/////..... function new constructor ...../////
	function new(string name = "axi_slave_agt_top",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		/*if(!uvm_config_db#(noc_arb_env_config)::get(this,"","env_config",env_cfg))begin
			`uvm_fatal("axi slave agent top","unable to get the env config")
		end
		//env_cfg = noc_arb_env_config::type_id::create("env_cfg");
		//if(env_cfg.has_axi_slave_agent)begin
			sagnt = new[env_cfg.axi_slave];
		foreach(sagnt[i])begin
			uvm_config_db#(axi_slave_config)::set(this,$sformatf("sagnt[%0d]*",i),"axi_slave_config",env_cfg.axis_cfg[i]);
				//`uvm_fatal("slave_agent_top_class","axi agent config is set")
			sagnt[i] = axi_slave_agent::type_id::create($sformatf("sagnt[%0d]",i),this);
		//end
		end
		if(env_cfg.has_virtual_sequencer)begin
			v_seqrh = noc_arb_virtual_sequencer::type_id::create("v_seqrh",this);
		end*/
		sagnt = axi_slave_agent::type_id::create("sagnt",this);
	endfunction

	/////.....connect phase ...../////
	/*function void connect_phase(uvm_phase phase);
		if(env_cfg.has_virtual_sequencer)begin
			if(env_cfg.has_axi_slave_agent)begin
				foreach(sagnt[i])begin
					v_seqrh.sseqrh[i] = sagnt[i].sseqrh;
				end
			end
		end
	endfunction */
endclass
