#============================================================
# CLOCK
#============================================================
set_location_assignment PIN_W36 -to clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to clk

#============================================================
# LED
#============================================================
# set_location_assignment PIN_E21 -to LEDG[0]
# set_location_assignment PIN_E22 -to LEDG[1]
# set_location_assignment PIN_E25 -to LEDG[2]
# set_location_assignment PIN_E24 -to LEDG[3]
# set_location_assignment PIN_H21 -to LEDG[4]
# set_location_assignment PIN_G20 -to LEDG[5]
# set_location_assignment PIN_G22 -to LEDG[6]
# set_location_assignment PIN_G21 -to LEDG[7]
# set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG[0]
# set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG[1]
# set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG[2]
# set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG[3]
# set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG[4]
# set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG[5]
# set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG[6]
# set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG[7]


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
set_location_assignment PIN_AM32 -to HEX[0]
set_location_assignment PIN_AN32 -to HEX[1]
set_location_assignment PIN_AN31 -to HEX[2]
set_location_assignment PIN_AP31 -to HEX[3]
set_location_assignment PIN_BA35 -to HEX[4]
set_location_assignment PIN_BD34 -to HEX[5]
set_location_assignment PIN_AR31 -to HEX[6]
set_location_assignment PIN_BC28 -to HEX[7]
# set_location_assignment PIN_AW8 -to HEX[]
# set_location_assignment PIN_AY8 -to HEX[]
# set_location_assignment PIN_AY9 -to HEX[]
# set_location_assignment PIN_BA9 -to HEX[]
# set_location_assignment PIN_BB9 -to HEX[]
# set_location_assignment PIN_BD10 -to HEX[]
# set_location_assignment PIN_V10 -to HEX[]
# set_location_assignment PIN_AG9 -to HEX[]

set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[0]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[1]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[2]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[3]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[4]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[5]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[6]
set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[7]
# set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[]
# set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[]
# set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[]
# set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[]
# set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[]
# set_instance_assignment -name IO_STANDARD "1.2-V" -to HEX[]
# set_instance_assignment -name IO_STANDARD "1.8-V" -to HEX[]
# set_instance_assignment -name IO_STANDARD "1.8-V" -to HEX[]


#============================================================
# BUTTON
#============================================================
set_location_assignment PIN_AJ13 -to n_rst
set_instance_assignment -name IO_STANDARD "1.2-V" -to n_rst



#============================================================
# KEY
#============================================================
# set_location_assignment PIN_M23 -to KEY[0]
# set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY[0]


#============================================================
# VGA
#============================================================
# set_location_assignment PIN_E12 -to VGA_R[0]
# set_location_assignment PIN_E11 -to VGA_R[1]
# set_location_assignment PIN_D10 -to VGA_R[2]
# set_location_assignment PIN_F12 -to VGA_R[3]
# set_location_assignment PIN_G10 -to VGA_R[4]
# set_location_assignment PIN_J12 -to VGA_R[5]
# set_location_assignment PIN_H8 -to VGA_R[6]
# set_location_assignment PIN_H10 -to VGA_R[7]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[0]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[1]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[2]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[3]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[4]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[5]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[6]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[7]

# set_location_assignment PIN_G8 -to VGA_G[0]
# set_location_assignment PIN_G11 -to VGA_G[1]
# set_location_assignment PIN_F8 -to VGA_G[2]
# set_location_assignment PIN_H12 -to VGA_G[3]
# set_location_assignment PIN_C8 -to VGA_G[4]
# set_location_assignment PIN_B8 -to VGA_G[5]
# set_location_assignment PIN_F10 -to VGA_G[6]
# set_location_assignment PIN_C9 -to VGA_G[7]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[0]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[1]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[2]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[3]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[4]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[5]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[6]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[7]

# set_location_assignment PIN_B10 -to VGA_B[0]
# set_location_assignment PIN_A10 -to VGA_B[1]
# set_location_assignment PIN_C11 -to VGA_B[2]
# set_location_assignment PIN_B11 -to VGA_B[3]
# set_location_assignment PIN_A11 -to VGA_B[4]
# set_location_assignment PIN_C12 -to VGA_B[5]
# set_location_assignment PIN_D11 -to VGA_B[6]
# set_location_assignment PIN_D12 -to VGA_B[7]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[0]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[1]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[2]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[3]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[4]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[5]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[6]
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[7]

# set_location_assignment PIN_A12 -to VGA_CLK
# set_location_assignment PIN_F11 -to VGA_BLANK_N
# set_location_assignment PIN_G13 -to VGA_HS
# set_location_assignment PIN_C13 -to VGA_VS
# set_location_assignment PIN_C10 -to VGA_SYNC_N
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_CLK     
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_BLANK_N 
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_HS      
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_VS      
# set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_SYNC_N  

