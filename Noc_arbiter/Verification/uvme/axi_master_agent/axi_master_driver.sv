class axi_master_driver extends uvm_driver#(noc_arb_axi_master_transaction);
	/////.....factory registration...../////
	`uvm_component_utils(axi_master_driver)

	/////.....declare a virtual interface handle...../////
	virtual axi4_master_if mvif;

	/////.....declare a handle for axi_master_config...../////
	axi_master_config m_cfg;

	/////.....function new constructor...../////
	function new(string name = "axi_master_driver",uvm_component parent);
		super.new(name,parent);
	endfunction

	/////.....build phase...../////
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(axi_master_config)::get(this,"","axi_master_config",m_cfg))begin
			`uvm_fatal("axi_master driver","unable to get the axi master config have you set() it.? ")
		end
	endfunction

	/////.....connect phase...../////
	function void connect_phase(uvm_phase phase);
		mvif = m_cfg.mvif;
	endfunction

	/////.....run_phase...../////
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(),"inside axi master driver logic",UVM_MEDIUM)
		forever begin
			seq_item_port.get_next_item(req);
			`uvm_info(get_full_name(),$sformatf("received wr_en=%0d",req.wr_en),UVM_MEDIUM)
				if(req.wr_en==1)begin
					$display("wr_en=%0d",req.wr_en);
					`uvm_info(get_type_name(),"drive_write",UVM_MEDIUM)
				
					drive_write(req);
					`uvm_info(get_type_name(),"inside drive write",UVM_MEDIUM)
				end
				else begin
					drive_read(req);
				end
			seq_item_port.item_done();
			`uvm_info(get_full_name(),"axi master driver logic completed",UVM_MEDIUM)
		end
	endtask

	/////.....drive_dut task...../////

	task drive_write(noc_arb_axi_master_transaction xtn);
		int i;
		int burst_len;
		burst_len = xtn.AWLEN+1;
		@(negedge mvif.ACLK);
		//@(mvif.wr_cb);
		mvif.ARESETn <= xtn.ARESETn;
		/*$display("ARESETn=%0d",mvif.ARESETn);
		$display("ARESETn=%0d",xtn.ARESETn);
		`uvm_info(get_type_name(),$sformatf("printing from driver \n %s",xtn.sprint()),UVM_MEDIUM)
		`uvm_info(get_full_name(),"axi write operation ",UVM_MEDIUM)*/
		

		mvif.ASW_RESET <= xtn.ASW_RESET;
		/////.....write address channel...../////
		mvif.wr_cb.AWADDR <= xtn.AWADDR;
		mvif.wr_cb.AWLEN <= xtn.AWLEN;
		mvif.wr_cb.AWBURST <= xtn.AWBURST;
		mvif.wr_cb.AWVALID <= xtn.AWVALID;
		mvif.wr_cb.AWSIZE <= xtn.AWSIZE;
		/////.....wait for awready...../////
		@(posedge mvif.ACLK);
		wait(mvif.wr_cb.AWREADY);

		/////.....deassert the write address channel...../////
		mvif.wr_cb.AWADDR <= 0;
		mvif.wr_cb.AWLEN <= 0;
		mvif.wr_cb.AWBURST <= 0;
		mvif.wr_cb.AWVALID <= 0;
		mvif.wr_cb.AWSIZE <= 0;

		/////.....drive write data signals...../////
		for(i=0;i<burst_len;i++)begin
			mvif.wr_cb.WVALID <= xtn.WVALID;
			mvif.wr_cb.WDATA <= $random;
			mvif.wr_cb.WSTRB <= xtn.WSTRB;			
			mvif.wr_cb.WLAST <= (i==burst_len-1);
			@(posedge mvif.ACLK);
		end

		/////.....wait for wready...../////
		wait(mvif.wr_cb.WREADY);
		/////.....deassert the write data chanel...../////
			mvif.wr_cb.WVALID <= 0;
			mvif.wr_cb.WDATA <= 0;
			mvif.wr_cb.WSTRB <= 0;			
			mvif.wr_cb.WLAST <= 0;


		/////.....drive write response signals...../////
		repeat(2)@(posedge mvif.ACLK);
		mvif.wr_cb.BREADY <= xtn.BREADY;
		@(posedge mvif.ACLK);
		wait(mvif.wr_cb.BVALID);
		mvif.wr_cb.BREADY <=0;

		//mvif.BRESP <= xtn.BRESP;
		//mvif.BVALID <= xtn.BVALID;
	endtask

	task drive_read(noc_arb_axi_master_transaction xtn);
		int i;
		int burst_len;
		/////.....read address chanel...../////
		@(posedge mvif.ACLK);
		//@(mvif.rd_cb);
		mvif.rd_cb.ARVALID <= xtn.ARVALID;		
		mvif.rd_cb.ARADDR <= xtn.ARADDR;
		mvif.rd_cb.ARLEN <= xtn.ARLEN;
		mvif.rd_cb.ARBURST <= xtn.ARBURST;
		mvif.rd_cb.ARSIZE <= xtn.ARSIZE;

		/////.....wait for arready signal...../////
		wait(mvif.rd_cb.RREADY);
		mvif.rd_cb.RREADY <= xtn.RREADY;
		burst_len = mvif.rd_cb.ARLEN+1;
		/////.....deassert the read address chanel...../////
		mvif.rd_cb.ARVALID <= 0;		
		mvif.rd_cb.ARADDR <=0;
		mvif.rd_cb.ARLEN <= 0;
		mvif.rd_cb.ARBURST <= 0;
		mvif.rd_cb.ARSIZE <= 0;

		/////.....wait for rvalid loop for burst transaction...../////
		for(i=0;i<burst_len;i++)begin
			@(negedge mvif.ACLK);
			wait(mvif.rd_cb.RVALID);
		end


	//	mvif.rd_cb.RVALID <= xtn.RVALID;

	endtask


endclass

