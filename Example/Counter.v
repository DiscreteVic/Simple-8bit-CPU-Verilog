// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 28/01/2021:| 8bit Counter
//   V2.0 :| viCppDev			   :| 07/02/2021:| Added jumps
// ============================================================================

module Counter (input clk, output wire [7:0] cnt, input wire [7:0] jpAddr, input wire jump);

	reg [7:0] register;
	
	assign cnt = register;	
	
	always @(posedge(clk)) begin
		if(jump)
			register = jpAddr;
		else
			register = register + 1;
	end

endmodule