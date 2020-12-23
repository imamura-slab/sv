create_clock -name clk1 -period 20.000 [get_ports {clk}]
derive_pll_clocks
derive_clock_uncertainty

# create_generated_clock -name clk2 -period 37.000 #27MHz
# create_clock -name clk1 -period 37.000 [get_ports {clk}]

# input
# set_false_path -from [get_ports {camera_r*}]
# set_false_path -from [get_ports {camera_g*}]
# set_false_path -from [get_ports {camera_b*}]

# set_false_path -from [get_ports {camera_hcount*}]
# set_false_path -from [get_ports {camera_vcount*}]

set_false_path -from [get_ports {rst_btn}]



# output
# set_false_path -from * -to [get_ports {x_center_out*}]
# set_false_path -from * -to [get_ports {y_center_out*}]
set_false_path -from * -to [get_ports {led0}]
set_false_path -from * -to [get_ports {led1}]
set_false_path -from * -to [get_ports {led2}]
set_false_path -from * -to [get_ports {led3}]



