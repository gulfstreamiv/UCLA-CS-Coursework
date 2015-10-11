`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:07 02/04/2015 
// Design Name: 
// Module Name:    minCounter 
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
module minCounter(
    input clk,
	 input ifpauseM,
	 input ifpauseS,
	 input pauseBoth,
    input RST,
    input SEL,
    input ADJ,
    output [5:0] sec_state,
    output reg [6:0] cur_state
    );
	
wire overflow_f;
initial begin
cur_state = 0;
end


always @ (posedge clk)
begin
	//$display("check check"); 
	if(~ifpauseM && ~pauseBoth) begin
	//	$display("we are here"); 
		if (RST) begin
			cur_state <= 0;
		end
		else begin
	//		$display("we are here"); 
			if(~ADJ) begin
				 if (overflow_f)
				 begin
					  if(cur_state == 7'b1100011) begin
							cur_state <= 0;
					  end
					  else begin
							cur_state <= cur_state + 1;
							//$display("!!!!!!!!!!!!");
					  end
				 end
			end
		//	$display("we are here"); 
			else if(ADJ && ~SEL)
			begin
					//$display("we are here");
					if(cur_state == 7'b1100011) begin
						cur_state <= 0;
					end
					else begin
						cur_state <= cur_state + 1;
						//	$display("we are here");
					end
			end
		end
	end
end

secCounter secCounter_ (//inputs
                        .clk (clk),
								.ifpauseS(ifpauseS),
								.pauseBoth(pauseBoth),
                        .RST (RST),
                        .SEL (SEL),
                        .ADJ (ADJ),
                        //outputs
                        .sec_state (sec_state),
                        .overflow_f (overflow_f));
                        

endmodule
