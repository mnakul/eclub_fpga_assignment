`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:51:42 06/25/2019
// Design Name:   grover
// Module Name:   /home/milind/final_grover/grover_test.v
// Project Name:  final_grover
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: grover
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module grover_test;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [2:0] target_search;

	// Outputs
	wire [7:0] o0;
	wire [7:0] o1;
	wire [7:0] o2;
	wire [7:0] o3;
	wire [7:0] o4;
	wire [7:0] o5;
	wire [7:0] o6;
	wire [7:0] o7;
	wire done;
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;
	wire led7;

	// Instantiate the Unit Under Test (UUT)
	grover uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.target_search(target_search), 
		.o0(o0), 
		.o1(o1), 
		.o2(o2), 
		.o3(o3), 
		.o4(o4), 
		.o5(o5), 
		.o6(o6), 
		.o7(o7), 
		.done(done), 
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6), 
		.led7(led7)
	);

	initial
	begin
		clk = 1'b0;
		forever
			#30 			//period=40ns
			clk = ~clk;
	end

	initial
	begin
		rst = 1'b1; 
		#100
		rst = 1'b0;	target_search = 'd4; start = 1'b1;
		#1000
//		rst = 1'b0;	target_search = 'd1; start = 1'b0;
//		#80;
//		rst = 1'b0;	target_search = 'd2; start = 1'b0;
//		#80;
//		rst = 1'b0;	target_search = 'd3; start = 1'b0;
//		#80;
		$stop;
	end
      
endmodule


