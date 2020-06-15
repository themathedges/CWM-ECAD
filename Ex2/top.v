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
    input wire sel, input a, input b, output reg out	
    );

    // should I do an 'initial begin' block to set all values to zero and even include the delay there?
    //initial begin
	//out = 0;
	//#5
    //end

    always @(posedge sel) 
	if (sel)
	   out <= b;
	   #5 // delay of 5 ticks at both input and output?
	else
	   out <= a;
	   #5
                  
      
endmodule
