class axi_slave_driver extends uvm_driver #(noc_arb_axi_slave_transaction);

	/////.....factory registration...../////
	`uvm_component_utils(axi_slave_driver)

	/////.....declare handle for virtual axi slave interface ...../////
	virtual axi_slave_if svif;

	/////.....declare a handle for axi_slave_config  config db...../////
	axi_slave_config s_cfg;

	/////.....function new constructor...../////
	function new (string name = "axi_slave_driver",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(axi_slave_config)::get(this,"","axi_slave_config",s_cfg))begin
			`uvm_fatal("axi_slave_driver","unable to get axi_slave_config have you set() it ?")
		end
	endfunction

	//////.....connect phase...../////
	function void connect_phase(uvm_phase phase);
		svif = s_cfg.svif;
	endfunction 

	/////.....task run phase...../////
	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			`uvm_info(get_type_name(),"inside axi slave driver logic",UVM_MEDIUM)
			if(req.wr_en)begin
				drive_write(req);
			end
			else begin
				drive_read(req);
			end
			seq_item_port.item_done();
			`uvm_info(get_type_name()," axi slave driver logic completed",UVM_MEDIUM)
			
		end
	endtask

	/////.....drive write task...../////
	task drive_write(noc_arb_axi_slave_transaction xtn);
		int i;
		int burst_len;
		/////.....wait for awvalid signal...../////
		`uvm_info(get_full_name(),"drive write axi slave ",UVM_MEDIUM)
		wait(svif.AWVALID);
		burst_len = svif.AWLEN+1;
		`uvm_info(get_type_name(),"burst length",UVM_MEDIUM)
		@(posedge svif.ACLK);
		svif.AWREADY <= 1;
		@(posedge svif.ACLK);
		svif.AWREADY <= 0;
		/////.....wait for wvalid...../////
		wait(svif.WVALID);
		for(i=0;i<burst_len;i++)begin
			svif.WREADY <= xtn.WREADY;
			@(negedge svif.ACLK);
		end
		@(negedge svif.ACLK);
		svif.WREADY <=0;
		svif.BID <= xtn.BID;

		if(svif.WSTRB == 4'hF)//begin
			svif.BRESP <= xtn.BRESP;
		else
			svif.BRESP <= 2'b10;
		//end

		@(negedge svif.ACLK);
		svif.BVALID <= xtn.BVALID;
		wait(svif.BREADY);
		@(negedge svif.ACLK);
		svif.BVALID <= 0;

		/*svif.WREADY <= xtn.WREADY;
		svif.BID <= xtn.BID;
		svif.BRESP <= xtn.BRESP;
		svif.BVALID <= xtn.BVALID;*/
	endtask

	/////.....drive read task...../////
	task drive_read(noc_arb_axi_slave_transaction xtn);
		int i;
		int burst_len;
		/////.....wait for arvalid signal...../////
		wait(svif.ARVALID);
		burst_len = svif.ARLEN+1;
		svif.ARREADY <= xtn.ARREADY;
		@(negedge svif.ACLK);
		svif.ARREADY <= 0;
		for(i=0;i<burst_len;i++)begin	
			//svif.ARREADY <= xtn.ARREADY;
			svif.RID <= xtn.RID;
			svif.RVALID <= xtn.RVALID;			
			svif.RDATA <= $random;
			svif.RRESP <= xtn.RRESP;
			svif.RLAST <= (i==burst_len-1);
		end

		wait(svif.RREADY);
		svif.RVALID <= 0;
		svif.RDATA <= 0;
		svif.RLAST <= 0;
		svif.RRESP <= 0;
	endtask


endclass

