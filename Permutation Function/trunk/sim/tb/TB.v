`timescale 1ns/1ns

module TB ();
    reg rst;
	reg clk = 1'b1;
	reg start = 1'b0;
	
	wire lineRegLoad;
	reg [24:0] line;
	
	wire [24:0] newLine;

    Controller c(
		clk,
		rst,
		start,
		
		lineRegLoad
	);

    Datapath #(25) dp(
		clk,
		rst,
		lineRegLoad,
		line,
		
		newLine
    );
    reg [24:0] Mem [0:63];
    always #20 clk = ~clk;

	integer i, outFile, k, inputFile;
	
    reg [8*18:0]inFileName = "./file/input_0.txt";
    reg [8*19:0]outFileName = "./file/output_0.txt";

    initial begin
        for (k = 0; k < 6 ; k = k+1) begin
            $sformat(inFileName, "./file/input_%0d.txt", k);
            $sformat(outFileName, "./file/output_%0d.txt", k);
            #5 rst = 1'b0;
            #10 start = 1'b1;
			#25 start = 1'b0;
			inputFile=$fopen(inFileName, "r");
            outFile = $fopen(outFileName, "w");
            for(i = 0; i < 64; i= i+1) begin 
				$fscanf(inputFile, "%b\n", line);
				#80
                $fwriteb(outFile, newLine);
                $fdisplay(outFile, "");
            end  
            $fclose(outFile);
			#200;
        end
        #30000;
        $stop;
    end

endmodule