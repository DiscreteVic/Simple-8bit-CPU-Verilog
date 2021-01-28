// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			    :| 27/01/2021:| ROM 
// ============================================================================

module ROMemory (input clk, output wire [7:0] data, input wire [7:0] addr);

	reg [7:0] memory [0:255];
	
	assign data = memory[addr];	
	
	initial begin
		$readmemh("ROM.mem", memory);
	end

endmodule