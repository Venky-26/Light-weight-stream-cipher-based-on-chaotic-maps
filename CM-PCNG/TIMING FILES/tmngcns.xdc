create_clock -period 350.000 -name clk -waveform {0.000 175.000} [get_ports clk]

# Set input delays
set_input_delay -clock clk -max 2 [get_ports start]
set_input_delay -clock clk -min 1 [get_ports start]
set_input_delay -clock clk -max 3 [get_ports reset]
set_input_delay -clock clk -min 2 [get_ports reset]


# Set output delays
set_output_delay -clock clk -max 2 [get_ports keystream[31]]
set_output_delay -clock clk -min 1 [get_ports keystream[31]]

set_output_delay -clock clk -max 2 [get_ports keystream[30]]
set_output_delay -clock clk -min 1 [get_ports keystream[30]]
set_output_delay -clock clk -max 2 [get_ports keystream[29]]
set_output_delay -clock clk -min 1 [get_ports keystream[29]]
set_output_delay -clock clk -max 2 [get_ports keystream[28]]
set_output_delay -clock clk -min 1 [get_ports keystream[28]]
set_output_delay -clock clk -max 2 [get_ports keystream[27]]
set_output_delay -clock clk -min 1 [get_ports keystream[27]]
set_output_delay -clock clk -max 2 [get_ports keystream[26]]
set_output_delay -clock clk -min 1 [get_ports keystream[26]]
set_output_delay -clock clk -max 2 [get_ports keystream[25]]
set_output_delay -clock clk -min 1 [get_ports keystream[25]]
set_output_delay -clock clk -max 2 [get_ports keystream[24]]
set_output_delay -clock clk -min 1 [get_ports keystream[24]]
set_output_delay -clock clk -max 2 [get_ports keystream[23]]
set_output_delay -clock clk -min 1 [get_ports keystream[23]]
set_output_delay -clock clk -max 2 [get_ports keystream[22]]
set_output_delay -clock clk -min 1 [get_ports keystream[22]]
set_output_delay -clock clk -max 2 [get_ports keystream[21]]
set_output_delay -clock clk -min 1 [get_ports keystream[21]]
set_output_delay -clock clk -max 2 [get_ports keystream[20]]
set_output_delay -clock clk -min 1 [get_ports keystream[20]]
set_output_delay -clock clk -max 2 [get_ports keystream[19]]
set_output_delay -clock clk -min 1 [get_ports keystream[19]]
set_output_delay -clock clk -max 2 [get_ports keystream[18]]
set_output_delay -clock clk -min 1 [get_ports keystream[18]]
set_output_delay -clock clk -max 2 [get_ports keystream[17]]
set_output_delay -clock clk -min 1 [get_ports keystream[17]]
set_output_delay -clock clk -max 2 [get_ports keystream[16]]
set_output_delay -clock clk -min 1 [get_ports keystream[16]]
set_output_delay -clock clk -max 2 [get_ports keystream[15]]
set_output_delay -clock clk -min 1 [get_ports keystream[15]]
set_output_delay -clock clk -max 2 [get_ports keystream[14]]
set_output_delay -clock clk -min 1 [get_ports keystream[14]]
set_output_delay -clock clk -max 2 [get_ports keystream[13]]
set_output_delay -clock clk -min 1 [get_ports keystream[13]]
set_output_delay -clock clk -max 2 [get_ports keystream[12]]
set_output_delay -clock clk -min 1 [get_ports keystream[12]]
set_output_delay -clock clk -max 2 [get_ports keystream[11]]
set_output_delay -clock clk -min 1 [get_ports keystream[11]]
set_output_delay -clock clk -max 2 [get_ports keystream[10]]
set_output_delay -clock clk -min 1 [get_ports keystream[10]]
set_output_delay -clock clk -max 2 [get_ports keystream[9]]
set_output_delay -clock clk -min 1 [get_ports keystream[9]]
set_output_delay -clock clk -max 2 [get_ports keystream[8]]
set_output_delay -clock clk -min 1 [get_ports keystream[8]]
set_output_delay -clock clk -max 2 [get_ports keystream[7]]
set_output_delay -clock clk -min 1 [get_ports keystream[7]]
set_output_delay -clock clk -max 2 [get_ports keystream[6]]
set_output_delay -clock clk -min 1 [get_ports keystream[6]]
set_output_delay -clock clk -max 2 [get_ports keystream[5]]
set_output_delay -clock clk -min 1 [get_ports keystream[5]]
set_output_delay -clock clk -max 2 [get_ports keystream[4]]
set_output_delay -clock clk -min 1 [get_ports keystream[4]]
set_output_delay -clock clk -max 2 [get_ports keystream[3]]
set_output_delay -clock clk -min 1 [get_ports keystream[3]]
set_output_delay -clock clk -max 2 [get_ports keystream[2]]
set_output_delay -clock clk -min 1 [get_ports keystream[2]]
set_output_delay -clock clk -max 2 [get_ports keystream[1]]
set_output_delay -clock clk -min 1 [get_ports keystream[1]]
set_output_delay -clock clk -max 2 [get_ports keystream[0]]
set_output_delay -clock clk -min 1 [get_ports keystream[0]]