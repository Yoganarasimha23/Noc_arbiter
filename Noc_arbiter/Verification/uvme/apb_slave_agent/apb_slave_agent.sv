class apb_slave_agent extends uvm_agent;
	/////.....factory registration...../////
	`uvm_component_utils(apb_slave_agent)

	/////.....axi slave config ...../////
	apb_slave_config apbs_cfg;

	////....apb slave components....////
	apb_slave_monitor apbmon;
	apb_slave_driver apbdrv;
	apb_slave_sequencer apbseqr;

	/////.....function new constructor ...../////
	function new(string name ="apb_slave_agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	////....build phase ....////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		apbmon = apb_slave_monitor::type_id::create("apbmon",this);
		apbdrv = apb_slave_driver::type_id::create("apbdrv",this);
		apbseqr = apb_slave_sequencer::type_id::create("apbseqr",this);
	endfunction

	/////.....connect phase ...../////
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		apbdrv.seq_item_port.connect(apbseqr.seq_item_export);
	endfunction 
endclass

