`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:51 06/14/2019 
// Design Name: 
// Module Name:    grover_invertMean 
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
module grover_invertMean (phaseInvert_out,B0,B1,B2,B3,B4,B5,B6,B7
    );
	 parameter num_bit = 3;parameter fixedpoint_bit = 24;parameter num_sample = 2**num_bit;
	 input signed [7:0] phaseInvert_out [0:7];output reg [7:0] B0;output reg [7:0] B1;output reg [7:0] B2;output reg [7:0] B3;output reg [7:0] B4;output reg [7:0] B5;output reg [7:0] B6;output reg [7:0] B7;
	 reg [7:0] invertMean [0:7];
	 integer j,k;
	 reg signed [26:0] sum;		
    wire signed [23:0] twoMean;
	 always @*
     begin
     sum = phaseInvert_out[0];
     for (j = 1; j < num_sample; j = j + 1)
     begin
	   sum = sum + phaseInvert_out[j];
     end
    end

    assign twoMean = sum[26:2];	
    reg signed [23:0] temp;

    always @*
    begin
     for (k = 0; k < num_sample; k = k + 1)
     begin
	    temp = twoMean - phaseInvert_out[k];
	    invertMean[k] = temp[23:0];	
     end
	  B0 <= invertMean[0];
	  B1 <= invertMean[1];
	  B2 <= invertMean[2];
	  B3 <= invertMean[3];
	  B4 <= invertMean[4];
	  B5 <= invertMean[5];
	  B6 <= invertMean[6];
	  B7 <= invertMean[7];
    end


endmodule

