`timescale 1ns / 1ps
module hanoi(
	input btnS, btnR, btnL, sw0, sw1, sw2, sw3, sw7, msclk,  //sw0 -> SEL, sw1 -> ADJ
	output reg[7:0] seg, output reg[3:0] an);
	
	wire freq1, freq2, freq3, freq4;	
	wire DBsw0, DBsw1, DBsw2,DBsw3, DBsw7, DBbtnS, DBbtnR, DBbtnL;
	
	integer r0, r1, r2, r3;
	integer temp;
	integer refresh_pos = 0;
	
	reg lights = 1;
	reg ifblink = 0;
	reg mode = 0;
	reg [3:0] reg_0=0;
	reg [3:0] reg_1=0;
	reg [3:0] reg_2=0;
	reg [3:0] reg_3=4'b1111;
	reg [3:0] sw_arr = 0;;
	reg if_win = 0;
	reg f_left, f_right;
	reg CS, CL, CR;
	
task move_right ;
input [3:0] sw_arr, reg_0,reg_1,reg_2,reg_3;
output [3:0] r0,r1,r2,r3;

begin
	if(sw_arr == 4'b0001) begin end  //peg 0

	else if(sw_arr == 4'b0010) begin   //peg 1
		if(reg_1[0]==1) begin
			reg_0[0]=1;
			reg_1[0]=0;
		end
		else if(reg_1[1]==1) begin
			if(reg_0[0]==0) begin
				reg_0[1]=1;
				reg_1[1]=0;
			end
		end
		else if(reg_1[2]==1) begin
			if(reg_0[1:0]==2'b00) begin
				reg_0[2]=1;
				reg_1[2]=0;
			end
		end
		else if(reg_1[3]==1) begin   //only move if a valid move
			if(reg_0[2:0]==3'b000) begin
				reg_0[3]= 1;
				reg_1[3]= 1;
			end
		end
	end
	
	else if(sw_arr == 4'b0100) begin   //peg 2
		if(reg_2[0]==1) begin
			reg_1[0]=1;
			reg_2[0]=0;
		end
		else if(reg_2[1]==1) begin
			if(reg_1[0]==0) begin
				reg_1[1]=1;
				reg_2[1]=0;
			end
			else if(reg_0[0]==0) begin
				reg_0[1]=1;
				reg_2[1]=0;
			end
		end
		else if(reg_2[2]==1) begin
			if(reg_1[1:0]==2'b00) begin
				reg_1[2]=1;
				reg_2[2]=0;
			end
			else if(reg_0[1:0]==2'b00) begin
				reg_0[2]=1;
				reg_2[2]=0;
			end
		end
		else if(reg_2[3]==1) begin   
			if(reg_1[2:0]==3'b000) begin
				reg_1[3]= 1;
				reg_2[3]= 0;
			end
			else if(reg_0[2:0]==3'b000) begin
				reg_0[3]= 1;
				reg_2[3]= 0;
			end
		end
	end
	
	else if(sw_arr == 4'b1000 && !mode) begin   //peg 3
		if(reg_3[0]==1) begin
			reg_2[0]=1;
			reg_3[0]=0;
		end
		else if(reg_3[1]==1) begin
			if(reg_2[0]==0) begin
				reg_2[1]=1;
				reg_3[1]=0;
			end
			else if(reg_1[0]==0) begin
				reg_1[1]=1;
				reg_3[1]=0;
			end
			else if(reg_0[0]==0) begin
				reg_0[1]=1;
				reg_3[1]=0;
			end
		end
		else if(reg_3[2]==1) begin
			if(reg_2[1:0]==2'b00) begin
				reg_2[2]=1;
				reg_3[2]=0;
			end
			else if(reg_1[1:0]==2'b00) begin
				reg_1[2]=1;
				reg_3[2]=0;
			end
			else if(reg_0[1:0]==2'b00) begin
				reg_0[2]=1;
				reg_3[2]=0;
			end
		end
		else if(reg_3[3]==1) begin   //only move if a valid move
			if(reg_2[2:0]==3'b000) begin
				reg_2[3]= 1;
				reg_3[3]= 0;
			end
			else if(reg_1[2:0]==3'b000) begin
				reg_1[3]= 1;
				reg_3[3]= 0;
			end
			else if(reg_0[2:0]==3'b000) begin
				reg_0[3]= 1;
				reg_3[3]= 0;
			end
		end
	end
r0 = reg_0;
r1 = reg_1;
r2 = reg_2;
r3 = reg_3;
end
endtask

task move_left;
input [3:0] sw_arr;
output [3:0] reg_0,reg_1,reg_2,reg_3;

begin
	if(sw_arr == 4'b0001) begin  //peg 0
		if(reg_0[0]==1) begin
			reg_1[0]=1;
			reg_0[0]=0;
		end
		else if(reg_0[1]==1) begin
			if(reg_1[0]==0) begin
				reg_1[1]=1;
				reg_0[1]=0;
			end
			else if(reg_2[0]==0) begin
				reg_2[1]=1;
				reg_0[1]=0;
			end
			else if(reg_3[0]==0 && !mode) begin
				reg_3[1]=1;
				reg_0[1]=0;
			end
		end
		else if(reg_0[2]==1) begin
			if(reg_1[1:0]==2'b00) begin
				reg_1[2]=1;
				reg_0[2]=0;
			end
			else if(reg_2[1:0]==2'b00) begin
				reg_2[2]=1;
				reg_0[2]=0;
			end
			else if(reg_3[1:0]==2'b00 && !mode) begin
				reg_3[2]=1;
				reg_0[2]=0;
			end
		end
		else if(reg_0[3]==1) begin   //only move if a valid move
			if(reg_1[2:0]==3'b000) begin
				reg_1[3]= 1;
				reg_0[3]= 0;
			end
			else if(reg_2[2:0]==3'b000) begin
				reg_2[3]= 1;
				reg_0[3]= 0;
			end
			else if(reg_3[2:0]==3'b000 && !mode) begin
				reg_3[3]= 1;
				reg_0[3]= 0;
			end
		end
	end
	
	else if(sw_arr == 4'b0010) begin   //peg 1
		if(reg_1[0]==1) begin
			reg_2[0]=1;
			reg_1[0]=0;
		end
		else if(reg_1[1]==1) begin
			if(reg_2[1]==0) begin
				reg_2[1]=1;
				reg_1[1]=0;
			end
			else if(reg_3[1]==0 && !mode) begin
				reg_3[1]=1;
				reg_1[1]=0;
			end
		end
		else if(reg_1[2]==1) begin
			if(reg_2[1:0]==2'b00) begin
				reg_2[2]=1;
				reg_1[2]=0;
			end
			else if(reg_3[1:0]==2'b00 && !mode) begin
				reg_3[2]=1;
				reg_1[2]=0;
			end
		end
		else if(reg_1[3]==1) begin   //only move if a valid move
			if(reg_2[2:0]==3'b000) begin
				reg_2[3]= 1;
				reg_1[3]= 1;
			end
			else if(reg_3[2:0]==3'b000 && !mode) begin
				reg_3[3]= 1;
				reg_1[3]= 1;
			end
		end
	end
	
	else if(sw_arr == 4'b0100) begin   //peg 2
		if(reg_2[0]==1) begin
			reg_3[0]=1;
			reg_2[0]=0;
		end
		else if(reg_2[1]==1) begin
			if(reg_3[1]==0 && !mode) begin
				reg_3[1]=1;
				reg_2[1]=0;
			end
		end
		else if(reg_2[2]==1) begin
			if(reg_3[1:0]==2'b00 && !mode) begin
				reg_3[2]=1;
				reg_2[2]=0;
			end
		end
		else if(reg_2[3]==1) begin   //only move if a valid move
			if(reg_3[2:0]==3'b000 && !mode) begin
				reg_3[3]= 1;
				reg_2[3]= 0;
			end
		end
	end
	
	else if(sw_arr == 1000) begin end  //peg 3
 end
 endtask
 
task reset;
input DBsw7;
output [3:0] reg_0, reg_1, reg_2, reg_3;
output mode, if_win, ifblink;

begin
	if(!DBsw7) begin
		reg_0 = 0;
		reg_1 = 0;
		reg_2 = 0;
		reg_3 = 4'b1111;
		mode = 0;
		if_win = 0;
		ifblink = 0;
	end
	else begin 
		reg_0 = 0;
		reg_1 = 0;
		reg_2 = 4'b1111;
		reg_3 = 0;
		mode = 1;
		if_win = 0;
		ifblink = 0;
	end
end
endtask
	
	clock clk(.master_clk(msclk), .clk_1(freq1),.clk_2(freq2),.clk_5(freq3),.clk_100(freq4));	
	debouncer d1(.msclk(msclk), .btn(sw0), .cleanbtn(DBsw0));
	debouncer d2(.msclk(msclk), .btn(sw1), .cleanbtn(DBsw1));
	debouncer d3(.msclk(msclk), .btn(sw2), .cleanbtn(DBsw2));
	debouncer d4(.msclk(msclk), .btn(sw3), .cleanbtn(DBsw3));
	debouncer d0(.msclk(msclk), .btn(sw7), .cleanbtn(DBsw7));
	debouncerBtn d5(.msclk(freq4), .btn(btnS), .cleanbtn(DBbtnS));
	debouncerBtn d6(.msclk(freq4), .btn(btnR), .cleanbtn(DBbtnR));
	debouncerBtn d7(.msclk(freq4), .btn(btnL), .cleanbtn(DBbtnL));
	
	always @ (posedge msclk) begin
		sw_arr <= {DBsw3,DBsw2,DBsw1,DBsw0};
	end
	
	always @ (posedge msclk) begin
		if(reg_0==1111) begin
			if_win <= 1;
			ifblink <= 1;
		end
	end
/*	
	always @ (posedge DBbtnS or negedge DBbtnS) begin //reset
		if(!DBsw7) begin
			reg_0 <= 0;
			reg_1 <= 0;
			reg_2 <= 0;
			reg_3 <= 4'b1111;
			mode <= 0;
			if_win <= 0;
			ifblink <= 0;
		end
		else begin 
			reg_0 <= 0;
			reg_1 <= 0;
			reg_2 <= 4'b1111;
			reg_3 <= 0;
			mode <= 1;
			if_win <= 0;
			ifblink <= 0;
		end
	end
*/	

always @ (posedge freq3) 
begin
	if(ifblink) begin
		lights <= ~lights;
	end
	else if(ifblink==0) begin
		lights <=1;
	end
end

always @ (msclk) begin   //move a plate to right
 if(CR!=DBbtnR) begin
	move_right(sw_arr, reg_0,reg_1,reg_2,reg_3, reg_0,reg_1,reg_2,reg_3);
 end

 if(CL!=DBbtnL) begin //move a plate to left
	move_left(sw_arr, reg_0,reg_1,reg_2,reg_3);
 end

 if(CS!= DBbtnS) begin
	reset(DBsw7,reg_0,reg_1,reg_2,reg_3,mode,if_win,ifblink);
 end
 CR <= DBbtnR;
 CL <= DBbtnL;
 CS <= DBbtnS;
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
	
always @ (posedge msclk) begin
	r0 <= reg_0/1;
	r1 <= reg_1/1;
	r2 <= reg_2/1;
	r3 <= reg_3/1;
end

always @(posedge freq4) begin
		if(lights && !if_win) begin
			case(refresh_pos)
			0: begin
				an <= 4'b0111;
				temp <= r0;
				end
			1: begin
				an <= 4'b1110;
				temp <= r1;
				end
			2: begin
				an <= 4'b1101;
				temp <= r2;
				end
			3: begin
				an <= 4'b1011;
				temp <= r3;
				end
			default: begin an <= 4'b1111; temp <= 0; end
			endcase
        end
		else if(lights && if_win) begin
			case(refresh_pos)
			0: begin
				an <= 4'b0111;
				temp <= 96;
				end
			1: begin
				an <= 4'b1110;
				temp <= 97;
				end
			2: begin
				an <= 4'b1101;
				temp <= 98;
				end
			3: begin
				an <= 4'b1011;
				temp <= 99;
				end
			default: begin an <= 4'b1111; temp <= 0; end
			endcase
        end
			
			case(temp)
			0: begin seg <= 8'b11111111; end
			1: begin seg <= 8'b11111110; end
			2: begin seg <= 8'b10111111; end
			3: begin seg <= 8'b10111110; end
			4: begin seg <= 8'b11110111; end
			5: begin seg <= 8'b11110110; end
			6: begin seg <= 8'b10110111; end
			7: begin seg <= 8'b10110110; end
			8: begin seg <= 8'b01111111; end
			9: begin seg <= 8'b01111110; end
			10:begin seg <= 8'b00111111; end
			11:begin seg <= 8'b00111110; end
			12:begin seg <= 8'b01110111; end
			13:begin seg <= 8'b01110110; end
			14:begin seg <= 8'b00110111; end
			15:begin seg <= 8'b00110110; end
			96:begin seg <= 8'b10001001; end
			97:begin seg <= 8'b10001000; end
			98:begin seg <= 8'b10000110; end
			99:begin seg <= 8'b10010001; end
			default: begin seg <= 8'b11111111; end
			endcase
            
		
end
endmodule