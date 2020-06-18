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

	if (rst == 0) begin         
	throw <= 3'b1;

		if (button) begin

			if (throw == 3'b1)
			throw <= 3'b10;      
        
			if (throw == 3'b10)
			throw <= 3'b11;
		
			if (throw == 3'b11)
			throw <= 3'b100;
		
			if (throw == 3'b100)
			throw <= 3'b101;
		
			if (throw == 3'b101)
			throw <= 3'b110;

			if (throw == 3'b110)
			throw <= 3'b1;

		end
		else
		throw <= throw;
	
	end
	else
	throw <= 3'b0;						
	
	
end
	
endmodule


