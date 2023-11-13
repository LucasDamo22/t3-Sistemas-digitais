if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog -work work wrapper.v
vlog -work work tb_wrapper.v

vsim -voptargs=+acc=lprn  work.tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

do wave.do 

run 2000ns