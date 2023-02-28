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
		smonh = axi_slave_monitor::type_id::create("smonh",this);
		sdrvh = axi_slave_driver::type_id::create("sdrvh",this);
		sseqrh = axi_slave_sequencer::type_id::create("sseqrh",this);
	endfunction

	/////.....connect phase ...../////
	function void connect_phase(uvm_phase phase);
		sdrvh.seq_item_port.connect(sseqrh.seq_item_export);
	endfunction

endclass

