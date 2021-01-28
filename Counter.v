// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 28/01/2021:| 
// ============================================================================

module Counter (input clk, output wire [7:0] cnt);

	reg [7:0] register;
	
	assign cnt = register;
	
	always @(posedge(clk)) begin
		register = register + 1;
	end

endmodule