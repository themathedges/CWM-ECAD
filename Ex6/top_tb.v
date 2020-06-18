//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb();

parameter clk_period = 10;

reg clk, rst, button, err, sel;
wire [2:0] result;

initial begin
	sel = 1; // choose traffic or dice
	clk = 0;
	forever begin
	#(clk_period/2)clk = ~clk; 
	end		
	end

initial begin
	if (sel) begin
	prev_throw = throw; // if sel = 1 I want to set dice related variables to 0 (but in this case throw is showing 'undefined' a/c to timing diagram)
	prev_throw = 3'b0;
	button = 0;
	rst = 0;  
	err = 0;					
	#clk_period

	forever begin
		prev_traffic = traffic;
		#clk_period 			
		if ((traffic == 3'b110) && (prev_traffic != 3'b100)) begin	
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

mux mux(.clk(clk), .rst(rst), .button(button), .sel(sel), .result(result));

endmodule 
