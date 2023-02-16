/*class axi_master_agt_top extends uvm_env;
	/////.....factory registration ...../////
	`uvm_component_utils(axi_master_agt_top)
	axi_master_agent magnt[];
	noc_arb_env_config env_cfg;

	/////.....declare a handle for virtual sequencer...../////
	noc_arb_virtual_sequencer v_seqrh;

	/////..... function new constructor ...../////
	function new(string name = "axi_master_agt_top",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		if(!uvm_config_db#(noc_arb_env_config)::get(this,"","env_config",env_cfg))begin
			`uvm_fatal("master top class","unable to get the env config db")
		end
		//env_cfg = noc_arb_env_config::type_id::create("env_cfg");
		//if(env_cfg.has_axi_master_agent)begin
			magnt = new[env_cfg.axi_master];
		foreach(magnt[i])begin
			uvm_config_db#(axi_master_config)::set(this,$sformatf("magnt[%0d]*",i),"axi_master_config",env_cfg.axim_cfg[i]);
			//`uvm_fatal("master_agent_class","set the master agt config")

			magnt[i] = axi_master_agent::type_id::create($sformatf("magnt[%0d]",i),this);
		//end
		end
		super.build_phase(phase);
		if(env_cfg.has_virtual_sequencer)begin
			v_seqrh = noc_arb_virtual_sequencer::type_id::create("v_seqrh",this);
		end
	endfunction

		/////.....connect phase ...../////
	function void connect_phase(uvm_phase phase);
		if(env_cfg.has_virtual_sequencer)begin
			if(env_cfg.has_axi_master_agent)begin
				foreach(magnt[i])begin
					v_seqrh.mseqrh[i] = magnt[i].seqrh;
				end
			end
		end
	endfunction 
endclass*/

class axi_master_agt_top extends uvm_env;
	/////.....factory registration ...../////
	`uvm_component_utils(axi_master_agt_top)
	axi_master_agent magnt;
	//noc_arb_env_config env_cfg;

	/////.....declare a handle for virtual sequencer...../////
	//noc_arb_virtual_sequencer v_seqrh;

	/////..... function new constructor ...../////
	function new(string name = "axi_master_agt_top",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		//if(!uvm_config_db#(noc_arb_env_config)::get(this,"","env_config",env_cfg))begin
		//	`uvm_fatal("master top class","unable to get the env config db")
		//end
		//env_cfg = noc_arb_env_config::type_id::create("env_cfg");
		//if(env_cfg.has_axi_master_agent)begin
			//magnt = new[env_cfg.axi_master];
		//foreach(magnt[i])begin
		//	uvm_config_db#(axi_master_config)::set(this,$sformatf("magnt[%0d]*",i),"axi_master_config",env_cfg.axim_cfg[i]);
			//`uvm_fatal("master_agent_class","set the master agt config")

			magnt = axi_master_agent::type_id::create("magnt",this);
		//end
	//	end
		super.build_phase(phase);
		//if(env_cfg.has_virtual_sequencer)begin
			//v_seqrh = noc_arb_virtual_sequencer::type_id::create("v_seqrh",this);
		//end
	endfunction

		/////.....connect phase ...../////
	/*function void connect_phase(uvm_phase phase);
		if(env_cfg.has_virtual_sequencer)begin
			if(env_cfg.has_axi_master_agent)begin
				foreach(magnt[i])begin
					v_seqrh.mseqrh[i] = magnt[i].seqrh;
				end
			end
		end
	endfunction */
endclass


