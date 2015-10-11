`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:09:26 01/28/2015
// Design Name:   converter2
// Module Name:   C:/Users/152/Desktop/OURLAB/lab2/test_bench.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: converter2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench;

	// Inputs
	reg [11:0] D;

	// Outputs
	wire S;
	wire [2:0] E;
	wire [3:0] F;

	// Instantiate the Unit Under Test (UUT)
	converter2 uut (
		.D(D), 
		.S(S), 
		.E(E), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		D = 12'b0111_1100_0000;

		// Wait 100 ns for global reset to finish
		#100;
        D=12'b011111111111;
        #100;
        D=12'b001100110000;
        #100;
        D=12'b000000001100;
        #100;
        D=12'b110010000001;
        #100;
        D=12'b100000001111;
        #100;
        D=12'b000001011000;
        #100;
        D=12'b111001011010;
		// Add stimulus here

	end
      
endmodule

