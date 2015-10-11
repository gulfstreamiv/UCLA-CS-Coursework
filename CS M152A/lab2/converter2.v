`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:22 01/26/2015 
// Design Name: 
// Module Name:    converter 
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
module converter2(
    input [11:0] D,
    output S,
    output [2:0] E,
    output [3:0] F
    );
integer i;
integer count;
integer rounding;
reg[11:0] input_copy;
reg S;
reg[2:0] E;
reg[3:0] F;

always @* begin
//first check if it's negative; if so, we flip around and add one 
if(D[11]==1) begin
    input_copy = ~D;
    input_copy = input_copy + 1;
    end
else
    begin input_copy = D; end
	 
S = D[11];	//sign bit is the first bit of the input

i = 0;
count = 0;
//counting leading zero
if(input_copy[11]==0)
begin count = 1;
        if(input_copy[10]==0)
            begin count = 2;
                if(input_copy[9]==0)
                  begin count=3;
                  if(input_copy[8]==0)
                    begin count=4;
                     if(input_copy[7]==0)
                       begin count=5;
                        if(input_copy[6]==0)
                          begin count=6;
                          if(input_copy[5]==0)
                            begin count=7;
                            if(input_copy[4]==0)
                              begin count=8;
                              end
                              end
                              end
                              end
                              end
                              end
                              end
                              end

//$display(input_copy[11:0]);
//for(i=11;input_copy[i]!=1'b0;i=i-1) 
//begin
//	count=count+1;
//end 

//setting exponent & Significand
E[2:0] = 8-count;
F = (input_copy >> (8-count));

//check rounding up or down
rounding = 12-count-4-1;
if(rounding>=0)
begin
if(input_copy[rounding]==1) 
begin
    if(F==4'b1111) //we check overflow before the addition
    begin
      if(E==3'b111) begin end
      else begin
	  E[2:0]=E[2:0]+1;
      F[3:0]=4'b1000; end
    end
    else begin
    F[3:0]=F[3:0]+1;
    end
end
end

if(D==12'b011111111111)
begin 
     E=3'b111;
      F=4'b1111;
      S=1'b0;
end
else if(D==12'b100000000000)
begin 
      E=3'b111;
      F=4'b1111;
      S=1'b1;
                 
end

end      

endmodule
