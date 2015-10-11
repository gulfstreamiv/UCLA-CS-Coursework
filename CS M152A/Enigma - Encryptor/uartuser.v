`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:35 03/07/2015 
// Design Name: 
// Module Name:    uartuser 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module uartuser(
    );
	 
	wire i_rx;
	wire o_tx;
	wire rx_valid;
	wire[7:0] rx_data;
	wire tx_active;
	
	reg tx_valid;
	reg[7:0] tx_data;
	
	reg clk;
	reg rst;
	
	initial
		begin
	clk = 0;
	rst = 1;
	#1000;
	rst = 0;
	tx_data = 8'b0000_0000;
	tx_valid = 1;
	#10;
	tx_valid = 0;
	#100000;
	$finish;
	
	end
	
	always #5 clk = ~clk;
	
	model_uart uart_2(.RX(o_tx), .TX(i_rx) );
	
   uart uart_ (// Outputs
               .received                (rx_valid),
               .rx_byte                 (rx_data[7:0]),
               .is_receiving            (),
               .is_transmitting         (tx_active),
               .recv_error              (),
               .tx                      (o_tx),
               // Inputs
               .rx                      (i_rx),
               .transmit                (tx_valid),
               .tx_byte                 (tx_data[7:0]),
               /*AUTOINST*/
               // Inputs
               .clk                     (clk),
               .rst                     (rst));

endmodule
