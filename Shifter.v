// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 26/06/2020:| Shifter
// ============================================================================

module Shifter (input wire clk, output wire [3:0] debug, input wire [3:0] dataIN, output wire [7:0] dataOUT, input wire down, input wire up);

	reg [3:0] nibbleUP;
	reg [3:0] nibbleDown;
	reg [3:0] tmp;
	reg [3:0] tmpA;
	
	always tmp = dataIN;
	assign dataOUT = (nibbleUP << 4) | (nibbleDown);
	
	always @(posedge(clk)) begin
		if(down & !up) begin
			nibbleDown <= tmp;
			end
		
		else if(up & !down) begin
			nibbleUP <= tmp;
			end
		
	end
	
	

endmodule