// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			    :| 27/01/2021:| ALU 
// ============================================================================

module ALU (input clk, input wire [7:0] opA, input wire [7:0] opB, input wire sel,output wire [7:0] res);
	
	reg [7:0] regTmp;
	
	assign res = regTmp;
	
	always @(posedge(clk)) begin
		if(sel) begin
			regTmp = opA - opB;		
		end
		else begin
			regTmp = opA + opB;
		end
	end
endmodule