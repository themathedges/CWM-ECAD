//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module testbench();

parameter clk_period = 10;

reg clk, rst, button, err;
reg [2:0] tmp;
wire [2:0] throw;

initial begin
	clk = 0;
	forever
		#(clk_period/2)clk = ~clk; 		// delay of half a cycle, clk = bitwise not clk 
	end

initial begin						// initialise values
	rst = 0;
	#clk_period rst = 1; 
	button = 0;      
	#clk_period rst = 0;            			
	#clk_period button = 1;
	err = 0;
	#(4*clk_period)

	forever begin
		tmp <= throw;
		#(clk_period) 
		if (tmp != throw + 1);
		$display("TEST FAILED");
		err = 1;
		end
end

initial begin
	#(20*clk_period)
	if (err == 0)
	$display("TEST PASSED");				
	$finish;
	end 

dice dice(.clk(clk),.rst(rst),.button(button),.throw(throw)); 		// instantiate module

endmodule 
