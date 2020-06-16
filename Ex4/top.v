//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
module dice(input clk, rst, button, output reg [2:0] throw);

always @(posedge clk) begin

	if (rst == 0) begin         // not sure if i need a begin/end here
	throw <= 3'b1;

		if (!button)
		throw <= throw;
		else  
		throw <= 3'b10;        
        
		if (!button)
		throw <= throw;
		else 
		throw <= 3'b11;

		if (!button)
		throw <= throw;
		else
		throw <= 3'b100;

		if (!button)
		throw <= throw;
		else
		throw <= 3'b101;

		if (!button)
		throw <= throw;
		else
		throw <= 3'b110;

		if (!button)
		throw <= throw;
		else
		throw <= 3'b1;
	
	end
	else
	throw <= 3'b0;						
	
	
end
	
endmodule


