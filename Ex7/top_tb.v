//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps
module testbench();

parameter clk_period = 10;
reg clka, ena, err; 
reg [2:0] a; 
reg [2:0] b;
wire [5:0] result;

initial begin
	clka = 0;
	forever begin
	#(clk_period/2)clka = ~clka; 
	end		
	end

initial begin
	ena = 1;	 
	err = 0;
	a = 3'b011; // 3 * 4 should give result = 12
	b = 3'b100;					
	#clk_period
	forever begin
		#clk_period 			
		if ((a*b != result) && ena) begin	
		$display("TEST FAILED");
		err = 1;
		end
		end
		end

initial begin
	#(20*clk_period)
	if (err == 0) begin
	$display("TEST PASSED");				
	$finish;
	end
	end

multiplier multiplier(.clka(clka), .a(a), .b(b), .ena(ena), .result(result)); 

endmodule
