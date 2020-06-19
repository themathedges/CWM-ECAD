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
reg clk, read; 
reg [2:0] a; 
reg [2:0] b;
wire [5:0] result;

initial begin
	clk = 0;
	forever begin
	#(clk_period/2)clk = ~clk; 
	end		
	end

initial begin
	read = 0;	 
	a = 3'b011; // 3 * 4 should give result = 12 ie 1100
	b = 3'b100;					
	#clk_period
	read = 1;
	forever begin
		#clk_period 				
		$display("a=%d b=%d result=%d", a, b, result); // display result in decimal
		end
		end

multiplier multiplier(.clk(clk), .a(a), .b(b), .read(read), .result(result)); 

endmodule
