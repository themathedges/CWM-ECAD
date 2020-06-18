//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module mux(
     clk, rst, button, sel, result	
    );

input clk, rst, button, sel;
output reg [2:0] result;
reg [2:0] state;

always @(*) begin 
	if (sel) begin
	
	state[2] = red;
	state[1] = amber;
	state[0] = green;
	#5 result = state;
	end else begin
	
	#5 result = throw;
	end
end

traffic traffic(.clk(clk), .red(red), .amber(amber), .green(green));                 
dice dice(.clk(clk), .rst(rst), .button(button), .throw(throw));

endmodule
