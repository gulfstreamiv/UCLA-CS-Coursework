`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:04 02/04/2015 
// Design Name: 
// Module Name:    Sec Counter 
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
module secCounter(
    input clk,
	 input ifpauseS,
	 input pauseBoth,
    input RST,
    input SEL,
    input ADJ,
    output reg [5:0] sec_state,
    output reg overflow_f
    );


initial
    begin
        sec_state <= 0;
        overflow_f <= 0;
    end


always @ (posedge clk)
begin
	if(ifpauseS==0 && pauseBoth==0) begin
		if (~ADJ) begin
			 if (RST)
			 begin
				  sec_state <= 0;
				  overflow_f <= 0;
			 end
			 else
			 begin
				  if (sec_state == 6'b111011)
				  begin sec_state <= 0;
						overflow_f <= 0;
				  end
				  else if (sec_state == 6'b111010) begin
						overflow_f <= 1;
						sec_state <= sec_state + 1;
					end
				  else begin
						overflow_f <= 0;
						sec_state <= sec_state + 1;
						end
			 end
		end
		else if(ADJ==1 && SEL==1) begin
			 if (RST)
			 begin
				  sec_state <= 0;
				  overflow_f <= 0;
			 end	
			 else begin
				  if (sec_state == 6'b111011)
				  begin 
						sec_state <= 0;
				  end
				  else begin 
						sec_state <= sec_state + 1;
					end
			 end
		 end	
	end
end

endmodule
