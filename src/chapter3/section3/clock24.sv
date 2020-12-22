`default_nettype none

module clock24(
	      input wire 	clk, rst,
	      input wire [2:0] 	BTN,
	      output wire [6:0] HEX0, HEX1, HEX2, HEX3
	      );
   

   wire 			MODE, SELECT, ADJUST;
   btn_in btn_in_inst(
		      .clk(clk),
		      .n_rst(n_rst),
		      .btn(BTN),
		      .btn_out({mode, select, adjust})
		      );
   
   
   
   wire 			en1hz;
   wire 			sig2hz;
   cnt1sec cnt1sec_inst(
			.clk(clk),
			.n_rst(n_rst),
			.en1hz(en1hz),
			.sig2hz(sig2hz)
			);
   

   // state machine
   wire 			SECINC, MININC, HOURINC;
   state state_inst(
		    .clk(clk),
		    .n_rst(n_rst),
		    .sig2hz(sig2hz),
		    .MODE(MODE),
		    .SELECT(SELECT),
		    .ADJUST(ADJUST),
		    .SECINC(SECINC),
		    .MININC(MININC),
		    .HOURINC(HOURINC),
		    .SECON(SECON),
		    .MINON(MINON),
		    .HOURON(HOURON)
		    );
      
   
   // sec count
   wire [2:0] 			sec_tens_place;
   wire [3:0] 			sec_ones_place;
   wire 			CA_sec;
   cnt60 cnt60_sec(
		   .clk(clk),
		   .n_rst(n_rst),
		   .CEN(en1hz),
		   .INC(SECINC),
		   .tens_place(sec_tens_place),
		   .ones_place(sec_ones_place),
		   .CA(CA_sec)
		   );


   // min count
   wire [2:0] 			min_tens_place;
   wire [3:0] 			min_ones_place;
   wire 			CA_min;
   cnt60 cnt60_min(
		   .clk(clk),
		   .n_rst(n_rst),
		   .CEN(CA_sec),
		   .INC(MININC),
		   .tens_place(min_tens_place),
		   .ones_place(min_ones_place),
		   .CA(CA_min)
		   );



   // hour count
   wire [1:0] 			hour_tens_place;
   wire [3:0] 			hour_ones_place;
   cnt24 cnt24_hour(
		    .clk(clk),
		    .n_rst(n_rst),
		    .CEN(CA_min),
		    .INC(HOURINC),
		    .tens_place(hour_tens_place),
		    .ones_place(hour_ones_place)
		    );

   

   // 7seg
   7seg_deg sec1  (.DIN(sec_ones_place),  .EN(SECON),  .HEX(HEX0));
   7seg_deg sec10 (.DIN(sec_tens_place),  .EN(SECON),  .HEX(HEX1));
   7seg_deg min1  (.DIN(min_ones_place),  .EN(MINON),  .HEX(HEX2));
   7seg_deg min10 (.DIN(min_tens_place),  .EN(MINON),  .HEX(HEX3));
   7seg_deg hour1 (.DIN(hour_ones_place), .EN(HOURON), .HEX(HEX4));
   7seg_deg hour10(.DIN(hour_tens_place), .EN(HOURON), .HEX(HEX5));

   
endmodule // clock24

`default_nettype wire

