`default_nettype none

module clock1(
	      input wire 	clk, n_rst,
	      input wire [2:0] 	BTN,
	      input wire [1:0] 	SW, 
	      output wire [7:0] HEX0, HEX1
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
		   .CLR(clr),
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
		   .CLR(clr),
		   .INC(minup),
		   .tens_place(min_tens_place),
		   .ones_place(min_ones_place),
		   .CA(carry_min)
		   );



   parameter integer 		SEC=2'b00;
   parameter integer 		MIN=2'b01;
   
   reg [3:0] 			ones_place;
   reg [2:0] 			tens_place;
   wire [3:0] 			ones_place_wire;
   wire [2:0] 			tens_place_wire;

   always_comb begin
      case(SW)
	SEC: begin
	   ones_place = sec_ones_place;
	   tens_place = sec_tens_place;
	end
	MIN: begin
	   ones_place = min_ones_place;
	   tens_place = min_tens_place;
	end
	default: begin
	   ones_place = 4'bxxxx;
	   tens_place = 3'bxxx;
	end
      endcase // case (SW)
   end // always_comb
   assign ones_place_wire = ones_place;
   assign tens_place_wire = tens_place;
   
   
   // 7seg
   // decord_7seg sec1 (.DIN(sec_ones_place), .HEX(HEX0));
   // decord_7seg sec10(.DIN(sec_tens_place), .HEX(HEX1));
   // decord_7seg min1 (.DIN(min_ones_place), .HEX(HEX2));
   // decord_7seg min10(.DIN(min_tens_place), .HEX(HEX3));
   decord_7seg ones (.DIN(ones_place_wire), .HEX(HEX0));
   decord_7seg tens (.DIN(tens_place_wire), .HEX(HEX1));
   
   
endmodule // clock1

`default_nettype wire

