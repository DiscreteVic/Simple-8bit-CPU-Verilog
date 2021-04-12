// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 04/02/2021:| Control Unit
//   V1.1 :| viCppDev			   :| 07/02/2021:| Added inconditional Jumps
//   V1.1 :| viCppDev			   :| 08/02/2021:| Added conditional Jumps
// ============================================================================


module ControlUnit (
	input clk, 
	input wire [3:0] opCode, 	
	output wire [15:0] ctrlSignals
	);
	
	
	reg cuA;
	reg cuB;
	reg cuZ;
	reg cuY;
	reg cuR;
	reg cuALU;
	reg cuShfU;
	reg cuShfD;
	reg cuRam;
	reg cuMuxA;
	reg cuMuxB;
	reg cuDex;
	reg cuJp;
	reg cuJpc;
	reg [1:0]cuComp;
	
	reg [3:0]cmd;
	
	assign ctrlSignals[0] = cuA;     
	assign ctrlSignals[1] = cuB;
	assign ctrlSignals[2] = cuZ;
	assign ctrlSignals[3] = cuY;
	assign ctrlSignals[4] = cuR;
	assign ctrlSignals[5] = cuALU;  
	assign ctrlSignals[6] = cuShfU; 
	assign ctrlSignals[7] = cuShfD; 
	assign ctrlSignals[8] = cuRam; 
	assign ctrlSignals[9] = cuMuxA; 
	assign ctrlSignals[10] = cuMuxB; 
	assign ctrlSignals[11] = cuDex; 
	assign ctrlSignals[12] = cuJp; 
	assign ctrlSignals[13] = cuJpc; 
	assign ctrlSignals[14] = cuComp[0]; 
	assign ctrlSignals[15] = cuComp[1]; 
	
	
	initial begin
		cuA <= 0;
		cuB <= 0;
		cuZ <= 0;
		cuY <= 0;
		cuR <= 0;
		cuRam <= 0;
	end
	
	
	always @(posedge(clk)) begin
	
		case (opCode)
		4'b0000 : begin //ADD
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 1;
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
			
		4'b0001 : begin // SUB
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 1;
						cuALU = 1;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b0010 : begin // LOAD A
						cuRam  = 0;
						cuA = 1;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b0011 : begin // LOAD B
						cuRam  = 0;
						cuA = 0;
						cuB = 1;
						cuZ = 0;
						cuY = 0;
						cuR = 0;
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b0100 : begin // LOAD Z 
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 1;
						cuY = 0;
						cuR = 0;
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b0101 : begin // LOAD Shift Down
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;	
						cuALU = 0;
						cuShfD = 1;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b0110 : begin // LOAD Shift Up
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 1;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b0111 : begin // LOAD Y(RAM Addr)
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 1;
						cuR = 0;	
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;//must be 0		
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b1000 : begin // Store RAM new value
						cuRam  = 1;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;	
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 1;
						cuDex = 1;	
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b1001 : begin // Store RAM result
						cuRam  = 1;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;	
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;	
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b1010 : begin // LOAD Z RAM
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 1;
						cuY = 0;
						cuR = 0;	
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 1;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 0;	
						cuComp = 2'b00;
					 end
					 
		4'b1011 : begin // JUMP INCONDITIONAL
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;	
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 1;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		4'b1100 : begin // JUMP CONDITIONAL EQUAL
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;	
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 1;
						cuComp = 2'b00;
					 end
					 
		4'b1101 : begin // JUMP CONDITIONAL LESS
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;	
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 1;
						cuComp = 2'b01;
					 end
					 
		4'b1110 : begin // JUMP CONDITIONAL MORE
						cuRam  = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;	
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 1;
						cuComp = 2'b10;
					 end
				
					 
					 
		default: begin 
						cuRam = 0;
						cuA = 0;
						cuB = 0;
						cuZ = 0;
						cuY = 0;
						cuR = 0;
						cuALU = 0;
						cuShfD = 0;
						cuShfU = 0;
						cuMuxA = 0;
						cuMuxB = 0;
						cuDex = 0;	
						cuJp = 0;
						cuJpc = 0;
						cuComp = 2'b00;
					 end
					 
		endcase
		
	
	end
	

endmodule