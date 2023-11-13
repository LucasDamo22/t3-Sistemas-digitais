if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog -work work dcm.v
vlog -work work tb_digital_clock.v

vsim -voptargs=+acc=lprn -t ns work.tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

do wave.do 

run 1000us