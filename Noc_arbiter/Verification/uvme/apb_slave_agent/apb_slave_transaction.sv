class apb_slave_transaction extends uvm_sequence_item;
	////factory registration ....////
	`uvm_object_utils(apb_slave_transaction)

	////....function new constructor....////
	function new(string name="apb_slave_transaction");
		super.new(name);
	endfunction
endclass


