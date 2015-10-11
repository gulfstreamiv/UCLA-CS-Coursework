`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:13 03/09/2015
// Design Name:   encryptor
// Module Name:   C:/Users/152/Desktop/temp2/ll.v
// Project Name:  temp2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: encryptor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ll;

	// Inputs
	reg sw0;
	reg sw1;
	reg sw2;
	reg sw3;
	reg sw4;
	reg sw5;
	reg sw6;
	reg sw7;
	reg btnR;
	reg btnS;
	reg msclk;
	wire RX;

	// Outputs
	wire TX;
	wire [3:0] an;
	wire [7:0] seg;
	wire [7:0] Led;

	// Instantiate the Unit Under Test (UUT)
	encryptor uut (
		.sw0(sw0), 
		.sw1(sw1), 
		.sw2(sw2), 
		.sw3(sw3), 
		.sw4(sw4), 
		.sw5(sw5), 
		.sw6(sw6), 
		.sw7(sw7), 
		.btnR(btnR), 
		.btnS(btnS), 
		.msclk(msclk), 
		.RX(RX), 
		.TX(TX), 
		.an(an), 
		.seg(seg), 
		.Led(Led)
	);

	initial begin
		// Initialize Inputs
		sw0 = 0;
		sw1 = 1;
		sw2 = 0;
		sw3 = 0;
		sw4 = 0;
		sw5 = 0;
		sw6 = 0;
		sw7 = 0;
		btnR = 0;
		btnS = 0;
		msclk = 0;

		// Wait 100 ns for global reset to finish
		#100000;
        btnS = 1;

		// Add stimulus here

	end
    always #5 msclk = ~msclk;
           model_uart uart_ (.TX(RX), .RX(TX));
           
   defparam uart_.name = "UART0";
   defparam uart_.baud = 1000000;
   endmodule

