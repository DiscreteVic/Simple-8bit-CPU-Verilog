// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 04/02/2021:| Control Unit
//   V1.1 :| viCppDev			   :| 07/02/2021:| Added inconditional Jumps
// ============================================================================


module ControlUnit (
	input clk, 
	input wire [3:0] opCode, 	
	output wire [12:0] ctrlSignals
	);
	
	reg [9:0] debR;
	
	reg ucA;
	reg ucB;
	reg ucZ;
	reg ucY;
	reg ucR;
	reg ucALU;
	reg ucShfU;
	reg ucShfD;
	reg ucRam;
	reg ucMuxA;
	reg ucMuxB;
	reg ucDex;
	reg ucJp;
	
	reg [3:0]cmd;
	
	assign ctrlSignals[0] = ucA;     
	assign ctrlSignals[1] = ucB;
	assign ctrlSignals[2] = ucZ;
	assign ctrlSignals[3] = ucY;
	assign ctrlSignals[4] = ucR;
	assign ctrlSignals[5] = ucALU;  
	assign ctrlSignals[6] = ucShfU; 
	assign ctrlSignals[7] = ucShfD; 
	assign ctrlSignals[8] = ucRam; 
	assign ctrlSignals[9] = ucMuxA; 
	assign ctrlSignals[10] = ucMuxB; 
	assign ctrlSignals[11] = ucDex; 
	assign ctrlSignals[12] = ucJp; 
	
	
	initial begin
		ucA <= 0;
		ucB <= 0;
		ucZ <= 0;
		ucY <= 0;
		ucR <= 0;
		ucRam <= 0;
	end
	
	
	always @(posedge(clk)) begin
	
		case (opCode)
		4'b0000 : begin //ADD
						ucRam  = 0;
						ucA = 0;
						ucB = 0;
						ucZ = 0;
						ucY = 0;
						ucR = 1;
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 0;
					 end
			
		4'b0001 : begin // SUB
						ucRam  = 0;
						ucA = 0;
						ucB = 0;
						ucZ = 0;
						ucY = 0;
						ucR = 1;
						ucALU = 1;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 0;
					 end
					 
		4'b0010 : begin // LOAD A
						ucRam  = 0;
						ucA = 1;
						ucB = 0;
						ucZ = 0;
						ucY = 0;
						ucR = 0;
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 0;
					 end
					 
		4'b0011 : begin // LOAD B
						ucRam  = 0;
						ucA = 0;
						ucB = 1;
						ucZ = 0;
						ucY = 0;
						ucR = 0;
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 0;
					 end
					 
		4'b0100 : begin // LOAD Z 
						ucRam  = 0;
						ucA = 0;
						ucB = 0;
						ucZ = 1;
						ucY = 0;
						ucR = 0;
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 0;
					 end
					 
		4'b0101 : begin // LOAD Shift Down
						ucRam  = 0;
						ucA = 0;
						ucB = 0;
						ucZ = 0;
						ucY = 0;
						ucR = 0;	
						ucALU = 0;
						ucShfD = 1;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 0;
					 end
					 
		4'b0110 : begin // LOAD Shift Up
						ucRam  = 0;
						ucA = 0;
						ucB = 0;
						ucZ = 0;
						ucY = 0;
						ucR = 0;
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 1;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 0;
					 end
					 
		4'b0111 : begin // LOAD Y(RAM Addr)
						ucRam  = 0;
						ucA = 0;
						ucB = 0;
						ucZ = 0;
						ucY = 1;
						ucR = 0;	
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;//must be 0		
						ucJp = 0;
					 end
					 
		4'b1000 : begin // Store RAM new value
						ucRam  = 1;
						ucA = 0;
						ucB = 0;
						ucZ = 0;
						ucY = 0;
						ucR = 0;	
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 1;
						ucDex = 1;	
						ucJp = 0;
					 end
					 
		4'b1001 : begin // Store RAM result
						ucRam  = 1;
						ucA = 0;
						ucB = 0;
						ucZ = 0;
						ucY = 0;
						ucR = 0;	
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 0;	
					 end
					 
		4'b1010 : begin // LOAD Z RAM
						ucRam  = 0;
						ucA = 0;
						ucB = 0;
						ucZ = 1;
						ucY = 0;
						ucR = 0;	
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 1;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 0;	
					 end
					 
		4'b1011 : begin // JUMP INCONDITIONAL
						ucRam  = 0;
						ucA = 0;
						ucB = 0;
						ucZ = 0;
						ucY = 0;
						ucR = 0;	
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;	
						ucJp = 1;
					 end
				
					 
					 
		default: begin 
						ucRam = 0;
						ucA = 0;
						ucB = 0;
						ucZ = 0;
						ucY = 0;
						ucR = 0;
						ucALU = 0;
						ucShfD = 0;
						ucShfU = 0;
						ucMuxA = 0;
						ucMuxB = 0;
						ucDex = 0;
					 end
					 
		endcase
		
	
	end
	

endmodule