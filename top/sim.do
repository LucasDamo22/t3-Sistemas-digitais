if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog -work work fibonacci-folder/fibonacci.v
vlog -work work timer-folder/timer.v
vlog -work work digital-clock-manager/dcm.v
vlog -work work synth-modules/dspl_drv_NexysA7.v
vlog -work work synth-modules/edge_detector_no_count.v
vlog -work work display-manager/dm.v
vlog -work work wrapper/wrapper.v
vlog -work work parity/parity.v
vlog -work work synth-modules/edge_detector_no_count.v
vlog -work work top/top.v
vlog -work work top/tb.v

vsim -voptargs=+acc=lprn -t ns work.tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

do wave.do 

run 50 us