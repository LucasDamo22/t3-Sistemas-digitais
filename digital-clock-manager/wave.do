onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/mod/clock
add wave -noupdate /tb/mod/reset
add wave -noupdate /tb/mod/update_clock
add wave -noupdate /tb/mod/prog_in
add wave -noupdate /tb/mod/prog_out
add wave -noupdate /tb/mod/clock_1
add wave -noupdate /tb/mod/clock_2
add wave -noupdate /tb/mod/count_10hz
add wave -noupdate /tb/mod/count_mult_hz
add wave -noupdate /tb/mod/clock_1_int
add wave -noupdate /tb/mod/clock_2_int
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {41643423 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ns} {161191208 ns}
