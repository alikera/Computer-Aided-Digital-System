`timescale 1ns/1ns
module Counter #(parameter N)(
	clk,
	rst,
	loadEn,
	initCount,
	en,
	count,
	cout);
	
	input clk, rst, loadEn;
	input [N-1:0] initCount;
	input en;
	
	output [N-1:0] count;
	output cout;
	
	reg [N-1:0] count_temp;

	always @(posedge clk, posedge rst) begin
		if (rst)
			count_temp <= 3'b0;
		else if (loadEn)
			count_temp <= initCount;
		else if (en)
			count_temp <= count_temp + 1'b1;

	end

	assign count = count_temp;
	assign cout = &count_temp;

endmodule