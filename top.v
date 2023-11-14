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
wire [2:0] prog_int, prog_out_dcm;

wire start_f_ed, start_t_ed, update_ed, stop_f_t_ed; // rising edge detectors
wire f_en, f_valid, t_en, t_valid; // timers
wire buffer_full, buffer_empty, data_1_en, data_2_valid; // wrapper
wire [15:0] f_out, t_out; // fibonacci and timer outputs

reg [2:0] EA;



localparam  S_IDLE = 3'd0;
localparam  S_COMM_F = 3'd1;
localparam  S_WAIT_F = 3'd2;
localparam  S_COMM_T = 3'd3;
localparam  S_WAIT_T = 3'd4;
localparam  S_BUF_EMPTY = 3'd5;

always@(posedge clock or posedge reset) begin
  if(reset) begin
    EA <= S_IDLE;
  end else begin
    case(EA)
      S_IDLE: begin
        if(start_f_ed) begin
          EA <= S_COMM_F;
        end else if(start_t_ed) begin
          EA <= S_COMM_T;
        end else begin
          EA <= S_IDLE;
        end
      end
      S_COMM_F:begin
        if(buffer_full) begin
          EA <= S_WAIT_F;
        end else if(stop_f_t_ed) begin
          EA <= S_BUF_EMPTY;
        end else begin
          EA <= S_COMM_F;
        end
      end
      // S_WAIT_F: begin
      //   if(stop_f_t_ed) begin
      //     EA <= S_BUF_EMPTY;
      //   end else if(~buffer_full) begin
      //     EA <= S_COMM_F; 
      //   end else begin
      //     EA <= S_WAIT_F;
      //   end
      // end
    endcase
  
  end
end

edge_detector start_fib(.clock(clock), .reset(reset), .din(start_f), .rising(start_f_ed));
edge_detector start_tim(.clock(clock), .reset(reset), .din(start_t), .rising(start_t_ed));
edge_detector update_c(.clock(clock), .reset(reset), .din(update), .rising(update_ed));
edge_detector stop_fib_tim(.clock(clock), .reset(reset), .din(stop_f_t), .rising(stop_f_t_ed));




assign prog_int = prog;


//MODULOS//
  //digital_clock_manager
  dcm  #(50)mod(.clock          (clock),
                .reset          (reset),
                .update_clock   (update_ed),
                .prog_in        (prog_int),
                .prog_out       (prog_out_dcm),
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
  timer       tim(.clock        (clock_1), 
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
  assign data_1_en = (f_valid || t_valid);
  //wrapper
  //display
  dm     dm_manag(.clock(clock),
                  .reset(reset),
                  .gen_mod(),
                  .prog(prog_out_dcm),
                  .data_2(data_2));
  //display
  //
//
endmodule