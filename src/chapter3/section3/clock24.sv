`default_nettype none

module clock24(
	       input wire 	 clk, n_rst,
	       input wire [2:0]  BTN,
	       input wire [1:0]  SW,
	       output wire [7:0] HEX0, HEX1
	       );
   

   wire 			MODE, SELECT, ADJUST;
   btn_in btn_in_inst(
		      .clk(clk),
		      .n_rst(n_rst),
		      .btn(BTN),
		      .btn_out({MODE, SELECT, ADJUST})
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
   wire 			SECON, MINON, HOURON;
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
   wire [1:0] 			hour24_tens_place;
   wire [3:0] 			hour24_ones_place;
   cnt24 #(.MODE24(1)) cnt24_hour(
				  .clk(clk),
				  .n_rst(n_rst),
				  .CEN(CA_min),
				  .INC(HOURINC),
				  .tens_place(hour24_tens_place),
				  .ones_place(hour24_ones_place)
				  );

   wire [1:0] 			hour12_tens_place;
   wire [3:0] 			hour12_ones_place;
   cnt24 #(.MODE24(0)) cnt12_hour(
				  .clk(clk),
				  .n_rst(n_rst),
				  .CEN(CA_min),
				  .INC(HOURINC),
				  .tens_place(hour12_tens_place),
				  .ones_place(hour12_ones_place)
				  );
   

   


   // [select] display on 7seg
   parameter integer 		SEC    = 2'b00;
   parameter integer 		MIN    = 2'b01;
   parameter integer 		HOUR24 = 2'b10;
   parameter integer 		HOUR12 = 2'b11;

   reg [3:0] 			ones_place;
   reg [2:0] 			tens_place;
   reg 				ON;
   wire [3:0] 			ones_place_wire;
   wire [2:0] 			tens_place_wire;
   wire 			ON_wire;
 			
   always_comb begin
      case(SW)
	SEC:begin
	   ones_place = sec_ones_place;
	   tens_place = sec_tens_place;
	   ON = SECON;
	end
	MIN:begin
	   ones_place = min_ones_place;
	   tens_place = min_tens_place;
	   ON = MINON;
	end
	HOUR24:begin
	   ones_place = hour24_ones_place;
	   tens_place = hour24_tens_place;
	   ON = HOURON;
	end
	HOUR12:begin
	   ones_place = hour12_ones_place;
	   tens_place = hour12_tens_place;
	   ON = HOURON;
	end
	default:begin
	   ones_place = 4'bxxxx;
	   tens_place = 3'bxxx;
	   ON = 1'bx;
	end
      endcase // case (SW)
   end // always_comb
   assign ones_place_wire = ones_place;
   assign tens_place_wire = tens_place;
   assign ON_wire = ON;
   

   // 7seg
   decord_7seg ones(.DIN(ones_place_wire),  .EN(ON_wire),  .HEX(HEX0));
   decord_7seg tens(.DIN(tens_place_wire),  .EN(ON_wire),  .HEX(HEX1));

   
   
endmodule // clock24

`default_nettype wire

