`default_nettype none

module cnt1sec(
	       input wire  clk, n_rst,
	       output wire en1hz
	       );
   
   parameter integer 	   FREQ = 50 * 10**6;
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
   
endmodule // cnt1sec

`default_nettype wire
