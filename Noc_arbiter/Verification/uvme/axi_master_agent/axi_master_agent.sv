class axi_master_agent extends uvm_agent;
	/////.....factory registration ...../////
	`uvm_component_utils(axi_master_agent)

	/////.... axi master config class...../////
	axi_master_config axim_cfg;

	/////.....axi monitor components ...../////
	axi_master_monitor monh;
	axi_master_driver drvh;
	axi_master_sequencer seqrh;

	function new (string name = "axi_master_agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(axi_master_config)::get(this,"","axi_master_config",axim_cfg))begin
			`uvm_fatal("master_agent","unable to get the axi_master_config have you set() it ?")
		end
		monh = axi_master_monitor::type_id::create("monh",this);
		if(axim_cfg.is_active==UVM_ACTIVE)begin
			drvh = axi_master_driver::type_id::create("drvh",this);
			seqrh = axi_master_sequencer::type_id::create("seqrh",this);
		end
	endfunction
	
	/////.....connect phase ...../////
	function void connect_phase(uvm_phase phase);
		//super.connect_phase(phase);
		if(axim_cfg.is_active == UVM_ACTIVE)begin
			drvh.seq_item_port.connect(seqrh.seq_item_export);
		end
	endfunction

endclass
