FPGAボードで学ぶ組込システム開発入門 [Intel FPGA編] 小林優(著) を参考にして, <br>
SystemVerilogでDE5a-Net-DDR4用に書き換えてみた


|           |変更前(書籍オリジナル)|変更後                |
|:----------|:---------------------|:---------------------|
|言語       |Verilog               |SystemVerilog         |
|対象ボード(FPGA) |1. DE0-CV (Cyclone V 5CEBA4) <br> 2. DE10-Lite (MAX 10 10M50DA) <br> 3. DE1-SoC (Cyclone V 5CSEMA5)|DE5a-Net-DDR4 <br> (Arria10 10AX115N2F45E1SG)|
|プッシュSW |5 / 2 / 4個           |4個                   |
|スライドSW |10 / 10 / 10個        |2個                   |
|7セグメントLED |6 / 6 / 6桁       |2桁                   |
|単体LED    |10 / 10 / 10個        |4個                   |



