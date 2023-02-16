class axi_slave_agent extends uvm_agent;
	/////.....factory registration ...../////
	`uvm_component_utils(axi_slave_agent)

	/////..... axi slave config class...../////
	axi_slave_config s_cfg;

	/////..... axi slave components ...../////
	axi_slave_monitor smonh;
	axi_slave_driver sdrvh;
	axi_slave_sequencer sseqrh;

	/////.....function new constructor ...../////
	function new (string name = "axi_slave_agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase ...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(axi_slave_config)::get(this,"","axi_slave_config",s_cfg))begin
			`uvm_fatal("axi_slave_agent","unable to get the axi slave config")
		end
		smonh = axi_slave_monitor::type_id::create("smonh",this);
		if(s_cfg.is_active == UVM_ACTIVE)begin
			sdrvh = axi_slave_driver::type_id::create("sdrvh",this);
			sseqrh = axi_slave_sequencer::type_id::create("sseqrh",this);
		end

	endfunction

	/////.....connect phase ...../////
	function void connect_phase(uvm_phase phase);
		if(s_cfg.is_active == UVM_ACTIVE)begin
			sdrvh.seq_item_port.connect(sseqrh.seq_item_export);
		end
	endfunction

endclass

