//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();		
    
parameter clk_period = 10;

reg clk, enable, direction, rst, err, tmp;
wire counter_out;

initial begin
	clk = 0;
	forever
		#(clk_period/2)clk = ~clk; 		// delay of half a cycle, clk = bitwise not clk 
	end

initial begin						// initialise values
	rst = 0;
	tmp = 0;                   			// temporary variable?
	enable = 0;
	direction = 0;
	err = 0;
	#(3*clk_period)
	forever begin
		tmp = counter_out;
		#(1.5*clk_period) 			// not sure how long this should be - I just want to be sure the counter will increment or decrement
		if (((direction & enable & !rst) | (!direction & enable & !rst)) & (counter_out == tmp)) begin 					// if nothing changes, test failed
		$display("TEST FAILED, NO COUNTING")
		err = 1;
		      end

		if (((direction & enable & !rst) & (counter_out == tmp-1)) | ((!direction & enable & !rst) & (counter_out = tmp+1))) begin 	/* if counter counts in wrong 																				direction, test failed */
		$display("TEST FAILED, COUNTS IN WRONG DIRECTION")
		err = 1;
		      end
		
		tmp = tmp + 1; 				// not sure why this is here but something similar was in the other top_tb examples
		end
	end
		
initial begin
	#(20*clk_period)
	if (err == 0)
	$display("TEST PASSED")				// compiler ignores $ commands
	$finish
	end 

top_module top(clk,rst,enable,direction,counter_out); 	// instantiate module
 
endmodule 
