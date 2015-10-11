`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:12:19 03/08/2015
// Design Name:   datahandler
// Module Name:   C:/Users/joon8_000/Desktop/School/temp2/plz.v
// Project Name:  temp2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datahandler
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module plz;

	// Inputs
	wire Rx;
	reg [79:0] dataIn;
	reg sendFlag;
	reg clk;
	reg [7:0] sw;
	reg rst;
	
	// Outputs
	wire [79:0] dataOut;
	wire dataValid;
	wire Tx;
	wire [7:0] hash;

	// Instantiate the Unit Under Test (UUT)
	datahandler uut (
		.dataOut(dataOut), 
		.dataValid(dataValid), 
		.Tx(Tx), 
		.hash(hash), 
		.Rx(Rx), 
		.dataIn(dataIn[79:0]), 
		.sendFlag(sendFlag), 
		.clk(clk), 
		.sw(sw),
		.rst(rst)
	);

	model_uart uart_ (.TX(Rx), .RX(Tx));
	
	
	initial begin
		// Initialize Inputs
		dataIn = 0;
		sendFlag = 0;
		clk = 0;
		sw = 0;
		rst = 1;
		#1000;
		rst = 0;
		
		// Wait 100 ns for global reset to finish
		#1550;
		dataIn = 80'hABCD_AAABB_CCDD_AABB_AAEE;
      sendFlag = 1;
		#10;
		sendFlag = 0;
		#1000000;
		$finish;
		// Add stimulus here

	end
    
	always #5 clk = ~clk ;
endmodule

