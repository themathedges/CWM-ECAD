//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory and AXI-4-lite interface.
//
//  inputs:
//           clk, rst, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
module multiplier(input clk, input rst, input [2:0] a, input [2:0] b, input read, output reg [5:0] result);

wire [31:0] addr_wire;
wire [31:0] result_wire;
wire arvalid, rvalid, rsta_busy, rstb_busy;

assign addr_wire = arvalid ? {24'b0,a,b,2'b0} : 32'bX; 	// undefined if !arvalid

assign rsta_busy = rst? 1'b1:1'b0;
assign rstb_busy = rst? 1'b1:1'b0;

assign result_wire[5:0] = (!rst && rvalid) ? result:result_wire[5:0]; // undefined if !rvalid


// . instance port ( module assignment ) is notation

blk_mem_gen_0 mybram (
  .rsta_busy(rsta_busy),          // output wire rsta_busy
  .rstb_busy(rstb_busy),          // output wire rstb_busy
  .s_aclk(clk),                // input wire s_aclk
  .s_aresetn(1'b1),          // input wire s_aresetn ~ *** SET TO 1 TO DEACTIVATE GLOBAL RST		
  .s_axi_awaddr(32'b0),    // input wire [31 : 0] s_axi_awaddr
  .s_axi_awvalid(32'b0),  // input wire s_axi_awvalid
  .s_axi_awready(),  // output wire s_axi_awready
  .s_axi_wdata(32'b0),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(4'b0),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(1'b0),    // input wire s_axi_wvalid
  .s_axi_wready(),    // output wire s_axi_wready
  .s_axi_bresp(),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(),    // output wire s_axi_bvalid
  .s_axi_bready(1'b1),    // input wire s_axi_bready 
  .s_axi_araddr(addr_wire),    // input wire [31 : 0] s_axi_araddr
  .s_axi_arvalid(arvalid),  // input wire s_axi_arvalid
  .s_axi_arready(1'b1),  // output wire s_axi_arready
  .s_axi_rdata(result_wire),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(rvalid),    // output wire s_axi_rvalid
  .s_axi_rready(1'b1)    // input wire s_axi_rready
);

endmodule
