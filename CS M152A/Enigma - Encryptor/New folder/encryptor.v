`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:50 03/08/2015 
// Design Name: 
// Module Name:    encryptor 
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
module encryptor(
	input[7:0] sw,
	input BtnR,
	input BtnS,
	input clk,
	input RX,
	
	output TX,
	output[3:0] an,
	output[7:0] seg,
	output[7:0] Led 
    );
	 
wire RX;
wire TX;
wire clk;
wire BtnS;
wire BtnR;
wire[7:0] sw;
wire[3:0] an;
wire[7:0] seg;
wire[7:0] Led;
//data_handler 
wire senddata;
wire[79:0] idata;
wire[79:0] odata;
wire datavalid;

reg[79:0] code_in;
	
always @ (posedge clk) begin
	if (datavalid) begin
		code_in <= odata;
	end
end	

initial begin
rst = 1;
#1000;
rst = 0;
end

processer processer( .btnS(btnS), .btnR(btnR), .sw0(sw[0:0]), .sw1(sw[1:1]), .sw2(sw[2:2]), .sw3(sw[3:3]),
							.sw4(sw[4:4]), .sw5(sw[5:5]), .sw6(sw[6:6]), .sw7(sw[7:7]), .msclk(clk), .code_in(code_in[79:0]),
							.seg(seg[7:0]), .an(an[7:0]), .Led(Led[7:0]), .code_out(idata[79:0]), .flag(senddata) );

data data_handler(
		.RX(RX), 
		.clk(clk), 
		.rst(rst), 
		.idata(idata), 
		.senddata(senddata), 
		.odata(odata), 
		.datavalid(datavalid), 
		.TX(TX)
	);

endmodule
