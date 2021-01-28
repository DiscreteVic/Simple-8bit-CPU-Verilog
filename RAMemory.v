// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			    :| 27/01/2021:| RAM 
// ============================================================================

module RAMemory (input clk, input wire [7:0] dataIN, output wire [7:0] dataOUT, input wire [3:0] addr, input wire sel);

	reg [7:0] register [0:16];
	assign dataOUT = register[addr];
	
	always @(posedge(clk)) begin
		if(!sel)
			register[addr] = dataIN;
	end

endmodule