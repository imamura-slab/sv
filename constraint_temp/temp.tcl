#============================================================
# CLOCK
#============================================================
set_location_assignment PIN_W36 -to clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to clk


#============================================================
# SW
#============================================================
### | SW[1] | SW[0] |
set_location_assignment PIN_AY28 -to SW[0]
set_instance_assignment -name IO_STANDARD "1.2-V" -to SW[0]

set_location_assignment PIN_AM27 -to SW[1]
set_instance_assignment -name IO_STANDARD "1.2-V" -to SW[1]


#============================================================
# LED
#============================================================
# set_location_assignment PIN_T11 -to led0
# set_instance_assignment -name IO_STANDARD "1.8-V" -to led
# set_location_assignment PIN_R11 -to led1
# set_instance_assignment -name IO_STANDARD "1.8-V" -to led
# set_location_assignment PIN_N15 -to led2
# set_instance_assignment -name IO_STANDARD "1.8-V" -to led
# set_location_assignment PIN_M15 -to led3
# set_instance_assignment -name IO_STANDARD "1.8-V" -to led


#============================================================
# 7seg
#============================================================
### | HEX1 | HEX0 | 
set_location_assignment PIN_AM32 -to HEX1[0]
set_location_assignment PIN_AN32 -to HEX1[1]
set_location_assignment PIN_AN31 -to HEX1[2]
set_location_assignment PIN_AP31 -to HEX1[3]
set_location_assignment PIN_BA35 -to HEX1[4]
set_location_assignment PIN_BD34 -to HEX1[5]
set_location_assignment PIN_AR31 -to HEX1[6]
set_location_assignment PIN_BC28 -to HEX1[7]
set_location_assignment PIN_AW8 -to HEX0[0]
set_location_assignment PIN_AY8 -to HEX0[1]
set_location_assignment PIN_AY9 -to HEX0[2]
set_location_assignment PIN_BA9 -to HEX0[3]
set_location_assignment PIN_BB9 -to HEX0[4]
set_location_assignment PIN_BD10 -to HEX0[5]
set_location_assignment PIN_V10 -to HEX0[6]
set_location_assignment PIN_AG9 -to HEX0[7]

set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX1[0]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX1[1]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX1[2]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX1[3]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX1[4]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX1[5]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX1[6]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX1[7]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX0[0]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX0[1]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX0[2]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX0[3]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX0[4]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX0[5]
set_instance_assignment -name IO_STANDARD "1.8-V" -to HEX0[6]
set_instance_assignment -name IO_STANDARD "1.8-V" -to HEX0[7]


#============================================================
# BUTTON
#============================================================
### | BTN[2] | BTN[1] | BTN[0] | n_rst |
set_location_assignment PIN_AR9  -to BTN[2]
set_instance_assignment -name IO_STANDARD "1.2-V" -to BTN[2]

set_location_assignment PIN_AV16 -to BTN[1]
set_instance_assignment -name IO_STANDARD "1.2-V" -to BTN[1]

set_location_assignment PIN_AE13 -to BTN[0]
set_instance_assignment -name IO_STANDARD "1.2-V" -to BTN[0]

set_location_assignment PIN_AJ13 -to n_rst
set_instance_assignment -name IO_STANDARD "1.2-V" -to n_rst



#============================================================
# KEY
#============================================================


#============================================================
# VGA
#============================================================


