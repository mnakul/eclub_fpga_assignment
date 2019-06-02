`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:17 06/01/2019 
// Design Name: 
// Module Name:    comput_next_state 
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
module compute_next_state(clk,present_state,Y
    );
	 input clk;output [3:0] present_state;input [1:0] Y;
	 reg [3:0] present_state;
	 reg [2:0] micro_ROM [0:12];
	 reg[3:0]  dispatch_ROM1 [0:3];
	 reg[3:0]  dispatch_ROM2 [0:3];
	 initial begin
	  micro_ROM[0] = 0;
	  micro_ROM[1] = 0;
	  micro_ROM[2] = 0;
	  micro_ROM[3] = 1;
	  micro_ROM[4] = 2;
	  micro_ROM[5] = 2;
	  micro_ROM[6] = 2;
	  micro_ROM[7] = 0;
	  micro_ROM[8] = 0;
	  micro_ROM[9] = 0;
	  micro_ROM[10] = 3;
	  micro_ROM[11] = 4;
	  micro_ROM[12] = 4;
	  dispatch_ROM1[0] = 4;
	  dispatch_ROM1[1] = 5;
	  dispatch_ROM1[2] = 6;
	  dispatch_ROM1[3] = 6;
	  dispatch_ROM2[0] = 11;
	  dispatch_ROM2[1] = 12;
	  dispatch_ROM2[2] = 12;
	  dispatch_ROM2[3] = 12;
	  present_state = 0;
	 end
	 always @(posedge clk) begin
	   case(micro_ROM[present_state])
		  0: begin
		    present_state<=present_state+1;
		  end
		  1: begin
		    present_state<=dispatch_ROM1[Y];
		  end
		  2:begin
		   present_state<=3'b111;
		  end 
		  3:begin
		    present_state<=dispatch_ROM2[Y];
		  end
		  4:begin
		    present_state<=1'b0;
		  end
		
		endcase
	 end

endmodule

