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
	input wire RX,
	input clk,
	input rst,
	input [79:0] idata,
	input senddata,
	
	output reg [79:0] odata,
	output reg datavalid,
	output wire TX
    );

 wire[7:0] byteOut;
 wire tx_busy;
 wire tx_datavalid;
 //wire TX;
 //wire RX;
 
// reg datavalid;
// reg[79:0] odata;
 reg[4:0] count = 0;
 //receive
 
// always @ (posedge clk) begin
// if (datavalid) datavalid = 0;
// end
 
 reg[7:0] byteTemp;
 always @ (posedge clk) begin
            if (tx_datavalid) begin
            asciiConversion(byteOut[7:0], byteTemp[7:0]);
			odata <= {odata[71:0], byteTemp[7:0]};
			end
			//or if the byte you got was end of the line byte?
	end
 
 
task asciiConversion;
input[7:0] byteIn;
output[7:0] byteOut;
begin
	case(byteIn)
		48: byteOut = 8'h0;
		49: byteOut = 8'h1;
		50: byteOut = 8'h2;
		51: byteOut = 8'h3;
		52: byteOut = 8'h4;
		53: byteOut = 8'h5;
		54: byteOut = 8'h6;
		55: byteOut = 8'h7;
		56: byteOut = 8'h8;
		57: byteOut = 8'h9;

		65: byteOut = 8'hA;
		66: byteOut = 8'hB;
		67: byteOut = 8'hC;
		68: byteOut = 8'hD;
		69: byteOut = 8'hE;
		70: byteOut = 8'hF;
		71: byteOut = 8'h10;
		72: byteOut = 8'h11;
		73: byteOut = 8'h12;
		74: byteOut = 8'h13;
		75: byteOut = 8'h14;
		76: byteOut = 8'h15;
		77: byteOut = 8'h16;
		78: byteOut = 8'h17;
		79: byteOut = 8'h18;
		80: byteOut = 8'h19;
		81: byteOut = 8'h1A;
		82: byteOut = 8'h1B;
		83: byteOut = 8'h1C;
		84: byteOut = 8'h1D;
		85: byteOut = 8'h1E;
		86: byteOut = 8'h1F;
		87: byteOut = 8'h20;
		88: byteOut = 8'h21;
		89: byteOut = 8'h22;
		90: byteOut = 8'h23;

		97: byteOut = 8'h24;
		98: byteOut = 8'h25;
		99: byteOut = 8'h26;
		100: byteOut = 8'h27;
		101: byteOut = 8'h28;
		102: byteOut = 8'h29;
		103: byteOut = 8'h2A;
		104: byteOut = 8'h2B;
		105: byteOut = 8'h2C;
		106: byteOut = 8'h2D;
		107: byteOut = 8'h2E;
		108: byteOut = 8'h2F;
		109: byteOut = 8'h30;
		110: byteOut = 8'h31;
		111: byteOut = 8'h32;
		112: byteOut = 8'h33;
		113: byteOut = 8'h34;
		114: byteOut = 8'h35;
		115: byteOut = 8'h36;
		116: byteOut = 8'h37;
		117: byteOut = 8'h38;
		118: byteOut = 8'h39;
		119: byteOut = 8'h3A;
		120: byteOut = 8'h3B;
		121: byteOut = 8'h3C;
		122: byteOut = 8'h3D;

		63: byteOut = 8'h3E;
		33: byteOut = 8'h3F;
        default : byteOut = 8'h40;
        endcase
end
endtask
 
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
