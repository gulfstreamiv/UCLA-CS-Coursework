`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:33:36 02/13/2015
// Design Name:   sevenseg
// Module Name:   F:/Verilog Projects/test_seven.v
// Project Name:  mylab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sevenseg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_seven;

	// Inputs
	reg btnS;
	reg btnR;
	reg sw0;
	reg sw1;
	reg msclk;

	// Outputs
	wire [7:0] seg;
	wire [3:0] an;
	integer i;
	// Instantiate the Unit Under Test (UUT)
	sevenseg uut (
		.btnS(btnS), 
		.btnR(btnR), 
		.sw0(sw0), 
		.sw1(sw1), 
		.msclk(msclk), 
		.seg(seg), 
		.an(an)
	);

	initial begin
		// Initialize Inputs
		btnS = 0;
		btnR = 0;
		sw0 = 0;
		sw1 = 0;
		msclk = 0;

		// Wait 100 ns for global reset to finish
		#100;

     for (i=0; i < 100000000; i = i+1)  
        begin
        #10;
		  if(i==3000000) begin sw1=1; end 
		  if(i==10000000) begin sw0=1; end
		  if(i==20000000) begin sw1=0; end 
		  if(i==80000000) begin btnR=1; end
		  if(i==81000000) begin btnR=0; end
		  if(i==85000000) begin btnR=1; end
		  if(i==86000000) begin btnR=0; end
		  if(i==60000000) begin btnS=1; end
		  if(i==61000000) begin btnS=0; end
		  if(i==70000000) begin btnS=1; end
		  if(i==71000000) begin btnS=0; end
        msclk = ~msclk;
        end
		// Add stimulus here
		$finish;
		// Add stimulus here

	end
      
endmodule

