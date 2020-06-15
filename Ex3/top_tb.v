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

module top_tb(
    );			// no ports
    
parameter clk_period = 10;

reg out;

initial begin
	clk = 0;
	forever
		#(clk_period/2)clk = ~clk; // delay of half a cycle, clk = not clk - would this also work with '!clk' ??
	end

initial begin
	rst = 0;
	enable = 0;
	direction = 0;
	counter_out = 0;
	end

// very confused about what the top_tb for ex2 relates to this logic section or what any of it means 

top_module top(clk,rst,enable,direction,counter_out);
 
endmodule 
