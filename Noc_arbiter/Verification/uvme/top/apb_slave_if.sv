interface apb_slave_if (input logic ACLK);
	/////.....input signals...../////
	logic ARESETn;
	logic ASW_RESET;
	logic [31:0]PRDATA;
	logic PREADY;
	logic PSLVERR;

	/////.....OUTPUT SIGNALS...../////
	logic PENABLE;
	logic PSEL;
	logic PWRITE;
	logic [31:0]PADDR;
	logic [31:0]PWDATA;
	logic [3:0]PSTRB;
endinterface


