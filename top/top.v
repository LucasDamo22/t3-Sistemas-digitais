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
  output [5:0] LED,
  output [7:0] an, dec_cat
);
localparam  S_IDLE = 3'd0;
localparam  S_COMM_F = 3'd1;
localparam  S_WAIT_F = 3'd2;
localparam  S_COMM_T = 3'd3;
localparam  S_WAIT_T = 3'd4;
localparam  S_BUF_EMPTY = 3'd5;
wire [2:0] prog_int, prog_out_dcm;

wire start_f_ed, start_t_ed, update_ed, stop_f_t_ed; // rising edge detectors
wire f_en_int, f_valid_int, t_en_int, t_valid_int; // timers
wire buffer_full, buffer_empty, data_1_en_int, data_2_valid_int; // wrapper
wire parity_int; // parity
wire clock_1_int, clock_2_int; // clocks
wire [15:0] f_out, t_out, data_1, data_2_int; // fibonacci and timer outputs
wire [5:0] led_int;
reg [1:0] gen_mod_int;
reg [2:0] EA;


assign parity = parity_int;
assign data_1_en_int = ((f_valid_int == 1'b1) || (t_valid_int ==  1'b1));
assign f_en_int = ((EA == S_COMM_F) /*&& (~buffer_full)*/) ? 1'b1 : 1'b0;
assign t_en_int = ((EA == S_COMM_T) /*&& (~buffer_full)*/) ? 1'b1 : 1'b0;

assign data_1 = ((EA == S_COMM_F) || (EA == S_WAIT_F)) ? f_out :
                ((EA == S_COMM_T) || (EA == S_WAIT_T)) ? t_out :
                16'b0;

assign LED = led_int;
assign led_int = (EA == S_IDLE) ? 6'b000000 :
                 (EA == S_COMM_F) ? 6'b000001 :
                 (EA == S_WAIT_F) ? 6'b000010 :
                 (EA == S_COMM_T) ? 6'b000100 :
                 (EA == S_WAIT_T) ? 6'b001000 :
                 (EA == S_BUF_EMPTY) ? 6'b010000 :
                 6'b100000;

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
      S_WAIT_F: begin
        if(stop_f_t_ed) begin
          EA <= S_BUF_EMPTY;
        end else if(~buffer_full) begin
          EA <= S_COMM_F; 
        end else begin
          EA <= S_WAIT_F;
        end
      end
      S_COMM_T: begin
        if(stop_f_t_ed) begin
          EA <= S_BUF_EMPTY;
        end else if(buffer_full) begin
          EA <= S_WAIT_T;
        end else begin
          EA <= S_COMM_T;
        end
      end
      S_WAIT_T: begin
        if(stop_f_t_ed) begin
          EA <= S_BUF_EMPTY;
        end else if(~buffer_full) begin
          EA <= S_COMM_T;
        end else begin
          EA <= S_WAIT_T;
        end
      end
      S_BUF_EMPTY: begin
        if(buffer_empty && ~data_2_valid_int) begin
          EA <= S_IDLE;
        end else begin
          EA <= S_BUF_EMPTY;
        end
      end
    endcase
  end
end

always@(posedge clock or posedge reset) begin
  if(reset) begin
    gen_mod_int <= 2'b00;
  end else begin
    if(EA == S_COMM_T || EA == S_WAIT_T) begin
      gen_mod_int <= 2'b01;
    end else if (EA == S_COMM_F || EA ==  S_WAIT_F) begin
      gen_mod_int <= 2'b10;
    end else if(EA == S_BUF_EMPTY)begin
      gen_mod_int <= gen_mod_int;
    end else begin
      gen_mod_int <= 2'b00;
    end
  end
end

wire [1:0]gen_mod_muxed;

assign gen_mod_muxed = (data_2_valid_int == 1'b1) ? gen_mod_int : 2'b00;

parity_check parity_mod(.data(data_2_int), .parity(parity_int));
edge_detector start_fib(.clock(clock), .reset(reset), .din(start_f), .rising(start_f_ed));
edge_detector start_tim(.clock(clock), .reset(reset), .din(start_t), .rising(start_t_ed));
edge_detector update_c(.clock(clock), .reset(reset), .din(update), .rising(update_ed));
edge_detector stop_fib_tim(.clock(clock), .reset(reset), .din(stop_f_t), .rising(stop_f_t_ed));




assign prog_int = prog;


//MODULOS//
  //digital_clock_manager
  dcm  mod(.clock          (clock),
                .reset          (reset),
                .update_clock   (update_ed),
                .prog_in        (prog_int),
                .prog_out       (prog_out_dcm),
                .clock_1        (clock_1_int),
                .clock_2        (clock_2_int));
  //digital_clock_manager
  //fibonacci
  fibonacci fibo (.clock        (clock_1_int), 
                  .reset        (reset), 
                  .f_en         (f_en_int), 
                  .f_valid      (f_valid_int), 
                  .f_out        (f_out));
  //fibonacci
  //timer
  timer       tim(.clock        (clock_1_int), 
                 .reset         (reset),
                 .t_en          (t_en_int), 
                 .t_out         (t_out), 
                 .t_valid       (t_valid_int));   
  //timer
  //wrapper
  wrapper wrapped(.clock_1      (clock_1_int),
                  .clock_2      (clock_2_int), 
                  .reset        (reset), 
                  .data_1_en    (data_1_en_int), 
                  .data_1       (data_1),
                  .buffer_empty (buffer_empty), 
                  .buffer_full  (buffer_full),
                  .data_2_valid (data_2_valid_int), 
                  .data_2       (data_2_int));
  
  //wrapper
  //display
  dm     dm_manag(.clock(clock),
                  .reset(reset),
                  .gen_mod(gen_mod_muxed),
                  .prog(prog_out_dcm),
                  .data_2(data_2_int),
                  .an(an),
                  .dec_cat(dec_cat));
  //display
  //
//
endmodule