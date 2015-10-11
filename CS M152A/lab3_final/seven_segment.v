`timescale 1ns / 1ps
module sevenseg(
	 input btnS, btnR, sw0, sw1, msclk,  //sw0 -> SEL, sw1 -> ADJ
	output reg[7:0] seg, output reg[3:0] an);
	
	wire freq1, freq2, freq3, freq4;
	wire [5:0] secCount;
	wire [6:0] minCount;
	wire overflow;
	
	reg ifpauseS, ifpauseM; 
	wire DBrst, DBsel, DBadj, DBpauseBoth;
//	reg [5:0] SC;
//	reg [6:0] MC;
//	reg btnR = 0;
//	reg btnS = 0;
//	reg ifpauseS = 0;
//	reg ifpauseM = 0;
//	reg pauseBoth = 0;
	reg lights = 1;
	reg ifblink = 0;
	reg clk_freq = 0;
//	reg [3:0] refresh_pos;
	
	integer temp;
	integer refresh_pos = 0;
	integer tenthsec,SC,tenthmin,MC;
	
	debouncer d1(.msclk(msclk), .btn(sw0), .cleanbtn(DBsel));
	debouncer d2(.msclk(msclk), .btn(sw1), .cleanbtn(DBadj));
	debouncerBtn d3(.msclk(freq4), .btn(btnS), .cleanbtn(DBpauseBoth));
	debouncerBtn d4(.msclk(freq4), .btn(btnR), .cleanbtn(DBrst));
	
    clock clk(.master_clk(msclk), .clk_1(freq1),.clk_2(freq2),.clk_5(freq3),.clk_100(freq4));
	minCounter minute(.clk (clk_freq),.ifpauseM (ifpauseM),.ifpauseS (ifpauseS),
                        .pauseBoth (DBpauseBoth),.RST (DBrst),.SEL (DBsel),.ADJ (DBadj),
                        .sec_state (secCount), .cur_state (minCount));
                        

	always @ (posedge msclk)
	begin 
		if(!DBpauseBoth) begin
			if(DBadj) begin
				clk_freq <= freq2;
			end
			else begin
				clk_freq <= freq1;
			end
		end
	end

	always @ (posedge msclk)
	begin 
		if(!DBpauseBoth) begin
			if(DBadj) begin
				ifblink<=1; //adj mode on
				if(DBsel) begin
					ifpauseM <= 1;
					ifpauseS <= 0;
				end
				else if(!DBsel) begin
					ifpauseM <= 0;
					ifpauseS <= 1;
				end
			end
			else if(!DBadj) begin
				ifblink<=0;
				ifpauseM<=0;
				ifpauseS<=0;
//				lights <= 1;
			end
		end
	end
	
	always @ (posedge freq3) 
	begin
		if(ifblink) begin
			lights <= ~lights;
		end
		else if(ifblink==0) begin
			lights <=1;
		end
	end	
	
	always @ (posedge freq4)
	begin
		if(refresh_pos==3) begin
			refresh_pos <= 0;
		end
		else begin
			refresh_pos <= refresh_pos + 1;
		end
	end
	
	always @ (posedge msclk)
	begin
		tenthsec <= secCount/10;
		SC <= secCount%10;
		tenthmin <= minCount/10;
		MC <= minCount%10;
	end
	
	always @(posedge freq4) begin
		if(lights) begin
			case(refresh_pos)
			0: begin
				an <= 4'b0111;
				temp <= SC;
				end
			1: begin
				an <= 4'b1110;
				temp <= tenthsec;
				end
			2: begin
				an <= 4'b1101;
				temp <= MC;
				end
			3: begin
				an <= 4'b1011;
				temp <= tenthmin;
				end
			default: begin an <= 4'b1111; temp <= 0; end
			endcase
            end
		else begin an <= 4'b1111; end
			case(temp)
			0: begin seg <= 8'b11000000; end
			1: begin seg <= 8'b11111001; end
			2: begin seg <= 8'b10100100; end
			3: begin seg <= 8'b10110000; end
			4: begin seg <= 8'b10011001; end
			5: begin seg <= 8'b10010010; end
			6: begin seg <= 8'b10000010; end
			7: begin seg <= 8'b11111000; end
			8: begin seg <= 8'b10000000; end
			9: begin seg <= 8'b10010000; end
			default: begin seg <= 8'b11111111; end
			endcase
            
		
	end
endmodule
	