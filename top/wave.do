onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TOP
add wave -noupdate /tb/DUT/clock
add wave -noupdate /tb/DUT/reset
add wave -noupdate /tb/DUT/EA
add wave -noupdate /tb/DUT/start_f
add wave -noupdate /tb/DUT/start_f_ed
add wave -noupdate /tb/DUT/start_t
add wave -noupdate /tb/DUT/start_t_ed
add wave -noupdate /tb/DUT/stop_f_t
add wave -noupdate /tb/DUT/stop_f_t_ed
add wave -noupdate /tb/DUT/buffer_full
add wave -noupdate /tb/DUT/parity
add wave -noupdate /tb/DUT/prog
add wave -noupdate /tb/DUT/update
add wave -noupdate /tb/DUT/update_ed
add wave -noupdate /tb/DUT/f_valid_int
add wave -noupdate /tb/DUT/t_valid_int
add wave -noupdate /tb/DUT/data_1_en_int
add wave -noupdate /tb/DUT/gen_mod_int
add wave -noupdate -divider DCM
add wave -noupdate -group DCM /tb/DUT/mod/COUNT_10
add wave -noupdate -group DCM /tb/DUT/mod/clock
add wave -noupdate -group DCM /tb/DUT/mod/reset
add wave -noupdate -group DCM /tb/DUT/mod/update_clock
add wave -noupdate -group DCM /tb/DUT/mod/prog_in
add wave -noupdate -group DCM /tb/DUT/mod/prog_out
add wave -noupdate -group DCM /tb/DUT/mod/prog_reg
add wave -noupdate -group DCM /tb/DUT/mod/clock_1
add wave -noupdate -group DCM /tb/DUT/mod/clock_2
add wave -noupdate -group DCM /tb/DUT/mod/count_10hz
add wave -noupdate -group DCM /tb/DUT/mod/count_mult_hz
add wave -noupdate -group DCM /tb/DUT/mod/multiplier
add wave -noupdate -group DCM /tb/DUT/mod/clock_1_int
add wave -noupdate -group DCM /tb/DUT/mod/clock_2_int
add wave -noupdate -divider FIB
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/MAX_FIBO
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/reset
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/clock
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/f_en
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/f_valid
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/f_out
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/soma_b
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/resultado
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/f_out_int
add wave -noupdate -expand -group FIBO /tb/DUT/fibo/f_valid_int
add wave -noupdate -divider TIMER
add wave -noupdate -expand -group TIMER /tb/DUT/tim/reset
add wave -noupdate -expand -group TIMER /tb/DUT/tim/clock
add wave -noupdate -expand -group TIMER /tb/DUT/tim/t_en
add wave -noupdate -expand -group TIMER /tb/DUT/tim/t_out
add wave -noupdate -expand -group TIMER /tb/DUT/tim/t_valid
add wave -noupdate -expand -group TIMER /tb/DUT/tim/count
add wave -noupdate -expand -group TIMER /tb/DUT/tim/t_valid_int
add wave -noupdate -expand -group TIMER /tb/DUT/tim/t_en_int
add wave -noupdate -divider WRAPPER
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/clock_1
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/clock_2
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/reset
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/data_1_en
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/data_1
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/buffer_empty
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/buffer_full
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/data_2_valid
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/data_2
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/t_buffer
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/t_read_pointer
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/t_write_pointer
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/data_2_valid_int
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/empty
add wave -noupdate -group WRAPPER /tb/DUT/wrapped/full
add wave -noupdate -divider DM
add wave -noupdate -expand -group DM /tb/DUT/dm_manag/clock
add wave -noupdate -expand -group DM /tb/DUT/dm_manag/reset
add wave -noupdate -expand -group DM /tb/DUT/dm_manag/gen_mod
add wave -noupdate -expand -group DM /tb/DUT/dm_manag/prog
add wave -noupdate -expand -group DM /tb/DUT/dm_manag/data_2
add wave -noupdate -expand -group DM /tb/DUT/dm_manag/an
add wave -noupdate -expand -group DM /tb/DUT/dm_manag/dec_cat
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3030 ns} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {40606 ns}
