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
module converter(
    input [11:0] D,
    output S,
    output [2:0] E,
    output [3:0] F
    );
integer i = 0;
integer ifAddOne;
reg[11:0] input_copy;
reg S;
reg E;
reg F;

if(D[11]==1) begin
    input_copy = ~D;
    input_copy = input_copy + 1;
    end
else
    input_copy = D;

S = D[11];
if(D[11]==0)
    begin i = 1; 
     if(D[10]==0)
       begin i = 2; 
       if(D[9]==0)
        begin i=3; 
          if(D[8]==0)
            begin i=4;
            if(D[7]==0)
              begin i=5;
             if(D[6]==0)
              begin i=6;
               if(D[5]==0)
                 begin i=7;
                if(D[4]==0)
                  begin i=8;
                  end
                 end 
              end
            end
         end
      end
   end
E = 8-i;
ifAddOne = 11 - 4 - i;
F = (D >> (8-i));
if(D[ifAddOne]==1) begin
    if(F[3:0]==4'b1111)
        begin E = E + 1;
              F[3:0] = 4'b0111;
        end
    F = F + 1;
end
                 


    

endmodule
