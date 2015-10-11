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
	input wire sw0, sw1, sw2, sw3, sw4, sw5, sw6, sw7,
	input wire btnR,
	input wire btnS,
	input wire msclk,
	input wire RX,
	
	output wire TX,
	output wire [3:0] an,
	output wire [7:0] seg,
	output wire [7:0] Led 
    );
	 

//data_handler 
wire senddata;
wire[79:0] idata;
wire[79:0] odata;
wire datavalid;
reg rst;

reg[79:0] code_in;
	
always @ (posedge msclk) begin
	if (datavalid) begin
		code_in <= odata;
	end
end	

initial begin
rst = 1;
#1000;
rst = 0;
end

processer processer( .btnS(btnS), .btnR(btnR), .sw0(sw0), .sw1(sw1), .sw2(sw2), .sw3(sw3),
							.sw4(sw4), .sw5(sw5), .sw6(sw6), .sw7(sw7), .msclk(msclk), .code_in(odata[79:0]),
							.seg(seg[7:0]), .an(an[3:0]), .Led(Led[7:0]), .code_out(idata[79:0]), .flag(senddata) );

data data_handler(
		.RX(RX), 
		.clk(msclk), 
		.rst(rst), 
		.idata(idata), 
		.senddata(senddata), 
		.odata(odata), 
		.datavalid(datavalid), 
		.TX(TX)
	);

endmodule
