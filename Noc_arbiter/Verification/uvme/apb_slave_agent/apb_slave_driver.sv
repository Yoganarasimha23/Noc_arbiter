class apb_slave_driver extends uvm_driver #(uvm_sequence_item);
	/////.....factory registration ...../////
	`uvm_component_utils(apb_slave_driver)
	/////..... declare a virtual interface  handle for apb...../////
	virtual apb_slave_if avif;

	/////.....declare a handle for apb slave config...../////
	apb_slave_config s_cfg;
	/////.....function new constructor ...../////
	function new(string name = "apb_slave_driver",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(apb_slave_config)::get(this,"","apb_slave_config",s_cfg))begin
			`uvm_fatal("apb_slave_driver","unable to get apb slave config have you set() it ?")
		end
	endfunction

	/////.....connect phase...../////
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		avif = s_cfg.avif;
	endfunction

	/////.....task run_phase...../////
/*	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			if(req.wr_en)
				drive_write(req);
			else
				drive_read(req);
			seq_item_port.item_done();
		end
	endtask

	/////.....drive write task...../////
	task drive_write(noc_arb_apb_slave_transaction xtn);
		int i;
		int burst_len;*/
endclass
