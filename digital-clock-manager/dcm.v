module dcm #(parameter COUNT_10 = 5_000_000) 
(
  input clock,
  input reset,
  input update_clock,
  input [2:0]prog_in,
  output [2:0]prog_out,
  output clock_1,
  output clock_2
);

reg [23:0] count_10hz;
reg[29:0]  count_mult_hz;
reg[7:0] multiplier;
reg clock_1_int, clock_2_int;
reg [2:0] prog_reg;

assign clock_1 = clock_1_int;
assign clock_2 = clock_2_int;
assign prog_out = prog_reg;

always@(posedge clock or posedge reset)begin 
  if(reset) begin 
    count_10hz <= 0;
    clock_1_int <= 0;
  end else begin
    count_10hz <= count_10hz + 1'b1;
      if(count_10hz == COUNT_10) begin 
        clock_1_int <= ~clock_1_int;
        count_10hz <=0;
      end
  end
end
always@(posedge clock or posedge reset) begin
  if(reset)begin
    count_mult_hz <= 0;
    clock_2_int <= 0;
    multiplier <= 1'd1;
  end else begin
    count_mult_hz <= count_mult_hz + 1'b1;
    if(count_mult_hz >= COUNT_10 * multiplier) begin
      clock_2_int <= ~clock_2_int;
      count_mult_hz <= 0;
    end
    
  end
end

always@(posedge update_clock or posedge reset) begin
  if(reset)begin
    prog_reg <= 3'd0;
  end else begin
    if(update_clock == 1'b1) begin
      prog_reg <= prog_in;
    end
  end
end
always@(*) begin
  if(update_clock == 1'b1)begin
      case(prog_in)
        3'd0:begin
          multiplier <= 8'd1;
        end
        3'd1:begin
          multiplier <= 8'd2;
        end
        3'd2:begin
          multiplier <= 8'd4;
        end
        3'd3:begin
          multiplier <= 8'd10;
        end
        3'd4:begin
          multiplier <= 8'd16;
        end
        3'd5:begin
          multiplier <= 8'd32;
        end
        3'd6:begin
          multiplier <= 8'd64;
        end
        3'd7:begin
          multiplier <= 8'd128;
        end
      endcase
    end
end
endmodule 