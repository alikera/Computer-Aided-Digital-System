`timescale 1 ns/ 1 ns

module Permutation #(parameter N)(
	inp,
	permutationOutput
);
	input [N-1:0] inp;
		
	output reg [N-1:0] permutationOutput;
	
	assign permutationOutput[10] = inp[0];
	assign permutationOutput[20] = inp[1];
	assign permutationOutput[5] = inp[2];
	assign permutationOutput[15] = inp[3];
	assign permutationOutput[0] = inp[4];
	
	assign permutationOutput[1] = inp[5];
	assign permutationOutput[11] = inp[6];
	assign permutationOutput[21] = inp[7];
	assign permutationOutput[6] = inp[8];
	assign permutationOutput[16] = inp[9];
	
	assign permutationOutput[17] = inp[10];
	assign permutationOutput[2] = inp[11];
	assign permutationOutput[12] = inp[12];
	assign permutationOutput[22] = inp[13];
	assign permutationOutput[7] = inp[14];
	
	assign permutationOutput[8] = inp[15];
	assign permutationOutput[18] = inp[16];
	assign permutationOutput[3] = inp[17];
	assign permutationOutput[13] = inp[18];
	assign permutationOutput[23] = inp[19];
	
	assign permutationOutput[24] = inp[20];
	assign permutationOutput[9] = inp[21];
	assign permutationOutput[19] = inp[22];
	assign permutationOutput[4] = inp[23];
	assign permutationOutput[14] = inp[24];
	
 endmodule
