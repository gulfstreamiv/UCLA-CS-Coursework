`timescale 1ns / 1ps
module debouncerBtn (
    input msclk,
    input btn,
    output wire cleanbtn
    );

reg ff1d = 0, ff1q = 0;
//reg[15:0] timer = 0; 
reg[9:0] container = 10'b01010_10101;
reg flag = 0;
reg container_full = 0;

assign cleanbtn = flag ? 1 : 0; 

always @(posedge msclk) begin
        container <= {container[8:0],btn};
   //     ff1q <= ff1d;
//		ff1d = btn;
		//if(timer==16'b1111_1111_1111_1111) begin 
			//timer <=10'b0000000000;
			if(container==10'b1111_1111_11 && container_full==0) begin
				flag <= ~flag;
				container_full <= 1;
			end
            if (container!=10'b1111_1111_11 && container_full ==1) begin
                container_full <= 0;
             end
	//	end
	//	timer <= timer + 1;
end
	
    /*
always @ (posedge msclk)
begin
	
end	
 */
endmodule
