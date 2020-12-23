`default_nettype none

module state(
	     input wire  clk, n_rst,
	     input wire  sig2hz,
	     input wire  MODE, SELECT, ADJUST,
	     output wire SECINC, MININC, HOURINC,
	     output wire SECON, MINON, HOURON
	     );

   reg [2:0] 		 cur, nxt;
   localparam integer 	 NORM = 2'b00;
   localparam integer 	 SEC  = 2'b01;
   localparam integer 	 MIN  = 2'b10;
   localparam integer 	 HOUR = 2'b11;

   
   assign SECINC  = (cur==SEC)  & ADJUST;
   assign MININC  = (cur==MIN)  & ADJUST;
   assign HOURINC = (cur==HOUR) & ADJUST;

   
   assign SECON  = ~((cur==SEC)  & sig2hz);
   assign MINON  = ~((cur==MIN)  & sig2hz);
   assign HOURON = ~((cur==HOUR) & sig2hz);

   

   always_ff@(posedge clk)begin
      if(!n_rst)
	cur <= NORM;
      else
	cur <= nxt;
   end


   always_comb begin
      case(cur)
	NORM:
	  if(MODE)
	    nxt = SEC;
	  else
	    nxt = NORM;
	SEC:
	  if(MODE)
	    nxt = NORM;
	  else if(SELECT)
	    nxt = MIN;
	  else
	    nxt = SEC;
	MIN:
	  if(MODE)
	    nxt = NORM;
	  else if(SELECT)
	    nxt = HOUR;
	  else
	    nxt = MIN;
	HOUR:
	  if(MODE)
	    nxt = NORM;
	  else if(SELECT)
	    nxt = SEC;
	  else
	    nxt = HOUR;
	default:
	  nxt = 3'bxxx;
      endcase // case (cur)
   end // always_comb
   

endmodule // state

`default_nettype wire
