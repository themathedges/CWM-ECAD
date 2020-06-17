//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module traffic(input clk, output red, amber, green);

reg [2:0] state;

assign red = state[2];
assign amber = state[1];
assign green = state[0];

always @(posedge clk) begin // [111] represents RAG

			if (state == 3'b100)
			state <= 3'b110;      
        
			else if (state == 3'b110)
			state <= 3'b001;
		
			else if (state == 3'b001)
			state <= 3'b010;
		
			else //if (state == 3'b010)
			state <= 3'b100;
						
end
	
endmodule

