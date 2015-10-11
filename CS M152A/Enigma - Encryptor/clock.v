`timescale 1ns / 1ps
//add 3 0's
//replace them with wires
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:16 02/09/2015 
// Design Name: 
// Module Name:    clock 
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
module clock(
    input master_clk, //100mHz
//    input pause,
    output reg clk_1,
    output reg clk_2,
    output reg clk_5,
    output reg clk_100
    );

//100mhz -> 100,000khz -> 100,000,000hz
integer timer1;
integer timer2;
integer timer5;
integer timer100;

initial begin
timer1 = 0;
timer2 = 0;
timer5 = 0;
timer100 = 0;
clk_1 = 0;
clk_2 = 0;
clk_5 = 0;
clk_100 = 0;
end

//clk1 implementation (1hz)
always @(posedge master_clk)
begin
//    if (pause == 0) begin
        if (timer1 == 100000000/2) begin
            clk_1 <= ~clk_1;  
            timer1 <= timer1 + 1;
        end
        else begin
            if (timer1 == 100000000) begin
                clk_1 <= ~clk_1;
                timer1 <= 0;
                end
            else begin
                timer1 <= timer1 + 1;
            end
         end
//    end
end

//clk2 implementatiohn (10hz) //LED frequency
always @(posedge master_clk)
begin
//    if (pause == 0) begin
        if (timer2 == 5000000) begin
            clk_2 <= ~clk_2;  
            timer2 <= timer2 + 1;
        end
        else begin
            if (timer2 == 10000000) begin
                clk_2 <= ~clk_2;
                timer2 <= 0;
                end
            else begin
                timer2 <= timer2 + 1;
            end
         end
//    end
end

//clk10 implementatiohn (5hz) blinking
always @(posedge master_clk)
begin
//    if (pause == 0) begin
        if (timer5 == 20000000/2) begin
            clk_5 <= ~clk_5;  
            timer5 <= timer5 + 1;
        end
        else begin
            if (timer5 == 20000000) begin
                clk_5 <= ~clk_5;
                timer5 <= 0;
                end
            else begin
                timer5 <= timer5 + 1;
            end
         end
//    end
end

//clk100 implementatiohn (500hz) 7seg refresh
always @(posedge master_clk)
begin
//    if (pause == 0) begin
        if (timer100 == 200000/2) begin
            clk_100 <= ~clk_100;  
            timer100 <= timer100 + 1;
        end
        else begin
            if (timer100 == 200000) begin
                clk_100 <= ~clk_100;
                timer100 <= 0;
                end
            else begin
                timer100 <= timer100 + 1;
            end
         end
 //   end
end


endmodule
