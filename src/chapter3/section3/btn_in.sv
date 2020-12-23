`default_nettype none

module btn_in(
	      input wire       clk, n_rst,
	      input wire [2:0] btn,
	      output reg [2:0] btn_out
	      );

   parameter integer 	       CYCLE = 1250000; //40Hz : 50MHz/40Hz = 1250000
   reg [$clog2(CYCLE+1)-1:0]    cnt;

   wire 		       en40hz = (cnt==CYCLE-1);
   // 40Hz
   always_ff@(posedge clk)begin
      if(!n_rst)
	cnt <= '0;
      else begin
	 if(en40hz)
	   cnt <= '0;
	 else
	   cnt <= cnt + 'd1;
      end
   end
   

   // btn -> ff1 -> ff2 -> 
   reg [2:0] ff1, ff2;
   always_ff@(posedge clk)begin
      if(!n_rst)begin
	 ff2 <= '0;
	 ff1 <= '0;
      end
      else if(en40hz)begin
	 ff2 <= ff1;
	 ff1 <= btn;
      end
   end


   // btnはアクティブロー 立ち下がりを検出
   // ff1 [  いま  ] : 0   
   // ff2 [ひとつ前] : 1
   wire [2:0] temp = ~ff1 & ff2 & {3{en40hz}};
   

   // 念のため FF で受ける
   always_ff@(posedge clk)begin
      if(!n_rst)
	btn_out <= '0;
      else
	btn_out <= temp;
   end
   
endmodule // btn_in

`default_nettype wire

