`timescale 1ns/1ns
module Controller (
    clk,
    rst,
    start,
	
	lineRegLoad
);

    input clk, rst, start;
	output reg lineRegLoad;


    parameter [2:0] 
        Start = 3'b000,
        ReadLine = 3'b001,
        Permutation = 3'b010,
		Done = 3'b011;


    reg [3:0] ps, ns;
	
    reg [5:0] counterInit = 6'b000000;
	reg loadCounter = 1'b0;
	reg enCounter = 1'b0;
	wire [5:0] count;
	wire coCounter;
	
	Counter #6 counter(.clk(clk), .rst(rst), .loadEn(loadCounter), .initCount(counterInit), .en(enCounter), .count(count), .cout(coCounter));

    always @(posedge clk, posedge rst) begin
        if(rst)
            ps <= Start;
        else
            ps <= ns;
    end

    always @(ps, start, coCounter) begin
        case (ps)
            Start:      	ns = start ? ReadLine : Start;
            ReadLine:       ns = Permutation;
            Permutation: 	ns = coCounter ? Done : ReadLine;
			Done:			ns = Start;
            default: 		ns = Start;
        endcase
    end

    always @(ps) begin
        {lineRegLoad, loadCounter, enCounter} = 3'b000;
        case (ps)
            Start:
				loadCounter = 1'b1;
            ReadLine:
                lineRegLoad = 1'b1;
            Permutation:
				enCounter = 1'b1;
        endcase
    end


endmodule