//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module testbench();

parameter clk_period = 10;

reg clk, err;
reg [2:0] prev;
wire [2:0] state2;
//assign state2 = prev;
assign state2[2] = red;
assign state2[1] = amber;
assign state2[0] = green; // output wires were assigned the wrong way around

initial begin
	clk = 0;
	forever
		#(clk_period/2)clk = ~clk; 		// delay of half a cycle, clk = bitwise not clk 
	end

initial begin	   
	//prev = state2;
	err = 0;					// prev will hopefully store the previous value of state, in which [111] represents [RAG]
	#clk_period

	forever begin
		prev = state2;
		#(1*clk_period) 			
		if ((state2 == 3'b110) && (prev != 3'b100)) begin	// forgot begin and end pairs
		$display("TEST FAILED");
		err = 1;
		end

		if ((state2 == 3'b001) && (prev != 3'b110)) begin
		$display("TEST FAILED");
		err = 1;
		end

		if ((state2 == 3'b010) && (prev != 3'b001)) begin
		$display("TEST FAILED");
		err = 1;
		end

		if ((state2 == 3'b100) && (prev != 3'b010)) begin //I think I could add a default?
		$display("TEST FAILED");
		err = 1;
		end

		end
end

initial begin
	#(10*clk_period)
	if (err == 0)
	$display("TEST PASSED");				
	$finish;
	end 

traffic traffic(.clk(clk), .red(red), .amber(amber), .green(green)); 		

endmodule 
