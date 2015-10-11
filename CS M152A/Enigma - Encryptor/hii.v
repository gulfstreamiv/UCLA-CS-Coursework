`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:02:16 03/08/2015
// Design Name:   data
// Module Name:   C:/Users/joon8_000/Desktop/School/temp2/hii.v
// Project Name:  temp2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hii;

	// Inputs
	wire RX;
	reg clk;
	reg rst;
	reg [79:0] idata;
	reg senddata;

	// Outputs
	wire [79:0] odata;
	wire datavalid;
	wire TX;

	// Instantiate the Unit Under Test (UUT)
	data uut (
		.RX(RX), 
		.clk(clk), 
		.rst(rst), 
		.idata(idata), 
		.senddata(senddata), 
		.odata(odata), 
		.datavalid(datavalid), 
		.TX(TX)
	);
   initial
     begin
        //$shm_open  ("dump", , ,1);
        //$shm_probe (tb, "ASTF");
        clk = 0;
		  rst = 1;
		  senddata = 0;
        #1000
		  rst = 0;
        #150;
        idata = 80'hFAAF_001F_FFFF_FAAF_AAAA;
		  senddata = 1;
		  #10;
		  senddata = 0;
   
        
        #200000;        
        $finish;
     end

   always #5 clk = ~clk;
   
   model_uart model_uart0_ (// Outputs
                            .TX                  (RX),
                            // Inputs
                            .RX                  (TX)
                            );

   defparam model_uart0_.name = "UART0";
   defparam model_uart0_.baud = 1000000;
   
endmodule // tb
