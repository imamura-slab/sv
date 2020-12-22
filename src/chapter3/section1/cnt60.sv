`default_nettype none

module cnt60(
	     input wire       clk, n_rst,
	     input wire       CEN,
	     input wire       CLR, INC, 
	     output reg [2:0] tens_place,
	     output reg [3:0] ones_place,
	     output wire      CA
	     );
   
   wire 		      carry_flag1  = (ones_place==4'd9);
   wire 		      carry_flag10 = (tens_place==3'd5);
   assign 		      CA = (carryflag1 & carry_flag1 & CEN);


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
	 if(carry_flag10)
	   tens_place <= '0;
	 else
	   tens_place <= tens_place + 'd1;
      end
      else
	tens_place <= tens_place;
   end // always_ff@ (posedge clk)
   

   
endmodule // cnt60

`default_nettype wire

