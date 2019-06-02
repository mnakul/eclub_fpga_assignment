`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:48:22 06/02/2019 
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
module top_module(clk,led0,led1,led2,led3,sig
    );
	 input clk;input [1:0] sig;
	 output led0,led1,led2,led3;
	 wire led0,led1,led2,led3;
	 wire [1:0] Y;
	 wire [3:0] present_state;
	 input_module IM1 (clk,Y,sig);
    compute_next_state CNS1 (clk,present_state,Y);
	 assign led0=present_state[0];
	 assign led1=present_state[1];
	 assign led2=present_state[2];
	 assign led3=present_state[3];
    
endmodule

