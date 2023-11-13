module top 
(
  input clock,
  input reset,
  input start_f,
  input start_t,
  input stop_f_t,
  input update,
  input [2:0]prog,

  output parity,
  output [5:0] led,
  output [7:0] an, dec_cat
);

localparam  S_IDLE = 0;
localparam  S_COMM_F = 1;
localparam  S_WAIT_F = 2;
localparam  S_COMM_T = 3;
localparam  S_WAIT_T = 4;
localparam  S_BUF_EMPTY = 5;


//MODULOS//
  //digital_clock_manager
  dcm #(500)mod(.clock          (clock),
                .reset          (reset),
                .update_clock   (update_clock),
                .prog_in        (prog_in),
                .prog_out       (prog_out),
                .clock_1        (clock_1),
                .clock_2        (clock_2));
  //digital_clock_manager
  //fibonacci
  fibonacci fibo (.clock        (clock_1), 
                  .reset        (reset), 
                  .f_en         (f_en), 
                  .f_valid      (f_valid), 
                  .f_out        (f_out));
  //fibonacci
  //timer
    timer tim(.clock         (clock_1), 
                 .reset         (reset),
                 .t_en          (t_en), 
                 .t_out         (t_out), 
                 .t_valid       (t_valid));   
  //timer
  //wrapper
  wrapper wrapped(.clock_1      (clock_1),
                  .clock_2      (clock_2), 
                  .reset        (reset), 
                  .data_1_en    (data_1_en), 
                  .data_1       (data_1),
                  .buffer_empty (buffer_empty), 
                  .buffer_full  (buffer_full),
                  .data_2_valid (data_2_valid), 
                  .data_2       (data_2));
  //wrapper
  //display
  //display
//
endmodule