/*class noc_arb_env extends uvm_env;
	/////.....factory registration...../////
	`uvm_component_utils(noc_arb_env)
	/////.....declare a handle for axi master and slave agent top and apb agent top ...../////
	axi_master_agt_top axi_master_top;
	axi_slave_agt_top axi_slave_top;
	apb_slave_agt_top apb_slave_top;
	/////....declare a handle for noc arbiter virtual sequencer...../////
	//noc_arb_virtual_sequencer v_seqrh;
	

	noc_arb_env_config env_cfg;

	/////.....function new constructor...../////
	function new(string name = "noc_arb_env",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase ...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		axi_master_top = axi_master_agt_top::type_id::create("axi_master_top",this);
		axi_slave_top = axi_slave_agt_top::type_id::create("axi_slave_top",this);
		apb_slave_top = apb_slave_agt_top::type_id::create("apb_slave_top",this);
		if(!uvm_config_db#(noc_arb_env_config)::get(this,"","env_config",env_cfg)) begin
			`uvm_fatal("env class ","unable to get the env config from test")
		end
		/*if(env_cfg.has_virtual_sequencer)begin
			v_seqrh = noc_arb_virtual_sequencer::type_id::create("v_seqrh",this);
		end*/
	//endfunction

	/////.....connect phase ...../////
	/*function void connect_phase(uvm_phase phase);
		if(env_cfg.has_virtual_sequencer)begin
			if(env_cfg.has_axi_master_agent)begin
				for(int i=0; i < axi_master_top.magnt.size();i++)begin
					v_seqrh.mseqrh[i] = axi_master_top.magnt[i].seqrh;
				end
			end

			if(env_cfg.has_axi_slave_agent)begin
				for(int i = 0;i < axi_slave_top.sagnt.size();i++)begin
					v_seqrh.sseqrh[i] = axi_slave_top.sagnt[i].sseqrh;
				end
			end

			if(env_cfg.has_apb_slave_agent)begin
				for(int i=0; i< apb_slave_top.apbsagnt.size();i++)begin
					v_seqrh.apbseqrh[i] = apb_slave_top.apbsagnt[i].apbseqr;
				end
			end
		end
	endfunction ////
				

endclass*/ 
class noc_arb_env extends uvm_env;
	/////.....factory registration...../////
	`uvm_component_utils(noc_arb_env)
	/////.....declare a handle for axi master and slave agent top and apb agent top ...../////
	axi_master_agt_top axi_master_top[];
	axi_slave_agt_top axi_slave_top[];
	apb_slave_agt_top apb_slave_top[];
	/////....declare a handle for noc arbiter virtual sequencer...../////
	noc_arb_virtual_sequencer v_seqrh;
	
	/////.....declare a handle for env config db ...../////
	noc_arb_env_config env_cfg;

	/////.....function new constructor...../////
	function new(string name = "noc_arb_env",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase ...../////
	function void build_phase(uvm_phase phase);
		if(!uvm_config_db#(noc_arb_env_config)::get(this,"","env_config",env_cfg)) begin
			`uvm_fatal("env class ","unable to get the env config from test")
		end 
		if(env_cfg.has_axi_master_agent)begin
			axi_master_top = new[env_cfg.axi_master];
			foreach(axi_master_top[i])begin
				uvm_config_db#(axi_master_config)::set(this,$sformatf("axi_master_top[%0d]*",i),"axi_master_config",
				env_cfg.axim_cfg[i]);
				axi_master_top[i] = axi_master_agt_top::type_id::create($sformatf("axi_master_top[%0d]",i),this);
			end
		end

		if(env_cfg.has_axi_slave_agent)begin
			axi_slave_top = new[env_cfg.axi_slave];
			foreach(axi_slave_top[i])begin
				uvm_config_db#(axi_slave_config)::set(this,$sformatf("axi_slave_top[%0d]*",i),"axi_slave_config",
				env_cfg.axis_cfg[i]);
				axi_slave_top[i] = axi_slave_agt_top::type_id::create($sformatf("axi_slave_top[%0d]",i),this);
			end
		end

		if(env_cfg.has_apb_slave_agent)begin
			apb_slave_top = new[env_cfg.apb_slave];
			foreach(apb_slave_top[i])begin
				uvm_config_db#(apb_slave_config)::set(this,$sformatf("apb_slave_top[%0d]*",i),"apb_slave_config",
				env_cfg.apbs_cfg[i]);
				apb_slave_top[i] = apb_slave_agt_top::type_id::create($sformatf("apb_slave_top[%0d]",i),this);
			end
		end
		super.build_phase(phase);
		

				

		/*axi_master_top = axi_master_agt_top::type_id::create("axi_master_top",this);
		axi_slave_top = axi_slave_agt_top::type_id::create("axi_slave_top",this);
		apb_slave_top = apb_slave_agt_top::type_id::create("apb_slave_top",this);
		end*/
		if(env_cfg.has_virtual_sequencer)begin
			v_seqrh = noc_arb_virtual_sequencer::type_id::create("v_seqrh",this);
		end
	endfunction

	/////.....connect phase ...../////
	function void connect_phase(uvm_phase phase);
		if(env_cfg.has_virtual_sequencer)begin
			if(env_cfg.has_axi_master_agent)begin
				foreach(axi_master_top[i])begin
					v_seqrh.mseqrh[i] = axi_master_top[i].magnt.seqrh;
				end
			end

			if(env_cfg.has_axi_slave_agent)begin
				foreach(axi_slave_top[i])begin
					v_seqrh.sseqrh[i] = axi_slave_top[i].sagnt.sseqrh;
				end
			end

			if(env_cfg.has_apb_slave_agent)begin
				foreach(apb_slave_top[i])begin
					v_seqrh.apbseqrh[i] = apb_slave_top[i].apbsagnt.apbseqr;
				end
			end
		end
	endfunction 
				

endclass 

	
	
