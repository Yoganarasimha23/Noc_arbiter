class noc_arb_vbase_sequence extends uvm_sequence #(uvm_sequence_item);

	/////.....factory registration...../////
	`uvm_object_utils(noc_arb_vbase_sequence)
	//`uvm_declare_p_sequencer(noc_arb_virtual_sequencer)

	/////.....declare a dynamic array for axi_master_sequencer, axi_slave_sequencer and apb_slave_sequencer...../////
	axi_master_sequencer mseqrh[];
	axi_slave_sequencer sseqrh[];
	apb_slave_sequencer apbseqrh[];

	/////.....declare a handle for virtual sequencer...../////
	noc_arb_virtual_sequencer vseqrh;

	/////.....declares a handles for all sequences...../////
	axi_master_base_sequence axib_seqh;
	axi_master_reset_sequence axir_seqh;
	axi_master_write_sequence axiw_seqh;
	axi_slave_write_sequence axis_seqh;





	/////.....declare noc_arb_env_config...../////
	noc_arb_env_config env_cfg;

	/////.....function new constructor...../////
	function new(string name = "noc_arb_vbase_sequence");
		super.new(name);
	endfunction

	/////.....task body...../////
	task body();
		/////.....get the env config ...../////
		if(!uvm_config_db#(noc_arb_env_config)::get(null,get_full_name(),"env_config",env_cfg))begin
			`uvm_fatal("virtual sequence class","unable to get env config db.have you set() it ?")
		end
		/////.....initialize the dynamic array for all axi master, slave sequencer and apb sequencer...../////
		mseqrh = new[env_cfg.axi_master];
		sseqrh = new[env_cfg.axi_slave];
		apbseqrh = new[env_cfg.apb_slave];

		assert($cast(vseqrh, m_sequencer))
		else
			begin
				`uvm_error("BODY","error in $cast of virtual sequencer")
			end
			/////.....assign handles of axi master, slave sequencer and apb sequencer handles to virtual sequencer...///
			foreach(mseqrh[i])
				mseqrh[i] = vseqrh.mseqrh[i];
				//mseqrh[i] = p_sequencer.mseqrh[i];
				

			foreach(sseqrh[i])
				sseqrh[i] = vseqrh.sseqrh[i];

			foreach(apbseqrh[i])
				apbseqrh[i] = vseqrh.apbseqrh[i];
	endtask
endclass

/////.....axi master base  virtual sequence...../////
class axi_master_base_vseq extends noc_arb_vbase_sequence;

	/////.....factory registration...../////
	`uvm_object_utils(axi_master_base_vseq)

	/////.....function new constructor...../////
	function new(string name = "axi_master_base_vseq");
		super.new(name);
	endfunction

	/////.....task body()...../////
	task body();
		super.body();
		axib_seqh = axi_master_base_sequence::type_id::create("axib_seqh");
		if(env_cfg.has_axi_master_agent)begin
			for(int i=0; i<env_cfg.axi_master; i++)
				axib_seqh.start(mseqrh[i]);
				//vseqrh
		end
	endtask
endclass

/////.....axi master reset virtual sequence...../////
class axi_master_reset_vseq extends noc_arb_vbase_sequence;

	/////.....factory registartion...../////
	`uvm_object_utils(axi_master_reset_vseq)

	/////.....function new constructor...../////
	function new(string name = "axi_master_reset_vseq");
		super.new(name);
	endfunction

	/////.....task body...../////
	task body();
		super.body();
		axir_seqh = axi_master_reset_sequence::type_id::create("axir_seqh");
		if(env_cfg.has_axi_master_agent)begin
			for(int i=0; i<env_cfg.axi_master; i++)
				axir_seqh.start(mseqrh[i]);
		end
	endtask
endclass


/////.....axi master write virtual sequence...../////
class axi_master_write_vseq extends noc_arb_vbase_sequence;

	/////.....factory registartion...../////
	`uvm_object_utils(axi_master_write_vseq)

	/////.....function new constructor...../////
	function new(string name = "axi_master_write_vseq");
		super.new(name);
	endfunction

	/////.....task body...../////
	task body();
		super.body();
		axiw_seqh = axi_master_write_sequence::type_id::create("axiw_seqh");
		axis_seqh = axi_slave_write_sequence::type_id::create("axis_seqh");
		fork
		if(env_cfg.has_axi_master_agent)begin
			for(int i=0; i<env_cfg.axi_master; i++)
				axiw_seqh.start(mseqrh[i]);
		end
		if(env_cfg.has_axi_slave_agent)begin
			for(int i=0;i<env_cfg.axi_slave;i++)
				axis_seqh.start(sseqrh[i]);
		end
		join
	endtask
endclass

/*/////.....axi slave write virtual sequence...../////
class axi_slave_write_vseq extends noc_arb_vbase_sequence;

	/////.....factory registartion...../////
	`uvm_object_utils(axi_slave_write_vseq)

	/////.....function new constructor...../////
	function new(string name = "axi_slave_write_vseq");
		super.new(name);
	endfunction

	/////.....task body...../////
	task body();
		super.body();
		axis_seqh = axi_slave_write_sequence::type_id::create("axis_seqh");
		if(env_cfg.has_axi_slave_agent)begin
			for(int i=0; i<env_cfg.axi_slave; i++)
				axis_seqh.start(sseqrh[i]);
		end
	endtask
endclass*/








