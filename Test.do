vsim work.Master_Slave
# vsim work.Master_Slave 
# Loading work.Master_Slave
# Loading work.Master
# Loading work.slave
add wave -position insertpoint sim:/Master_Slave/*
add wave -position insertpoint sim:/Master_Slave/M/*
add wave -position insertpoint sim:/Master_Slave/S1/*
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Master_Slave/sendOrder 1 0
force -freeze sim:/Master_Slave/ssi 01 0
force -freeze sim:/Master_Slave/address 00000011 0
run
force -freeze sim:/Master_Slave/reset 0 0
run
run
run
run
run
# Compile of Master.v was successful.
run
run
run
run
force -freeze sim:/Master_Slave/reg31 11110000 0
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
restart -f
# Loading work.Master
quit -sim
vsim work.Master_Slave
# vsim work.Master_Slave 
# Loading work.Master_Slave
# Loading work.Master
# Loading work.slave
add wave -position insertpoint sim:/Master_Slave/*
add wave -position insertpoint sim:/Master_Slave/M/*
add wave -position insertpoint sim:/Master_Slave/S1/*
noforce sim:/Master_Slave/mode
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Master_Slave/sendOrder 1 0
force -freeze sim:/Master_Slave/ssi 01 0
force -freeze sim:/Master_Slave/address 00000001 0
force -freeze sim:/Master_Slave/reg31 11110000 0
run
force -freeze sim:/Master_Slave/reset 0 0
run
force -freeze sim:/Master_Slave/address 00000011 0
run
run
run
run
run
run
run
run
run
quit -sim
vsim -voptargs=+acc work.Master_Slave
# vsim -voptargs=+acc work.Master_Slave 
# Loading work.Master_Slave
# Loading work.Master
# Loading work.slave
add wave -position insertpoint sim:/Master_Slave/*
quit -sim
vsim work.Master_Slave
# vsim work.Master_Slave 
# Loading work.Master_Slave
# Loading work.Master
# Loading work.slave
add wave -position insertpoint sim:/Master_Slave/*
add wave -position insertpoint sim:/Master_Slave/M/*
add wave -position insertpoint sim:/Master_Slave/S1/*
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Master_Slave/sendOrder 1 0
force -freeze sim:/Master_Slave/ssi 01 0
force -freeze sim:/Master_Slave/address 00000011 0
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
# WARNING: No extended dataflow license exists
quit -sim
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
force -freeze sim:/Master_Slave/reg31 00001111 0
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
restart -f
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Master_Slave/sendOrder 1 0
force -freeze sim:/Master_Slave/ssi 01 0
force -freeze sim:/Master_Slave/address 00000011 0
force -freeze sim:/Master_Slave/clk 1 0, 0 {50 ps} -r 100
run
force -freeze sim:/Master_Slave/reset St1 0
run
run
force -freeze sim:/Master_Slave/reg31 00001111 0
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
run
run
quit -sim
vsim work.Master_Slave
# vsim work.Master_Slave 
# Loading work.Master_Slave
# Loading work.Master
# Loading work.slave
add wave -position insertpoint sim:/Master_Slave/*
add wave -position insertpoint sim:/Master_Slave/M/*
add wave -position insertpoint sim:/Master_Slave/S1/*
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Master_Slave/sendOrder 1 0
force -freeze sim:/Master_Slave/ssi 01 0
force -freeze sim:/Master_Slave/address 00000011 0
force -freeze sim:/Master_Slave/reg31 00001111 0
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
restart -f
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Master_Slave/sendOrder 1 0
force -freeze sim:/Master_Slave/ssi 01 0
force -freeze sim:/Master_Slave/address 00000011 0
force -freeze sim:/Master_Slave/reg31 00001111 0
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
run
run
run
run
run
run
restart -f
quit -sim
# Compile of slave.v was successful.
# Compile of Master.v was successful.
# Compile of Master_Slave.v was successful.
# 3 compiles, 0 failed with no errors. 
vsim work.Master_Slave
# vsim work.Master_Slave 
# Loading work.Master_Slave
# Loading work.Master
# Loading work.slave
add wave -position insertpoint sim:/Master_Slave/*
add wave -position insertpoint sim:/Master_Slave/M/*
add wave -position insertpoint sim:/Master_Slave/S1/*
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Master_Slave/sendOrder 1 0
force -freeze sim:/Master_Slave/ssi 01 0
force -freeze sim:/Master_Slave/address 00000011 0
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
force -freeze sim:/Master_Slave/reg31 00001111 0
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
restart -f
force -freeze sim:/Master_Slave/mode 01 0
force -freeze sim:/Master_Slave/reset 1 0
force -freeze sim:/Master_Slave/M/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Master_Slave/sendOrder 1 0
force -freeze sim:/Master_Slave/ssi 01 0
force -freeze sim:/Master_Slave/address 00000011 0
force -freeze sim:/Master_Slave/reg31 00011100 0
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
quit -sim
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
