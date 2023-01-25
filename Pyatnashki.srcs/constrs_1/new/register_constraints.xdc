set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN E3} [get_ports {clk_old}]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk_old}]

set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN F4} [get_ports {PS2_CLK}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN B2} [get_ports {PS2_DATA}]

set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN A3} [get_ports {rgb[2]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN B4} [get_ports {rgb[2]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN C5} [get_ports {rgb[2]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN A4} [get_ports {rgb[2]}]

set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN C6} [get_ports {rgb[1]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN A5} [get_ports {rgb[1]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN B6} [get_ports {rgb[1]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN A6} [get_ports {rgb[1]}]

set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN B7} [get_ports {rgb[0]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN C7} [get_ports {rgb[0]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN D7} [get_ports {rgb[0]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN D8} [get_ports {rgb[0]}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN B11} [get_ports {hsync}]
set_property -dict {IOSTANDARD LVCMOS33     PACKAGE_PIN B12} [get_ports {vsync}]