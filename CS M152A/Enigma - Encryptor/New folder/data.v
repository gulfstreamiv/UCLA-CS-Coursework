`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:56 03/08/2015 
// Design Name: 
// Module Name:    data 
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
module data(
	input RX,
	input clk,
	input rst,
	input[79:0] idata,
	input senddata,
	
	output[79:0] odata,
	output datavalid,
	output TX
    );

 wire[7:0] byteOut;
 wire tx_busy;
 wire tx_datavalid;
 wire TX;
 wire RX;
 
 reg datavalid;
 reg[79:0] odata;
 reg[4:0] count = 0;
 //receive
 always @ (posedge clk) begin
 if (datavalid) datavalid = 0;
 end
 
 always @ (posedge clk) begin
 if (tx_datavalid) begin
		odata = {odata[71:0], byteOut[7:0]};
		count = count + 1;
		if(count == 10)
		begin count = 0;
		datavalid = 1;
		end;
		//or if the byte you got was end of the line byte?
	end
 end
 
 uart_top uart_top_ (// Outputs
                       .o_tx            (TX),
                       .o_tx_busy       (tx_busy),
                       .o_rx_data       (byteOut[7:0]),
                       .o_rx_valid      (tx_datavalid),
                       // Inputs
                       .i_rx            (RX),
                       .i_tx_data       (idata[79:0]),
                       .i_tx_stb        (senddata),
                       
                       // Inputs
                       .clk             (clk),
                       .rst             (rst));


endmodule
