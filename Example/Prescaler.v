// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			    :| 10/06/2020:| N prescaler module
// ============================================================================

module Prescaler #(parameter N) (input clk_in, output clk_out);

	reg [N-1:0] count = 0;

	assign clk_out = count[N-1];
	
	always @(posedge(clk_in)) begin
		count <= count + 1;	
	end

endmodule