// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 26/06/2020:| Shifter
// ============================================================================

module Shifter (input wire [3:0] dataIN, output wire [7:0] dataOUT, input wire sel);

	
	assign dataOUT = ((dataIN << 4)*(sel)) | ((dataIN)*(!sel));
	
	

endmodule