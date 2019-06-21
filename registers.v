`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:14:15 06/14/2019 
// Design Name: 
// Module Name:    registers 
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
	module registers (clk, rst, en,in,out,C1,C2,C3,C4,C5,C6,C7,C0
    );
	 parameter sample_size = 4;parameter complexnum_bit = 24;
	 input clk, rst, en;output reg [7:0] C1,C2,C3,C4,C5,C6,C7,C0;
    input signed [7:0]in[0:7];reg signed [7:0]out[0:7];
	 integer i;
	 always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			for (i = 0; i < sample_size; i = i + 1) 
			begin
				out[i] <= 'd0;
			end
		end
		else
		begin
			i=0; 
			if(en)
				out <= in;
		end
		C0 <= out[0];
		 C1 <= out[1];
		 C2 <= out[2];
		 C3 <= out[3];
		 C4 <= out[4];
		 C5 <= out[5];
		 C6 <= out[6];
		 C7 <= out[7];
	end


endmodule

