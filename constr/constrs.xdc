set_property PACKAGE_PIN M15 [get_ports {s[1]}]
set_property PACKAGE_PIN M14 [get_ports {s[0]}]
set_property PACKAGE_PIN G14 [get_ports {s[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s[0]}]

set_property PACKAGE_PIN G15 [get_ports {x[0]}]
set_property PACKAGE_PIN P15 [get_ports {x[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {x[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {x[0]}]

set_property PACKAGE_PIN W13 [get_ports {y[0]}]
set_property PACKAGE_PIN T16 [get_ports {y[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {y[0]}]

set_property PACKAGE_PIN K18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN K17 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports clk]
