`default_nettype none

module cnt1sec(
	       input wire  clk, n_rst,
	       output wire en1hz,
	       output reg  sig2hz
	       );

   parameter integer 	   FREQ = 50 * 10**6;

   
   // 1hz   
   reg [$clog2(FREQ+1)-1:0] cnt;
   always_ff@(posedge clk)begin
      if(!n_rst)
	cnt <= '0;
      else begin
	 if(en1hz)
	   cnt <= '0;
	 else
	   cnt <= cnt + 'd1;
      end
   end
   assign en1hz = (cnt==FREQ-1);



   // 2hz
   wire cnt1_4 = (cnt==FREQ/4-1);
   wire cnt2_4 = (cnt==FREQ/2-1);
   wire cnt3_4 = (cnt==FREQ/4*3-1);
   always_ff@(posedge clk)begin
      if(!n_rst)
	sig2hz <= '0;
      else if(cnt1_4 | cnt2_4 | cnt3_4 | en1hz)
	sig2hz <= ~sig2hz;
   end
   
   
endmodule // cnt1sec

`default_nettype wire
