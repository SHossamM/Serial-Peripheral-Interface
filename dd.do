# Compile of Master.v was successful.
vsim work.Master_Slave
# vsim work.Master_Slave 
# Loading work.Master_Slave
# Loading work.Master
# Loading work.slave
add wave -position insertpoint sim:/Master_Slave/*
add wave -position insertpoint sim:/Master_Slave/M/*
add wave -position insertpoint sim:/Master_Slave/S1/*
force -freeze sim:/Master_Slave/mode 00 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Master_Slave/sendOrder 1 0
force -freeze sim:/Master_Slave/ssi 01 0
force -freeze sim:/Master_Slave/address 00000011 0
force -freeze sim:/Master_Slave/reg31 00110011 0
run
force -freeze sim:/Master_Slave/reset 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/reset 1 0
run
force -freeze sim:/Master_Slave/reset 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/Master_Slave/mode 10 0
force -freeze sim:/Master_Slave/address 00001000 0
force -freeze sim:/Master_Slave/reg81 11110000 0
force -freeze sim:/Master_Slave/reset 1 0
run
force -freeze sim:/Master_Slave/reset 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/Master_Slave/mode 11 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/address 00000110 0
force -freeze sim:/Master_Slave/reg61 10101010 0
run
force -freeze sim:/Master_Slave/reset 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
