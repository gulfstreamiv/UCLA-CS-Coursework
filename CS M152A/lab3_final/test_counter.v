`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:35:46 02/13/2015
// Design Name:   minCounter
// Module Name:   F:/Verilog Projects/test_counter.v
// Project Name:  mylab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: minCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_counter;

	// Inputs
	reg clk;
	reg ifpauseM;
	reg ifpauseS;
	reg pauseBoth;
	reg RST;
	reg SEL;
	reg ADJ;

	// Outputs
	wire [5:0] sec_state;
	wire [6:0] cur_state;
	integer i;
	// Instantiate the Unit Under Test (UUT)
	minCounter uut (
		.clk(clk), 
		.ifpauseM(ifpauseM), 
		.ifpauseS(ifpauseS), 
		.pauseBoth(pauseBoth), 
		.RST(RST), 
		.SEL(SEL), 
		.ADJ(ADJ), 
		.sec_state(sec_state), 
		.cur_state(cur_state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ifpauseM = 0;
		ifpauseS = 0;
		pauseBoth = 0;
		RST = 0;
		SEL = 0;
		ADJ = 0;

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

