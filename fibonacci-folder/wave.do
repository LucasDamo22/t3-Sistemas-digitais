onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/fibo/MAX_FIBO
add wave -noupdate /tb/fibo/reset
add wave -noupdate /tb/fibo/clock
add wave -noupdate /tb/fibo/f_en
add wave -noupdate /tb/fibo/f_valid
add wave -noupdate /tb/fibo/f_out
add wave -noupdate /tb/fibo/soma_b
add wave -noupdate /tb/fibo/resultado
add wave -noupdate /tb/fibo/f_out_int
add wave -noupdate /tb/fibo/f_valid_int
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {381173508 ns} 0}
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
WaveRestoreZoom {0 ns} {2173500001 ns}
