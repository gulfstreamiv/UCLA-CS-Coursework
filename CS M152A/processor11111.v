module processer(
	 input btnS, btnR, sw0, sw1, sw2, sw3, sw4, sw5, sw6, sw7, msclk, input [79:0] code_in, 
	output reg[7:0] seg, output reg[3:0] an, output reg [7:0] Led, output reg [79:0] code_out, output reg flag); 
	
	wire freq1, freq2, freq3, freq4;
	wire DBsw0,DBsw1,DBsw2,DBsw3,DBsw4,DBsw5,DBsw6,DBsw7, DBbtnS,DBbtnR;
	wire [9:0] timer;
	
	reg [79:0] arr[9:0];
	reg [7:0] arr_hn [9:0];
	reg [7:0] hash_num = 0;
	reg checkbtnS = 0; 
	reg checkbtnR = 0;
	reg lights = 1;
	reg leds = 0;
	reg ifblink = 0;
	reg op_success = 0;
	reg warning = 0;
//	integer flag = 0;	
	
	integer ele_num = 0;
	integer counter = 0;
	integer k = 0;
	integer trial_limit=0; 
	integer freeze = 0;
	integer cc = 0;
	integer led_pos = 0;

	integer temp = 0;
	integer refresh_pos = 0;
	integer tenthsec,SC,tenthmin,MC;
	
	reg if_snap = 0;
	reg if_snap2 = 0;
	reg if_snap3 = 0;
	integer snap, snap2,snap3,snap4,snap5,snap6;
	
	initial
	begin
		flag = 0;
		Led = 8'b11111111;
		code_out = 80'b00111100010101110100010101001100010000110100111101001101010001010011110000111011;
		for (k = 0; k < 10; k = k + 1)
		begin
			arr[k] = 0;
			arr_hn[k] = 0;
		end
	end
	
	clock clk(.master_clk(msclk), .clk_1(freq1),.clk_2(freq2),.clk_5(freq3),.clk_100(freq4));
	seconds sec(.clk(freq1), .sec_state(timer));
	debouncer d1(.msclk(msclk), .btn(sw0), .cleanbtn(DBsw0));
	debouncer d2(.msclk(msclk), .btn(sw1), .cleanbtn(DBsw1));
	debouncer d3(.msclk(msclk), .btn(sw2), .cleanbtn(DBsw2));
	debouncer d4(.msclk(msclk), .btn(sw3), .cleanbtn(DBsw3));
	debouncer d5(.msclk(msclk), .btn(sw4), .cleanbtn(DBsw4));
	debouncer d6(.msclk(msclk), .btn(sw5), .cleanbtn(DBsw5));
	debouncer d7(.msclk(msclk), .btn(sw6), .cleanbtn(DBsw6));
	debouncer d8(.msclk(msclk), .btn(sw7), .cleanbtn(DBsw7));
	debouncerBtn d9(.msclk(freq4), .btn(btnS), .cleanbtn(DBbtnS));
	debouncerBtn d10(.msclk(freq4), .btn(btnR), .cleanbtn(DBbtnR));
	
	task encrypt;
		input [7:0] hash_num; 
		input [79:0]code_in;
		output [79:0] hash;
		reg [7:0] container, container2;
		integer i, curr, enc_val, prev, ran;
				
		begin
		hash = 0;
		i=0;
		curr=0;
		prev=5;
		container=0;
		container2=0;
		for(i = 79; i>=0; i=i-8) begin
			if(code_in[i]!=0||code_in[i-1]!=0||code_in[i-2]!=0||code_in[i-3]!=0
			||code_in[i-4]!=0||code_in[i-5]!=0||code_in[i-6]!=0||code_in[i-7]!=0) begin
			
				container2[7] = code_in[i];
				container2[6] = code_in[i-1];
				container2[5] = code_in[i-2];
				container2[4] = code_in[i-3];
				container2[3] = code_in[i-4];
				container2[2] = code_in[i-5];
				container2[1] = code_in[i-6];
				container2[0] = code_in[i-7];
				curr = container2;
				enc_val = prev+hash_num+curr;
				if (enc_val>63) begin
					ran = enc_val/64;
					enc_val = enc_val - (64*ran);
				end
				container = enc_val;
				hash[i] = container[7];
				hash[i-1] = container[6];
				hash[i-2] = container[5];
				hash[i-3] = container[4];
				hash[i-4] = container[3];
				hash[i-5] = container[2];
				hash[i-6] = container[1];
				hash[i-7] = container[0];
				prev = curr;
			end	
		end
//		$display("%b",hash);
		end
	endtask


	task decryption;
	input [7:0] hash_num;
	input [79:0] code_in;
	output [79:0] decrypt;

	reg [7:0]	container;
	reg [7:0]	container2;

	integer	decode_val, prev, i, code_seg, if_done, ran;

	begin
		i =0;
		decode_val = 0;
		prev = 5;
		code_seg = 0;
		if_done=0;
		container = 0;
		container2 = 0;

		for(i = 79; i>=0; i=i-8) begin
			if(code_in[i]!=0||code_in[i-1]!=0||code_in[i-2]!=0||code_in[i-3]!=0
			||code_in[i-4]!=0||code_in[i-5]!=0||code_in[i-6]!=0||code_in[i-7]!=0) begin
		
				container2[7] = code_in[i];
				container2[6] = code_in[i-1];
				container2[5] = code_in[i-2];
				container2[4] = code_in[i-3];
				container2[3] = code_in[i-4];
				container2[2] = code_in[i-5];
				container2[1] = code_in[i-6];
				container2[0] = code_in[i-7];
				code_seg = container2;
				decode_val = code_seg-prev-hash_num;
				if(decode_val<0) begin
					ran = 0 - decode_val;
					ran = (ran/64)+1;
					decode_val = decode_val + (64*ran);
				end
				container = decode_val;
				decrypt[i] = container[7];
				decrypt[i-1] = container[6];
				decrypt[i-2] = container[5];
				decrypt[i-3] = container[4];
				decrypt[i-4] = container[3];
				decrypt[i-5] = container[2];
				decrypt[i-6] = container[1];
				decrypt[i-7] = container[0];
				prev = decode_val;
			end
		end
