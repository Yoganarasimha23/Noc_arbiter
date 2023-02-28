interface apb_slave_if (input logic ACLK, RESETn, SW_RESET);
	/////.....input signals...../////
	logic [31:0]PRDATA;
	logic PRREADY;
	logic PSLVERR;

	/////.....OUTPUT SIGNALS...../////
	logic PENABLE;
	logic PSEL;
	logic PWRITE;
	logic [31:0]PADDR;
	logic [31:0]PWDATA;
	logic [3:0]PSTRB;
endinterface


