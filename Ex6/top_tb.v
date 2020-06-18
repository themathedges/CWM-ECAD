//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

// ***this was my original attempt this morning but apparently it is incorrect***
`timescale 1ns/100ps

module top_tb();

parameter clk_period = 10;

reg clk, rst, button, err, sel;
reg [2:0] prev_throw;
reg [2:0] prev_traffic;
wire [2:0] throw;
wire [2:0] traffic;

assign traffic[2] = red;
assign traffic[1] = amber;
assign traffic[0] = green; 

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

		if ((traffic == 3'b001) && (prev_traffic != 3'b110)) begin
		$display("TEST FAILED");
		err = 1;
		end

		if ((traffic == 3'b010) && (prev_traffic != 3'b001)) begin
		$display("TEST FAILED");
		err = 1;
		end

		if ((traffic == 3'b100) && (prev_traffic != 3'b010)) begin 
		$display("TEST FAILED");
		err = 1;
		end
		end
	end else begin
	prev_traffic = traffic; // if sel = 0 I want to set traffic related variables to 0 (which works fine a/c to timing diagram)
	prev_traffic = 3'b0;    
	#clk_period rst = 0;            			
	#clk_period button = 1;
	err = 0;
	#(1.5*clk_period)
	prev_throw = 3'b0;

	forever begin
		prev_throw = throw;
		#clk_period			
		if ((throw != prev_throw+3'b1) && (throw != 3'b1)) begin 
		$display("TEST FAILED");
		err = 1;
		end
		end
		end
end

initial begin
	#(20*clk_period)
	if (err == 0)
	$display("TEST PASSED");				
	$finish;
	end 

mux mux2(.clk(clk), .rst(rst), .button(button), .sel(sel), .result(result));
traffic traffic2(.clk(clk), .red(red), .amber(amber), .green(green)); 
dice dice2(.clk(clk), .rst(rst), .button(button), .throw(throw));		

endmodule 
