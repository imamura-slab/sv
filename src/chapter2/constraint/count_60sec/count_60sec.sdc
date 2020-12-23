create_clock -name clk1 -period 20.000 [get_ports {clk}]
derive_pll_clocks
derive_clock_uncertainty


# input
set_false_path -from [get_ports {n_rst}]



# output
set_false_path -from * -to [get_ports {HEX1*}]
set_false_path -from * -to [get_ports {HEX0*}]


