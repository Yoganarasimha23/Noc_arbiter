package noc_arbiter_package;
	import uvm_pkg::*;
	`include "uvm_macros.svh"
	`include "./../uvme/apb_slave_agent/apb_slave_transaction.sv"	
	`include "./../uvme/axi_master_agent/axi_master_config.sv"
	`include "./../uvme/axi_slave_agent/axi_slave_config.sv"
	`include "./../uvme/apb_slave_agent/apb_slave_config.sv"
	`include "./../uvme/env/noc_arb_env_config.sv"
	`include "./../uvme/apb_slave_agent/apb_slave_sequencer.sv"	
	`include "./../uvme/apb_slave_agent/apb_slave_driver.sv"
	`include "./../uvme/apb_slave_agent/apb_slave_monitor.sv"
	`include "./../uvme/apb_slave_agent/apb_slave_agent.sv"
	`include "./../uvme/env/apb_slave_agt_top.sv"

	`include "./../uvme/axi_slave_agent/noc_arb_axi_slave_transaction.sv"
	`include "./../uvme/axi_slave_agent/axi_slave_sequencer.sv"
	`include "./../uvme/sequences/axi_slave_sequence/axi_slave_write_sequence.sv"
	`include "./../uvme/axi_slave_agent/axi_slave_driver.sv"
	`include "./../uvme/axi_slave_agent/axi_slave_monitor.sv"
	`include "./../uvme/axi_slave_agent/axi_slave_agent.sv"
	`include "./../uvme/env/axi_slave_agt_top.sv"

	`include "./../uvme/axi_master_agent/noc_arb_axi_master_transaction.sv"
	`include "./../uvme/axi_master_agent/axi_master_sequencer.sv"
	`include "./../uvme/sequences/axi_master_sequence/axi_master_base_sequence.sv"
	`include "./../uvme/sequences/axi_master_sequence/axi_master_reset_sequence.sv"
	`include "./../uvme/sequences/axi_master_sequence/axi_master_write_sequence.sv"
	`include "./../uvme/axi_master_agent/axi_master_driver.sv"
	`include "./../uvme/axi_master_agent/axi_master_monitor.sv"
	`include "./../uvme/axi_master_agent/axi_master_agent.sv"
	`include "./../uvme/env/axi_master_agt_top.sv"



	
	`include "./../uvme/env/noc_arb_virtual_sequncer.sv"
	`include "./../uvme/env/noc_arb_virtual_sequence.sv"
	`include "./../uvme/env/noc_arb_env.sv"

	`include "./../uvme/test/noc_arb_base_test.sv"
	`include "./../uvme/test/axi_master_base_test.sv"
	`include "./../uvme/test/axi_master_reset_test.sv"
	`include "./../uvme/test/axi_master_write_test.sv"

endpackage


