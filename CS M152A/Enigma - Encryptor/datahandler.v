`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:21 03/05/2015 
// Design Name: 
// Module Name:    datahandler 
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
module datahandler(
	output[79:0] dataOut,
	output dataValid,
	output Tx,
	output[7:0] hash,
	
	input Rx,
	input[79:0] dataIn,
	input sendFlag,
	input clk,
	input[7:0] sw,
	input rst
    );
wire Tx;
wire Rx;

reg[79:0] dataOut;
reg[79:0] dataToSend;
reg[7:0] u_dataIn;
reg dataValid;

wire[7:0] o_dataOut;
wire o_dataValid;

reg sentFlag;
reg u_sendFlag = 0;
wire txFlag;
reg[3:0] dataSize=0;
reg[3:0] sendSize=0;


uart_top uart_ (.o_tx (Tx), .o_tx_busy(txFlag), .o_rx_data(o_dataOut[7:0]), .o_rx_valid(o_dataValid),
					.i_rx (Rx), .i_tx_data(dataIn[79:0]), .i_tx_stb(sendFlag), .clk(clk), .rst(rst));
					
assign hash = sw;

//receive
always @ (posedge clk) begin
	if(o_dataValid)
	begin
		if (dataSize == 9) begin
			dataSize <= 0;
			asciiConversion(o_dataOut[7:0],dataOut[7:0]);
			dataValid <= 1; end
		else begin
			dataSize <= dataSize + 1;
			dataOut = {dataOut[71:0], asciiConversion o_dataOut[7:0],dataOut[7:0])};
			dataValid <= 0;
			end
		end
	else begin
		dataValid <= 0;
	end
end

task asciiConversion;
input[7:0] byteIn;
output[7:0] byteOut;
begin
	case(byteIn):
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
end
endtask
/*
reg[3:0] state = 0;
always @ (posedge clk) begin
		if(sendFlag) begin
		   $display ("sendFlag received");
			sendSize = 0;
			dataToSend = dataIn;
			sentFlag = 0;
			state <= 0;
		end
		else if (~sentFlag & ~txFlag & state==0) begin
			if(sendSize == 9) //send last one and be done with it
			begin u_dataIn <= dataToSend[79:72];
					sendSize <= 0;
					u_sendFlag <= 1;
					sentFlag <= 1;
					state <= 1;
			end
			else begin
			u_dataIn <= dataToSend[79:72];
			dataToSend <= {dataToSend[71:0], 8'b0};
			u_sendFlag <= 1;
			sendSize = sendSize +1;
			state <= 1;
			end
		end
		else begin
			state <= state + 1;
			u_sendFlag <=0;
		end
end
*/
endmodule
