`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:53:47 03/03/2015 
// Design Name: 
// Module Name:    datasender 
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
module datasender(
    input rcv,
    input clk,

    output [7:0] data,
	 output datavalid
	 
	 
    );
	wire rcv;
	 wire clk;
	 
	 reg datavalid = 0;
	 reg[7:0] data;
	 
	always @ (posedge clk)
	begin
	data[7:0] = 8'h0;
	if (~datavalid) begin
		data[7:0] = 8'h40;
		datavalid = 1;
		#10;
		datavalid = 0;
		#200000;
		end
	end


endmodule
