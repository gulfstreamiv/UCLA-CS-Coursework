module seconds(
    input clk,
    output reg [9:0] sec_state
    );


initial
    begin
       sec_state <= 0;
    end


always @ (posedge clk)
begin
  if (sec_state == 10'b11111_11111)
  begin sec_state <= 0;
  end
  else begin
		sec_state <= sec_state + 1;
		end		
end

endmodule