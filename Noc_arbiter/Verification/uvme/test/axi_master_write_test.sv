class axi_master_write_test extends noc_arb_base_test;

	/////.....factory registration...../////
	`uvm_component_utils(axi_master_write_test)

	/////.....declare a handle for axi_master write virtual sequence ...../////
	axi_master_write_vseq axiw_seqh;

	/////.....function new constructor...../////
	function new(string name = "axi_master_write_test",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase ...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	//////.....task run phase ...../////
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		axiw_seqh = axi_master_write_vseq::type_id::create("axiw_seqh");
		axiw_seqh.start(envh.v_seqrh);
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,1000);
		`uvm_info(get_full_name(),"inside write test",UVM_MEDIUM)
	endtask


endclass
