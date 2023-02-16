class apb_slave_transaction extends uvm_sequence_item;
	////factory registration ....////
	`uvm_object_utils(apb_slave_transaction)
	/////.....input signals...../////
	rand logic ARESETn;
	rand logic ASW_RESET;
	rand logic [31:0]PRDATA;
	rand logic PRREADY;
	rand logic PSLVERR;

	/////.....OUTPUT SIGNALS...../////
	rand logic PENABLE;
	rand logic PSEL;
	rand logic PWRITE;
	rand logic [31:0]PADDR;
	rand logic [31:0]PWDATA;
	rand logic [3:0]PSTRB;

	////....function new constructor....////
	function new(string name="apb_slave_transaction");
		super.new(name);
	endfunction
endclass


