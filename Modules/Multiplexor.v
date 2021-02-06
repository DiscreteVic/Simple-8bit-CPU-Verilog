// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 01/02/2021:| Multiplexor
// ============================================================================

module Multiplexor (input wire [8:0] dataINA, input wire [8:0] dataINB, output wire [8:0] dataOUT, input wire sel);

	assign dataOUT = ((dataINA)*(!sel))|((dataINB)*sel);

endmodule