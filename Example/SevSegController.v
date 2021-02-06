// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			    :| 10/06/2020:| Module first version
// ============================================================================

module SevSegController(input [3:0]dig, input  dot, output [7:0]leds);

	 wire [7:0]reg_leds;

	 assign reg_leds[0] = ((dig==4'h1) | (dig==4'h4) | (dig==4'hb) | (dig==4'hd));
	 assign reg_leds[1] = ((dig==4'h5) | (dig==4'h6) | (dig==4'hb) | (dig==4'hc) | (dig==4'he) | (dig==4'hf));
	 assign reg_leds[2] = ((dig==4'h2) | (dig==4'hc) | (dig==4'he) | (dig==4'hf));
	 assign reg_leds[3] = ((dig==4'h1) | (dig==4'h4) | (dig==4'h7) | (dig==4'h9) | (dig==4'ha) | (dig==4'hf));
	 
	 assign reg_leds[4] = ((dig==4'h1) | (dig==4'h3) | (dig==4'h4) | (dig==4'h5) | (dig==4'h7) | (dig==4'h9));
	 assign reg_leds[5] = ((dig==4'h1) | (dig==4'h2) | (dig==4'h3) | (dig==4'h7) | (dig==4'hd));
	 assign reg_leds[6] = ((dig==4'h0) | (dig==4'h1) | (dig==4'h7) | (dig==4'hc));
	 
	 assign reg_leds[7] = !dot;
	 
	 assign leds = reg_leds;	


endmodule
