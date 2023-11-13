onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb/wrapped/clock_1
add wave -noupdate -radix unsigned /tb/wrapped/clock_2
add wave -noupdate -radix unsigned /tb/wrapped/reset
add wave -noupdate -radix unsigned /tb/wrapped/data_1_en
add wave -noupdate -radix unsigned /tb/wrapped/data_1
add wave -noupdate -radix unsigned /tb/wrapped/buffer_empty
add wave -noupdate -radix unsigned /tb/wrapped/buffer_full
add wave -noupdate -radix unsigned /tb/wrapped/data_2_valid
add wave -noupdate -radix unsigned /tb/wrapped/data_2
add wave -noupdate -radix unsigned /tb/wrapped/t_buffer
add wave -noupdate -radix unsigned /tb/wrapped/t_read_pointer
add wave -noupdate -radix unsigned /tb/wrapped/t_write_pointer
add wave -noupdate -radix unsigned /tb/wrapped/data_2_valid_int
add wave -noupdate -radix unsigned /tb/wrapped/empty
add wave -noupdate -radix unsigned /tb/wrapped/full
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {297987 ps} 0}
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
WaveRestoreZoom {0 ps} {2100 ns}
