class axi_master_base_test extends noc_arb_base_test;

	/////.....factory registration...../////
	`uvm_component_utils(axi_master_base_test)

	/////.....declare a handle for axi_master_base_virtual_sequence ...../////
	axi_master_base_vseq axi_seqh;

	/////.....function new constructor...../////
	function new(string name = "axi_master_base_test",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	/////.....task run phase to start the axi base sequence...../////
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		axi_seqh = axi_master_base_vseq::type_id::create("axi_seqh");
		axi_seqh.start(envh.v_seqrh);
		phase.drop_objection(this);
	endtask

endclass
