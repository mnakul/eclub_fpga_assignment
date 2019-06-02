`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:21 06/01/2019 
// Design Name: 
// Module Name:    input_module 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module input_module(clk,Y,sig
    );
	 input clk;
	 input [1:0] sig;
	 output [1:0] Y;
	 reg [1:0] Y;
	 initial begin 
	 Y<=0;
	 end
	 always @(posedge clk)begin
	    Y<=sig;
	 end

endmodule

