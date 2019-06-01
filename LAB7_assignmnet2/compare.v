`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:48:59 06/01/2019 
// Design Name: 
// Module Name:    compare 
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
module compare(clk,in0,in1,in2,in3,min_index
    );
	 inout clk;
   input [2:0] in0;
   input [2:0] in1;
   input [2:0] in2;
   input [2:0] in3;
   output [1:0] min_index;
   reg [1:0] min_index;
	wire [2:0] min12;
   wire [2:0] min34;
   wire [1:0] ind12;
   wire [1:0] ind34;	
	wire [1:0] min;
   assign min12 = (in0<in1)?in0:in1;
	assign ind12 = (in0<in1)?2'b00:2'b01;
   assign min34 = (in2<in3)?in2:in3;
   assign ind34 = (in2<in3)?2'b10:2'b11; 	
   assign min = (min12<min34)?ind12:ind34; 
   always @(posedge clk)
     min_index<=min;	
endmodule

