`default_nettype none

module 7seg_dec(
		input wire [3:0] DIN,
		output reg [6:0] HEX
		);
   
   always_comb begin
      case(DIN)
	4'h0: HEX = 7'b1000000;
	4'h1: HEX = 7'b1111001;
	4'h2: HEX = 7'b0100100;
	4'h3: HEX = 7'b0110000;
	4'h4: HEX = 7'b0011001;
	4'h5: HEX = 7'b0010010;
	4'h6: HEX = 7'b0000010;
	4'h7: HEX = 7'b1011000;
	4'h8: HEX = 7'b0000000;
	4'h9: HEX = 7'b0010000;
	4'ha: HEX = 7'b0001000;
	4'hb: HEX = 7'b0000011;
	4'hc: HEX = 7'b1000110;
	4'hd: HEX = 7'b0100001;
	4'he: HEX = 7'b0000110;
	4'hf: HEX = 7'b0001110;
      endcase
   end
   
endmodule // 7seg_dec

`default_nettype wire
