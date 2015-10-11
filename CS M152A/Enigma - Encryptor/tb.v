`timescale 1ns / 1ps

//Sending from model_uart to uart_top is no problemo
//sending from uart_top does this weird thing where it parses the byte it takes into two hex values.
//then the first value becomes whatever and then the second values bcomes whatever.

module tb;

   reg [7:0] sw;
   reg       clk;
   reg       btnS;
   reg       btnR;
   
   integer   i;
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 RsRx;                   // From model_uart0_ of model_uart.v
   wire                 RsTx;                   // From uut_ of nexys3.v
   wire [7:0]           led;                    // From uut_ of nexys3.v
   // End of automatics
	reg [79:0] seq_tx_data;         // From seq_ of seq.v
   reg                 seq_tx_valid;           // From seq_ of seq.v
   wire [7:0]           uart_rx_data;           // From uart_top_ of uart_top.v
   wire                 uart_rx_valid;          // From uart_top_ of uart_top.v
   wire                 uart_tx_busy;           // From uart_top_ of uart_top.v
	reg rst;
   initial
     begin
        //$shm_open  ("dump", , ,1);
        //$shm_probe (tb, "ASTF");

        clk = 0;
        btnR = 1;
        btnS = 0;
		  rst = 1;
		  seq_tx_valid = 0;
        #1000 btnR = 0;
		  rst = 0;
        #150;
        seq_tx_data = 80'hFAAF_001F_FFFF_FAAF_AAAA;
		  seq_tx_valid = 1;
		  #10;
		  seq_tx_valid = 0;
   
        
        #200000;        
        $finish;
     end

   always #5 clk = ~clk;
   
   model_uart model_uart0_ (// Outputs
                            .TX                  (RsRx),
                            // Inputs
                            .RX                  (RsTx)
                            /*AUTOINST*/);

   defparam model_uart0_.name = "UART0";
   defparam model_uart0_.baud = 1000000;
   

	   uart_top uart_top_ (// Outputs
                       .o_tx            (RsTx),
                       .o_tx_busy       (uart_tx_busy),
                       .o_rx_data       (uart_rx_data[7:0]),
                       .o_rx_valid      (uart_rx_valid),
                       // Inputs
                       .i_rx            (RsRx),
                       .i_tx_data       (seq_tx_data[79:0]),
                       .i_tx_stb        (seq_tx_valid),
                       
                       // Inputs
                       .clk             (clk),
                       .rst             (rst));
endmodule // tb
// Local Variables:
// verilog-library-flags:("-y ../src/")
// End:
