`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:16:27 06/14/2019 
// Design Name: 
// Module Name:    grover_phaseInvert 
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
module grover_phaseInvert (target_search,phaseInvert_in,A1,A2,A3,A4,A5,A6,A7,A0
    );
	 parameter num_bit = 3;parameter fixedpoint_bit = 24;parameter num_sample = 2**num_bit;
	 input [2:0] target_search;input signed [7:0] phaseInvert_in [0:7];output reg [7:0] A1,A2,A3,A4,A5,A6,A7,A0;
	 integer i;
	 always @*
     begin
	    phaseInvert_in[target_search] = -1*phaseInvert_in[target_search];
		 A0 <= phaseInvert_in[0];
		 A1 <= phaseInvert_in[1];
		 A2 <= phaseInvert_in[2];
		 A3 <= phaseInvert_in[3];
		 A4 <= phaseInvert_in[4];
		 A5 <= phaseInvert_in[5];
		 A6 <= phaseInvert_in[6];
		 A7 <= phaseInvert_in[7];
     end



endmodule

