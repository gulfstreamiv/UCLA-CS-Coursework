`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:18:36 03/03/2015
// Design Name:   hanoi
// Module Name:   C:/Users/152/Desktop/hanoi/testbench.v
// Project Name:  hanoi_tower
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hanoi
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg btnS;
	reg btnR;
	reg btnL;
	reg sw0;
	reg sw1;
	reg sw2;
	reg sw3;
	reg sw7;
	reg msclk;

	// Outputs
	wire [7:0] seg;
	wire [3:0] an;
	integer i;

	// Instantiate the Unit Under Test (UUT)
	hanoi uut (
		.btnS(btnS), 
		.btnR(btnR), 
		.btnL(btnL), 
		.sw0(sw0), 
		.sw1(sw1), 
		.sw2(sw2), 
		.sw3(sw3), 
		.sw7(sw7), 
		.msclk(msclk), 
		.seg(seg), 
		.an(an)
	);

	initial begin
		// Initialize Inputs
		btnS = 0;
		btnR = 0;
		btnL = 0;
		sw0 = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;
		sw7 = 0;
		msclk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      for(i=0;i<100000000;i=i+1) begin
		#10;
			if(i==150000) begin sw3=1; end
			if(i==4000000) begin btnR=1; end
			if(i==30000000) begin btnR=0; end
			if(i==40000000) begin sw3=0; sw2=1; end
			if(i==50000000) begin btnR=1; end
		msclk=~msclk; 
		end
		// Add stimulus here

	end
      
endmodule

