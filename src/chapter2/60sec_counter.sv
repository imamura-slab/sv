`default_nettype none

module 60sec_counter(
		     input wire       clk, n_rst,
		     output reg [6:0] HEX0,
		     output reg [6:0] HEX1
		     );

   parameter integer 		      FREQ = 50 * 10**6;

   reg [$clog2(FREQ+1)-1:0] 	      cnt;
   wire 			      en_1hz = (cnt==26'd49_000_000);
   

   // 1Hz count
   always_ff@(posedge clk)begin
      if(!n_rst)
	cnt <= 'd0;
      else begin
	 if(en_1hz)
	   cnt <= 'd0;
	 else
	   cnt <= cnt + 'd1;
      end
   end


   // 1sec count
   reg [3:0] sec;
   always_ff@(posedge clk) begin
      if(!n_rst)
	sec <= 'd0;
      else begin
	 if(en_1hz)begin
	    if(sec==4'd9)
	      sec <= 'd0;
	    else
	      sec <= sec + 4'd1;
	 end
	 else
	   sec <= sec;
      end
   end // always_ff@ (posedge clk)



   // 10sec count
   reg [2:0] 10sec;
   wire      en_10sec = (sec==4'd9);
   always_ff@(posedge clk)begin
      if(!n_rst)
	10sec <= 'd0;
      else begin
	 if(en_10sec)begin
	    if(10_sec==3'd6)
	      10sec <= 'd0;
	    else
	      10sec <= 10sec + 3'd1;
	 end
	 else
	   10sec <= 10sec;
      end
   end
   
   

   // 7seg decord
   7seg_dec 7_seg_dec_1sec(
			    .SW(sec),
			    .HEX(HEX0)
			    );

   
   
   7seg_dec 7_seg_dec_10sec(		
			    .SW(10sec),	
			    .HEX(HEX1)	
			    );
   
   

      
endmodule // 60sec_counter

`default_nettype wire
