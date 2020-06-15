//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    input sel, input a, input b, output reg out	
    );

    always @(*) // always @(sel) ~ execute at any event not just when sel is high!
	if (sel)
	   #5 out <= b;
	    // delay of 5 ticks at both input and output? not sure if this is also at output
	else
	   #5 out <= a;
	   
                  
      
endmodule
