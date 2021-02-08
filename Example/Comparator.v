// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 08/02/2021:| 8bit Comparator
// ============================================================================

module Comparator (input clk, output wire res, input wire [7:0] opA, input wire [7:0] opB, input wire [1:0] sel);

	reg result;
	reg [7:0] A;
	reg [7:0] B;
	
	assign res = result;
	
	always @(posedge(clk)) begin
		A = opA;
		B = opB;
		if(A == B && sel == 2'b00)
			result <= 1;
		else if (A < B && sel == 2'b01)
			result <= 1;
		else if (A > B && sel == 2'b10)
			result <= 1;
		else
			result <= 0;
	end

endmodule