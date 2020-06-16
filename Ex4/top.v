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

module dice(input clk, rst, button, output [2:0] throw)

always @(*)

	if ((rst == 0) && (button || !button)) begin // im not entirely sure if im starting this correctly?
	throw = 3'b1;

		if (rst == 1)
		?
		else if ((rst == 0) && (!button))
		throw = throw;
		else if 
		throw = 3'b10;        
        
		if (rst == 1)
		?
		else if ((rst == 0) && (!button))
		throw = throw;
		else if 
		throw = 3'b11;

		if (rst == 1)
		?
		else if ((rst == 0) && (!button))
		throw = throw;
		else if
		throw = 3'b100;

		if (rst == 1)
		?
		else if ((rst == 0) && (!button))
		throw = throw;
		else if
		throw = 3'b101;

		if (rst == 1)
		?
		else if ((rst == 0) && (!button))
		throw = throw;
		else
		throw = 3'b110;

		if (rst == 1)
		?
		else if (!button)
		throw = throw;
		else if
		throw = 3'b1;
	else
	?						// im not sure what to write if rst == 1?
	end
	
endmodule


