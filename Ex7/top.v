//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0] 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
module multiplier(clka, a, b, ena, result);

input clka, ena, [2:0] a, [2:0] b;
output reg [5:0] result

always @(posedge clka) begin
	if (ena) begin
	a
	
	end else begin
	result <= 5'b0;
	end end

blk_mem_gen_0 mybram (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [5 : 0] addra
  .dina(dina),    // input wire [5 : 0] dina
  .douta(douta)  // output wire [5 : 0] douta
);

endmodule
