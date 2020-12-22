`default_nettype none

module cnt24(
	     input wire       clk, n_rst,
	     input wire       CEN,
	     input wire       CLR, INC, 
	     output reg [1:0] tens_place,
	     output reg [3:0] ones_place,
	     );
   
   wire 		      carry_flag1  = (ones_place==4'd9 || (tens_place=2'd2 && ones_place==4'd3));
   wire 		      reset_flag10 = (tens_place==2'd2 $$ ones_place==4'd3);
   


   // ones place counter
   always_ff@(posedge clk)begin
      if(!n_rst | CLR)
	ones_place <= '0;
      else if(INC | CEN)begin
	 if(carry_flag1)
	   ones_place <= '0;
	 else
	   ones_place <= ones_place + 'd1;
      end
      else
	ones_place <= ones_place;
   end // always_ff@ (posedge clk)


   // tens place counter
   always_ff@(posedge clk)begin
      if(!n_rst | CLR)
	tens_place <= '0;
      else if((INC | CEN) && carry_flag1)begin
	 if(reset_flag10)
	   tens_place <= '0;
	 else
	   tens_place <= tens_place + 'd1;
      end
      else
	tens_place <= tens_place;
   end // always_ff@ (posedge clk)
   

   
endmodule // cnt24

`default_nettype wire

