//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #2 - multiplexer
// Author: Noa Zilberman
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module mux_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk, sel, err, rst, button, throw, red, amber, green;
    reg [1:0] ab;
    reg [1:0] ab_prev;
    wire [2:0] result;
    
    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
       ab=0;
       ab_prev=ab;
       err=0;
       sel=0;
       #6
       forever begin
         #(CLK_PERIOD-6)
	 if ((sel&(out!=ab_prev[0]))| (!sel&(out!=ab_prev[1])))
         begin
           $display("***TEST FAILED! did not maintain 5 ticks gap! a=%d, b=%d, previous a=%d, previous b=%d, sel=%d, actual out=%d ***",ab[1],ab[0],ab_prev[1], ab_prev[0], sel,out);
           err=1;
         end
         #6
	 if ((sel&(out!=ab[0]))| (!sel&(out!=ab[1])))
         begin
           $display("***TEST FAILED! a==%d, b==%d, sel='%d', actual out=%d ***",ab[1],ab[0],sel,out);
           err=1;
         end
	 ab_prev=ab;
         ab=ab+1;
         if (ab==0)
           sel=~sel;
       end
     end
     
          
      //Finish simulation and check for success
      initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

    //User's modules
    mux mux(.clk(clk), .rst(rst), .button(button), .sel(sel), .result(result));

    traffic traffic(.clk(clk), .red(red), .amber(amber), .green(green));

    dice dice(.clk(clk), .rst(rst), .button(button), throw);
     

.a (ab[1]), - sel 0 ie dice 
     .b (ab[0]), - sel 1 ie traffic
endmodule 
