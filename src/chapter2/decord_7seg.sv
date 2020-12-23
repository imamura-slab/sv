`default_nettype none

module decord_7seg(
		   input wire [3:0] SW,
		   output reg [7:0] HEX
		   );
   
   always_comb begin
      case(SW)
	4'h0: HEX = 8'b1100_0000;
	4'h1: HEX = 8'b1111_1001;
	4'h2: HEX = 8'b1010_0100;
	4'h3: HEX = 8'b1011_0000;
	4'h4: HEX = 8'b1001_1001;
	4'h5: HEX = 8'b1001_0010;
	4'h6: HEX = 8'b1000_0010;
	4'h7: HEX = 8'b1101_1000;
	4'h8: HEX = 8'b1000_0000;
	4'h9: HEX = 8'b1001_0000;
	4'ha: HEX = 8'b1000_1000;
	4'hb: HEX = 8'b1000_0011;
	4'hc: HEX = 8'b1100_0110;
	4'hd: HEX = 8'b1010_0001;
	4'he: HEX = 8'b1000_0110;
	4'hf: HEX = 8'b1000_1110;
      endcase // case (SW)
   end // always_comb
   
endmodule // decord_7seg

`default_nettype wire
