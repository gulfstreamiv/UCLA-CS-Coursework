`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:21:12 02/12/2015
// Design Name:   debouncer
// Module Name:   F:/Verilog Projects/test_db.v
// Project Name:  mylab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_db;

	// Inputs
	reg msclk;
	reg btn;
	integer i;
	// Outputs
	wire cleanbtn;

	// Instantiate the Unit Under Test (UUT)
	debouncerBtn uut (
		.msclk(msclk), 
		.btn(btn), 
		.cleanbtn(cleanbtn)
	);

	initial begin
		// Initialize Inputs
		msclk = 0;
		btn = 0;

		msclk = 1;
        #100;
        msclk = 0;
		  
        for (i=0; i < 1000000; i = i+1)
        begin
        #10;
		  if(i==5000) begin btn=1; end
		  if(i==60000) begin btn=0; end
		  if(i==70000) begin btn=1; end
		  if(i==90000) begin btn=0; end
        msclk = ~msclk;
        end
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

