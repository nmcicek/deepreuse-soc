create_clock -name sys_clk -period 5.000 [get_ports sys_diff_clock_clk_p]

set_property PACKAGE_PIN AD11 [get_ports sys_diff_clock_clk_n]
set_property IOSTANDARD LVDS [get_ports sys_diff_clock_clk_n]
set_property PACKAGE_PIN AD12 [get_ports sys_diff_clock_clk_p]
set_property IOSTANDARD LVDS [get_ports sys_diff_clock_clk_p]

set_property PACKAGE_PIN G12 [get_ports reset]
set_property IOSTANDARD LVCMOS25 [get_ports reset]

set_property PACKAGE_PIN AB8 [get_ports uartIO_resetDone]
set_property IOSTANDARD LVCMOS15 [get_ports uartIO_resetDone]

set_property PACKAGE_PIN K24 [get_ports uartIO_tx]
set_property IOSTANDARD LVCMOS25 [get_ports uartIO_tx]
set_property PACKAGE_PIN M19 [get_ports uartIO_rx]
set_property IOSTANDARD LVCMOS25 [get_ports uartIO_rx]

set_property SEVERITY {Warning} [get_drc_checks NTSD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]
set_property BITSTREAM.Config.SPI_BUSWIDTH {4} [current_design]

