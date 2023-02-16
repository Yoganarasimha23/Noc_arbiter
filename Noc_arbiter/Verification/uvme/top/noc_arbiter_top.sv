`define AMBA_AXI_PROT
module noc_arbiter_top;
	import uvm_pkg::*;
	`include "uvm_macros.svh"
	import noc_arbiter_package::*;

	/////..... global signals...../////
	bit ACLK;
	//logic global_reset;
	//logic global_asw_reset;

	initial begin 
		ACLK = 0;
		forever #5 ACLK = ~ACLK;
	end


	/////.....interface instantiation...../////
	/////.....axi master interface...../////
	axi4_master_if m1_if(ACLK);
	axi4_master_if m2_if(ACLK);

	/////.....axi slave interface...../////
	axi_slave_if s1_if(ACLK);
	axi_slave_if s2_if(ACLK);

	/////.....apb slave interface...../////
	apb_slave_if s3_if(ACLK);
	apb_slave_if s4_if(ACLK);
	apb_slave_if s5_if(ACLK);
	apb_slave_if s6_if(ACLK);
	
	/*assign m1_if.ARESETn = global_reset;
	assign m2_if.ARESETn = global_reset;
	assign s1_if.ARESETn = global_reset;
	assign s2_if.ARESETn = global_reset;
	assign s3_if.ARESETn = global_reset;
	assign s4_if.ARESETn = global_reset;
	assign s5_if.ARESETn = global_reset;
	assign s6_if.ARESETn = global_reset;

	assign m1_if.ASW_RESET = global_asw_reset;
	assign m2_if.ASW_RESET = global_asw_reset;
	assign s1_if.ASW_RESET = global_asw_reset;
	assign s2_if.ASW_RESET = global_asw_reset;
	assign s3_if.ASW_RESET = global_asw_reset;
	assign s4_if.ASW_RESET = global_asw_reset;
	assign s5_if.ASW_RESET = global_asw_reset;
	assign s6_if.ASW_RESET = global_asw_reset;*/


	initial begin
	
	/////.....config db set...../////
	/////.....axi master config db set...../////
	uvm_config_db#(virtual axi4_master_if)::set(null,"*","mvif0",m1_if);
	uvm_config_db#(virtual axi4_master_if)::set(null,"*","mvif1",m2_if);
	
	/////.....axi slave config set...../////
	uvm_config_db#(virtual axi_slave_if)::set(null,"*","svif0",s1_if);
	uvm_config_db#(virtual axi_slave_if)::set(null,"*","svif1",s2_if);
	
	/////.....apb slave config set...../////
	uvm_config_db#(virtual apb_slave_if)::set(null,"*","avif0",s3_if);
	uvm_config_db#(virtual apb_slave_if)::set(null,"*","avif1",s4_if);
	uvm_config_db#(virtual apb_slave_if)::set(null,"*","avif2",s5_if);
	uvm_config_db#(virtual apb_slave_if)::set(null,"*","avif3",s6_if);
	
		run_test();
	end

	/////.....DUT instantiation...../////
	noc_arbiter dut(
		.ACLK(ACLK),
		.ARESETn(m1_if.ARESETn),
		.ASW_RESET(m1_if.ASW_RESET),
		/////.....axi master1 signals...../////
		.M0_MID					(m1_if.MID),
		.M0_AWID				(m1_if.AWID),
		.M0_AWADDR				(m1_if.AWADDR),
		.M0_AWLEN				(m1_if.AWLEN),
		//.M0_AWSIZE				(m1_if.AWSIZE),	
		.M0_AWBURST				(m1_if.AWBURST),
		//.M0_AWPROT				(m1_if.AWPROT),
		.M0_AWVALID				(m1_if.AWVALID),
		.M0_AWREADY				(m1_if.AWREADY),
		//.M0_WID					(m1_if.WID),
		.M0_WDATA				(m1_if.WDATA),
		.M0_WSTRB				(m1_if.WSTRB),
		.M0_WLAST				(m1_if.WLAST),
		.M0_WVALID				(m1_if.WVALID),
		.M0_WREADY				(m1_if.WREADY),
		//.M0_BID					(m1_if.BID),
		.M0_BRESP				(m1_if.BRESP),
		.M0_BVALID				(m1_if.BVALID),
		.M0_BREADY				(m1_if.BREADY),
		//.M0_ARID				(m1_if.ARID),
		.M0_ARADDR				(m1_if.ARADDR),
		.M0_ARLEN				(m1_if.ARLEN),
		//.M0_ARSIZE				(m1_if.ARSIZE),
		.M0_ARBURST				(m1_if.ARBURST),
		//.M0_ARPROT				(m1_if.ARPROT),
		.M0_ARVALID				(m1_if.ARVALID),
		.M0_ARREADY				(m1_if.ARREADY),
		//.M0_RID					(m1_if.RID),
		.M0_RDATA				(m1_if.RDATA),
		.M0_RRESP				(m1_if.RRESP),
		//.M0_RLAST				(m1_if.RLAST),
		.M0_RVALID				(m1_if.RVALID),
		.M0_RREADY				(m1_if.RREADY),

		/////.....axi master 2 signals...../////
		//.ARESETn				(m2_if.ARESETn),
		//.ASW_RESET				(m2_if.ASW_RESET),
		.M1_MID					(m2_if.MID),
		.M1_AWID				(m2_if.AWID),
		.M1_AWADDR				(m2_if.AWADDR),
		.M1_AWLEN				(m2_if.AWLEN),
		//.M1_AWSIZE				(m2_if.AWSIZE),	
		.M1_AWBURST				(m2_if.AWBURST),
		//.M1_AWPROT				(m2_if.AWPROT),
		.M1_AWVALID				(m2_if.AWVALID),
		.M1_AWREADY				(m2_if.AWREADY),
		//.M1_WID					(m2_if.WID),
		.M1_WDATA				(m2_if.WDATA),
		.M1_WSTRB				(m2_if.WSTRB),
		.M1_WLAST				(m2_if.WLAST),
		.M1_WVALID				(m2_if.WVALID),
		.M1_WREADY				(m2_if.WREADY),
		//.M1_BID					(m2_if.BID),
		.M1_BRESP				(m2_if.BRESP),
		.M1_BVALID				(m2_if.BVALID),
		.M1_BREADY				(m2_if.BREADY),
		//.M1_ARID				(m2_if.ARID),
		.M1_ARADDR				(m2_if.ARADDR),
		.M1_ARLEN				(m2_if.ARLEN),
		//.M1_ARSIZE				(m2_if.ARSIZE),
		.M1_ARBURST				(m2_if.ARBURST),
		//.M1_ARPROT				(m2_if.ARPROT),
		.M1_ARVALID				(m2_if.ARVALID),
		.M1_ARREADY				(m2_if.ARREADY),
		//.M1_RID					(m2_if.RID),
		.M1_RDATA				(m2_if.RDATA),
		.M1_RRESP				(m2_if.RRESP),
		//.M1_RLAST				(m2_if.RLAST),
		.M1_RVALID				(m2_if.RVALID),
		.M1_RREADY				(m2_if.RREADY),

		/////.....axi slave 1 signals...../////
		//.ARESETn				(s1_if.ARESETn_s),
		//.ASW_RESET				(s1_if.ASW_RESET_s),
		.S0_AWREADY 			(s1_if.AWREADY),
		.S0_WREADY				(s1_if.WREADY),
		.S0_BRESP				(s1_if.BRESP),
		.S0_BVALID 				(s1_if.BVALID),
		.S0_BID					(s1_if.BID),
		.S0_RID					(s1_if.RID),
		.S0_ARREADY				(s1_if.ARREADY),
		.S0_RDATA				(s1_if.RDATA),
		.S0_RRESP				(s1_if.RRESP),
		.S0_RVALID				(s1_if.RVALID),
		.S0_RLAST				(s1_if.RLAST),
		.S0_AWVALID				(s1_if.AWVALID),
		.S0_AWADDR				(s1_if.AWADDR),
		.S0_AWLEN				(s1_if.AWLEN),
		.S0_AWBURST				(s1_if.AWBURST),
		.S0_WVALID				(s1_if.WVALID),
		.S0_WDATA				(s1_if.WDATA),
		.S0_WLAST				(s1_if.WLAST),
		.S0_WSTRB				(s1_if.WSTRB),
		.S0_BREADY				(s1_if.BREADY),
		.S0_ARVALID				(s1_if.ARVALID),
		.S0_ARADDR				(s1_if.ARADDR),
		.S0_ARLEN 				(s1_if.ARLEN),
		.S0_ARBURST				(s1_if.ARBURST),
		.S0_RREADY				(s1_if.RREADY),

		/////.....axi slave 2 signals...../////
		//.ARESETn				(s2_if.ARESETn),
		//.ASW_RESET				(s2_if.ASW_RESET),
		.S1_AWREADY 			(s2_if.AWREADY),
		.S1_WREADY				(s2_if.WREADY),
		.S1_BRESP				(s2_if.BRESP),
		.S1_BVALID 				(s2_if.BVALID),
		.S1_BID					(s2_if.BID),
		.S1_RID					(s2_if.RID),
		.S1_ARREADY				(s2_if.ARREADY),
		.S1_RDATA				(s2_if.RDATA),
		.S1_RRESP				(s2_if.RRESP),
		.S1_RVALID				(s2_if.RVALID),
		.S1_RLAST				(s2_if.RLAST),
		.S1_AWVALID				(s2_if.AWVALID),
		.S1_AWADDR				(s2_if.AWADDR),
		.S1_AWLEN				(s2_if.AWLEN),
		.S1_AWBURST				(s2_if.AWBURST),
		.S1_WVALID				(s2_if.WVALID),
		.S1_WDATA				(s2_if.WDATA),
		.S1_WLAST				(s2_if.WLAST),
		.S1_WSTRB				(s2_if.WSTRB),
		.S1_BREADY				(s2_if.BREADY),
		.S1_ARVALID				(s2_if.ARVALID),
		.S1_ARADDR				(s2_if.ARADDR),
		.S1_ARLEN 				(s2_if.ARLEN),
		.S1_ARBURST				(s2_if.ARBURST),
		.S1_RREADY				(s2_if.RREADY),

		/////.....apb slave 1 signals...../////
		
		//.ARESETn				(s3_if.ARESETn_p),
		//.ASW_RESET				(s3_if.ASW_RESET_p),
		.S2_PADDR				(s3_if.PADDR),
		.S2_PDATA				(s3_if.PWDATA),
		.S2_PWRITE				(s3_if.PWRITE),
		.S2_PENABLE				(s3_if.PENABLE),
		.S2_PSEL				(s3_if.PSEL),
		.S2_PSTRB				(s3_if.PSTRB),
		.S2_PREADY 				(s3_if.PREADY),
		.S2_PRDATA				(s3_if.PRDATA),
		.S2_PSLVERR				(s3_if.PSLVERR),

		/////......apb salve 2 signals...../////
		//.ARESETn				(s4_if.ARESETn),
		//.ASW_RESET				(s4_if.ASW_RESET),
		.S3_PADDR				(s4_if.PADDR),
		.S3_PDATA				(s4_if.PWDATA),
		.S3_PWRITE				(s4_if.PWRITE),
		.S3_PENABLE				(s4_if.PENABLE),
		.S3_PSEL				(s4_if.PSEL),
		.S3_PSTRB				(s4_if.PSTRB),
		.S3_PREADY 				(s4_if.PREADY),
		.S3_PRDATA				(s4_if.PRDATA),
		.S3_PSLVERR				(s4_if.PSLVERR),

		/////.....apb slave 3 signals...../////
		//.ARESETn				(s5_if.ARESETn),
		//.ASW_RESET				(s5_if.ASW_RESET),
		.S4_PADDR				(s5_if.PADDR),
		.S4_PDATA				(s5_if.PWDATA),
		.S4_PWRITE				(s5_if.PWRITE),
		.S4_PENABLE				(s5_if.PENABLE),
		.S4_PSEL				(s5_if.PSEL),
		.S4_PSTRB				(s5_if.PSTRB),
		.S4_PREADY 				(s5_if.PREADY),
		.S4_PRDATA				(s5_if.PRDATA),
		.S4_PSLVERR				(s5_if.PSLVERR),

		/////.....apb slave 4 signals...../////
		//.ARESETn				(s6_if.ARESETn),
		//.ASW_RESET				(s6_if.ASW_RESET),
		.S5_PADDR				(s6_if.PADDR),
		.S5_PDATA				(s6_if.PWDATA),
		.S5_PWRITE				(s6_if.PWRITE),
		.S5_PENABLE				(s6_if.PENABLE),
		.S5_PSEL				(s6_if.PSEL),
		.S5_PSTRB				(s6_if.PSTRB),
		.S5_PREADY 				(s6_if.PREADY),
		.S5_PRDATA				(s6_if.PRDATA),
		.S5_PSLVERR				(s6_if.PSLVERR)
		);
		initial begin
			$shm_open("wave.shm");
			$shm_probe("ACTMF");
		end

endmodule
