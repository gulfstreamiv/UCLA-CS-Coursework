`timescale 1ns / 1ps
module debouncer (
    input msclk,
    input btn,
    output wire cleanbtn
    );

reg ff1d = 0, ff1q = 0;
reg[15:0] timer = 0; 
reg[19:0] container = 20'b01010101010101010101;
reg flag = 0;

assign cleanbtn = flag ? 1 : 0; 

always @(posedge msclk) begin

		if(ff1d!=btn) begin
			timer <= 0;
		end
		ff1d <= btn;
		if(timer==16'b1111111111111111) begin 
			timer<=10'b0000000000;
			if(container==20'b00000000000000000000) begin
				flag <= 0;
			end
			else if(container==20'b11111111111111111111) begin
				flag <= 1;
			end
		end
        timer <= timer + 1;
      end

	
always @ (posedge msclk)
begin
	ff1q <= ff1d;
	container <= {container[18:0],ff1q};
end	
 
endmodule
