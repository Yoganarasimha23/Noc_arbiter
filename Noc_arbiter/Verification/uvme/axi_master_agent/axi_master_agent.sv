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
		monh = axi_master_monitor::type_id::create("monh",this);
		drvh = axi_master_driver::type_id::create("drvh",this);
		seqrh = axi_master_sequencer::type_id::create("seqrh",this);
	endfunction
	
	/////.....connect phase ...../////
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		drvh.seq_item_port.connect(seqrh.seq_item_export);
	endfunction

endclass
