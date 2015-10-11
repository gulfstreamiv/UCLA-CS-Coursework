`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:43:16 02/21/2015
// Design Name:   clock
// Module Name:   F:/Verilog Projects/test_clk.v
// Project Name:  mylab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_clk;

	// Inputs
	reg master_clk;

	// Outputs
	wire clk_1;
	wire clk_2;
	wire clk_5;
	wire clk_100;
	integer i;

	// Instantiate the Unit Under Test (UUT)
	clock uut (
		.master_clk(master_clk), 
		.clk_1(clk_1), 
		.clk_2(clk_2), 
		.clk_5(clk_5), 
		.clk_100(clk_100)
	);

	initial begin
		// Initialize Inputs
		master_clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      for (i=0; i < 1000000; i = i+1)
        begin
        #10;
        clk = ~clk;
        end
		// Add stimulus here

	end
      
endmodule

