// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			    :| 10/06/2020:| N prescaler module
// ============================================================================

module Register (input clk, inout reg [7:0] data, input sel);

	reg [7:0] register = 0;
	
	always @(posedge(clk)) begin
		if(!sel)
			register <= data;	
		else
			data <= register;
	end

endmodule