`default_nettype none

module clock1(
	      input wire clk, rst,
	      input wire [2:0] BTN,
	      output wire [6:0] HEX0, HEX1, HEX2, HEX3
	      );

   
   wire 			clr, minup, secup;
   btn_in btn_in_inst(
		      .clk(clk),
		      .n_rst(n_rst),
		      .btn(BTN),
		      .btn_out({clr, minup, secup})
		      );


   
   wire 			en1hz;
   cnt1sec cnt1sec_inst(
			.clk(clk),
			.n_rst(n_rst),
			.en1hz(en1hz)
			);

   

   // sec count
   wire [2:0] 			sec_tens_place;
   wire [3:0] 			sec_ones_place;
   wire 			carry_sec;
   cnt60 cnt60_sec(
		   .clk(clk),
		   .n_rst(n_rst),
		   .CEN(en1hz),
		   .DEC(0),
		   .INC(secup),
		   .tens_place(sec_tens_place),
		   .ones_place(sec_ones_place),
		   .CA(carry_sec)
		   );


   // min count
   wire [2:0] 			min_tens_place;
   wire [3:0] 			min_ones_place;
   wire 			carry_min;
   cnt60 cnt60_min(
		   .clk(clk),
		   .n_rst(n_rst),
		   .CEN(carry_sec),
		   .DEC(0),
		   .INC(minup),
		   .tens_place(min_tens_place),
		   .ones_place(min_ones_place),
		   .CA(carry_min)
		   );


   // 7seg
   7seg_deg sec1 (.DIN(sec_ones_place), .HEX(HEX0));
   7seg_deg sec10(.DIN(sec_tens_place), .HEX(HEX1));
   7seg_deg min1 (.DIN(min_ones_place), .HEX(HEX2));
   7seg_deg min10(.DIN(min_tens_place), .HEX(HEX3));
   
   
endmodule // clock1

`default_nettype wire

