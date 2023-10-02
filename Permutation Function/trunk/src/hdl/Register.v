`timescale 1 ns/ 1 ns

module Register #(parameter N)(
	clk,
	rst, 
	load,
	reg_input,
	reg_output
);
	input clk, rst, load;
	input [N-1:0] reg_input;
		
	output reg [N-1:0] reg_output;

	always @(posedge clk, posedge rst) begin
		if(rst)
			reg_output = 0;
		else if(load)
			reg_output = reg_input;
	end
	
 endmodule
