`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:52 05/29/2019 
// Design Name: 
// Module Name:    LCD_driver 
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
module LCD_driver(clk,LCD_E,LCD_RS,LCD_W,line1,line2,d1,d2,d3,d4
    );
	 input clk;
	 input [127:0] line1;
	 input [127:0] line2;
	 output d1,d2,d3,d4,LCD_E,LCD_RS,LCD_W;
	 reg d1,d2,d3,d4,LCD_E,LCD_RS,LCD_W;
	 integer counter=0;
	 reg [1:0] state1=3;
	 reg [7:0] index1=0;
	 reg [1:0] state2=3;
	 reg [7:0] index2=0;
	 reg [3:0] mem_index=0;
	 reg [3:0] mem [0:13];
	 reg [2:0] breakline = 7;
	 reg [2:0] state = 0;
	 initial begin
	  mem[0] = 6'h03;
     mem[1] = 6'h03;
     mem[2] = 6'h03;
     mem[3] = 6'h02;
     mem[4] = 6'h02;
     mem[5] = 6'h08;
     mem[6] = 6'h00;
     mem[7] = 6'h06;
     mem[8] = 6'h00;
     mem[9] = 6'h0c;
     mem[10] = 6'h00;
     mem[11] = 6'h01;
     mem[12]= 6'h08;
     mem[13] = 6'h00;	  
	 end
    always @(posedge clk)begin
	 if(counter==100000)begin
	   counter <= 0;
		if(mem_index==14)begin
		  state<=4;
		  mem_index<=0;
		  state1<=0;
		end
		if((state!=4)&(mem_index!=14))begin
		  case(state)
		    0: begin
			    LCD_E<=0;
				 state<=1;
			 end
			 
			 1: begin
			   {LCD_RS,LCD_W,d1,d2,d3,d4}<=mem[mem_index];
				state<=2;
				end
			 2: begin
			   LCD_E<=1;
				state<=3;
			 end
			 3: begin
			   LCD_E<=0;
				state<=1;
				mem_index<=mem_index+1;
			 end
			 endcase
		end
    if(index1==128)begin
	   state1<=3;
		index1<=0;
		breakline<=0;
	 end
    if((state1!=3)&(index1!=128))begin
	   case(state1)
		  0: begin
		    {LCD_RS,LCD_W,d1,d2,d3,d4}<={2'h2,line1[index1],line1[index1+1],line1[index1+2],line1[index1+3]};
          state1<=1;		  
		  end
		  1: begin
		    LCD_E<=1;
			 state1<=2;
		  end
		  2: begin
		    LCD_E<=0;
			 state1<=0;
			 index1<=index1+4;
		  end
		  endcase
	 end
	 if(breakline!=7)begin
	   case(breakline)
		  0: begin
		   {LCD_RS,LCD_W,d1,d2,d3,d4}<=6'h0c;
				breakline<=1;
		  end
		  1: begin
		    LCD_E<=1;
			 breakline<=2;
		  end
		  2: begin
		    LCD_E<=0;
			 breakline<=3;
		  end
		  3: begin
		    {LCD_RS,LCD_W,d1,d2,d3,d4}<=6'h00;
			 breakline<=4;
		  end
		  4: begin
		    LCD_E<=1;
			 breakline<=5;
		  end
		  5: begin
		    LCD_E<=0;
			 breakline<=7;
			 state2<=0;
		  end
		endcase
	 end
	 if(index2==128)begin
	   state2=3;
           index2=0;
	 end
	 if((state2!=3)&(index2!=128))begin
	   case(state2)
		  0: begin
		    {LCD_RS,LCD_W,d1,d2,d3,d4}<={2'h2,line2[index2],line2[index2+1],line2[index2+2],line2[index2+3]};
          state2<=1;		  
		  end
		  1: begin
		    LCD_E<=1;
			 state2<=2;
		  end
		  2: begin
		    LCD_E<=0;
			 state2<=0;
			 index2<=index2+4;
		  end
		  endcase
	 end
	 end
	 else begin
	   counter = counter+1;
	 end
	 end

endmodule

