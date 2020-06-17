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

initial begin	
	tmp = 3'b0;    
	#clk_period rst = 0;            			
	#clk_period button = 1;
	err = 0;
	#(1.5*clk_period)
	tmp = throw;
	forever begin
		#(10*clk_period) 			// I dont understand why 10 works but 1 or 2 didnt?
		if ((throw != tmp+3'b1) && (throw != 3'b1)); 
		$display("TEST FAILED");
		err = 1;
		end
end

initial begin
	#(10*clk_period)
	if (err == 0)
	$display("TEST PASSED");				
	$finish;
	end 

dice dice(.clk(clk),.rst(rst),.button(button),.throw(throw)); 		

endmodule 
