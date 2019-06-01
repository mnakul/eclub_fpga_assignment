`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:05:02 06/01/2019 
// Design Name: 
// Module Name:    top_module 
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
module top_module(sig,LCD_E,LCD_RS,LCD_W,d1,d2,d3,d4,clk
    );
	 input [2:0] sig;input clk;
    output LCD_E,LCD_W,LCD_RS,d1,d2,d3,d4;
	 wire LCD_E,LCD_W,LCD_RS,d1,d2,d3,d4;
	 wire [2:0] input0;
	 wire [2:0] input1;
	 wire [2:0] input2;
	 wire [2:0] input3;
	 wire [1:0] min_index;
	 wire [127:0] line1;
	 wire [127:0] line2;
	 input_module IM1 (clk,in0,in1,in2,in3,sig);
	 compare IM2 (clk,in0,in1,in2,in3,min_index);
	 assign line1 = {"Input ",{5'b0,input0}+8'h30,", ",{5'b0,input1}+8'h30,", ",{5'b0,input2}+8'h30,", ",{5'b0,input3}+8'h30};
	 assign line2 = {"Minimum index: ",{6'b0,min_index}+8'h30};
	 LCD_driver IM3 (clk,LCD_E,LCD_RS,LCD_W,line1,line2,d1,d2,d3,d4);
	 
endmodule

