// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			    :| 27/01/2021:| RAM 
// ============================================================================

module RAMemory (input clk, input wire [7:0] dataIN, output wire [7:0] dataOUT, input wire [7:0] addr, input wire sel);

	reg [7:0] register [0:255];
	assign dataOUT = register[addr];
	
	always @(posedge(clk)) begin
		if(sel) begin
			register[addr] = dataIN;
		end
	end

endmodule