//	$display("%b",decrypt);
	end
	endtask


	always @ (posedge msclk) begin
		hash_num <= {DBsw7,DBsw6,DBsw5,DBsw4,DBsw3,DBsw2,DBsw1,DBsw0};
	end

	always @ (posedge msclk) begin
		if(trial_limit>=3) begin
			freeze <= 1;
			ifblink <= 1;
			flag <= 0;
		end
	end
	
	always @ (posedge msclk) begin
		if(!freeze) begin
			if(flag) begin flag <= 0; end
			else begin
				if(checkbtnS!=DBbtnS) begin
					encrypt(hash_num, code_in, code_out);
					arr[counter] <= code_out;
					arr_hn[counter] <= hash_num;
					counter <= counter+1;
					leds <= 1;
					op_success <= 1;
					flag <= 1;
				end 
			
				else if(checkbtnR!=DBbtnR) begin
					if(arr[0]==code_in && arr_hn[0]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else if(arr[1]==code_in && arr_hn[1]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else if(arr[2]==code_in && arr_hn[2]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else if(arr[3]==code_in && arr_hn[3]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else if(arr[4]==code_in && arr_hn[4]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else if(arr[5]==code_in && arr_hn[5]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else if(arr[6]==code_in && arr_hn[6]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else if(arr[7]==code_in && arr_hn[7]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else if(arr[8]==code_in && arr_hn[8]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else if(arr[9]==code_in && arr_hn[9]==hash_num) begin
						decryption(hash_num, code_in, code_out);
						leds <= 1;
						trial_limit <= 0;
						flag <= 1;
						op_success <= 1;
					end
					else begin
						trial_limit <= trial_limit + 1;
						warning <= 1;
						code_out <= 0;
						flag <= 0;
					end
				end
			end
		end
		checkbtnR <= DBbtnR;
		checkbtnS <= DBbtnS;
		
		//setting LED 3 seconds
		if(leds) begin
			if(leds && !if_snap) begin
				snap <= timer;
				if_snap <= 1;
			end
			snap2 <= timer;
			if((snap2-snap)>=3) begin
				leds <= 0;
				if_snap <= 0;
				snap <= 0;
				snap2 <= 0;
			end
		end
		//setting seven display 3 seconds for sucessful operation
		if(op_success && !leds) begin
			if(!leds && !if_snap2 && op_success) begin
				snap3 <= timer;
				if_snap2 <= 1;
			end
			snap4 <= timer;
			if((snap4-snap3)>=3) begin
				op_success <= 0;
				if_snap2 <= 0;
				snap3 <= 0;
				snap4 <= 0;
			end
		end
		//setting seven display 3 seconds for warning
		if(warning && !leds) begin
			if(!leds && !if_snap3 && warning) begin
				snap5 <= timer;
				if_snap3 <= 1;
			end
			snap6 <= timer;
			if((snap6-snap5)>=3) begin
				warning <= 0;
				if_snap3 <= 0;
				snap5 <= 0;
				snap6 <= 0;
			end
		end
	end

//Seven segment & LED
	always @ (posedge freq3) 
	begin
		if(ifblink) begin
			lights <= ~lights;
		end
		else if(ifblink==0) begin
			lights <=1;
		end
	end
	
	always @ (posedge freq2)
	begin
		if(led_pos==7) begin
			led_pos <= 0;
		end
		else begin
			led_pos <= led_pos + 1;
		end
	end
	
	always @ (posedge freq2) begin
		if(leds) begin
			case(led_pos)
			0: begin
				Led <= 8'b01111111;
				end
			1: begin
				Led <= 8'b11111110;
				end
			2: begin
				Led <= 8'b11111101;
				end
			3: begin
				Led <= 8'b11111011;
				end
			4: begin
				Led <= 8'b11110111;
				end
			5: begin
				Led <= 8'b11101111;
				end
			6: begin
				Led <= 8'b11011111;
				end
			7: begin
				Led <= 8'b10111111;
				end
			default: begin Led <= 8'b11111111; end
			endcase
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
		if(freeze) begin
			tenthsec <= 0;
			SC <= 0;
			tenthmin <= 0;
			MC <= 0;
		end
		else if(op_success) begin
			tenthsec <= (hash_num%100)/10;
			SC <= hash_num%10;
			tenthmin <= 0;
			MC <= hash_num/100;	
		end
		else if(warning) begin
			tenthsec <= 0;
			SC <= 3-trial_limit;
			tenthmin <= 0;
			MC <= 0;	
		end			
	end
	
	always @(posedge freq4) begin
		if(lights && (op_success || warning || freeze) && !leds) begin
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
		else begin an <= 4'b1111; temp <= 99; end

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
	