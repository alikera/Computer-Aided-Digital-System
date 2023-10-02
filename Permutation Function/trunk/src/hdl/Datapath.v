`timescale 1ns/1ns
module Datapath #(parameter lineSize)(
    clk,
    rst,
	lineRegLoad,
	line,
	
	permutationOutput
);

	input clk, rst, lineRegLoad;
	input [lineSize-1:0] line;
	
	output [lineSize-1:0]permutationOutput;

	
	wire [lineSize-1:0] lineRegOutput;
	
	Register #(lineSize) lineRegister(.clk(clk), .rst(rst), .load(lineRegLoad), .reg_input(line), .reg_output(lineRegOutput));
    
	Permutation #(lineSize) permutation(.inp(lineRegOutput), .permutationOutput(permutationOutput));
	
endmodule