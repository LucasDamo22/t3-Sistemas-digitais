onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/timer_tb/reset
add wave -noupdate /tb/timer_tb/clock
add wave -noupdate /tb/timer_tb/t_en
add wave -noupdate /tb/timer_tb/t_out
add wave -noupdate /tb/timer_tb/t_valid
add wave -noupdate /tb/timer_tb/count
add wave -noupdate /tb/timer_tb/t_valid_int
add wave -noupdate /tb/timer_tb/t_en_int
add wave -noupdate -divider tb
add wave -noupdate /tb/clock
add wave -noupdate /tb/reset
add wave -noupdate /tb/t_en
add wave -noupdate /tb/t_out
add wave -noupdate /tb/t_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {241513 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits sec
update
WaveRestoreZoom {0 ps} {843358 ps}
