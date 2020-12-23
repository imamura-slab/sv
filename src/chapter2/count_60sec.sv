`default_nettype none

module count_60sec(
		   input wire 	    clk, n_rst,
		   output reg [7:0] HEX0,
		   output reg [7:0] HEX1
		   );
   
   parameter integer 		    FREQ = 50 * 10**6;
   
   reg [$clog2(FREQ+1)-1:0] 	    cnt;
   wire 			    en_1hz = (cnt==26'd49_000_000);
   
   
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
      end // else: !if(!n_rst)
   end // always_ff@ (posedge clk)
   
   
   
   // 10sec count
   reg [2:0] sec10;
   wire      en_sec10 = (sec==4'd9 && en_1hz);
   always_ff@(posedge clk)begin
      if(!n_rst)
	sec10 <= 'd0;
      else begin
	 if(en_sec10)begin
	    if(sec10==3'd5)
	      sec10 <= 'd0;
	    else
	      sec10 <= sec10 + 3'd1;
	 end
	 else
	   sec10 <= sec10;
      end // else: !if(!n_rst)
   end // always_ff@ (posedge clk)
   
   

   // 7seg decord
   decord_7seg decord_7seg_sec1(
				.SW(sec),
				.HEX(HEX0)
				);
   
   
   
   decord_7seg decord_7seg_sec10(
				 .SW(sec10),	
				 .HEX(HEX1)	
				 );
   
   
endmodule // count_60sec

`default_nettype wire
