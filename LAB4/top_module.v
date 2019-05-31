`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:47 05/31/2019 
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
module top_module(clk,LCD_RS,LCD_W,LCD_E,d1,d2,d3,d4
    );
    input clk;
	 output LCD_RS,LCD_W,LCD_E,d1,d2,d3,d4;
	 LCD_driver LCD1(clk,LCD_E,LCD_RS,LCD_W,"WELCOME TO CSE  ","IIT KANPUR      ",d1,d2,d3,d4);

endmodule

