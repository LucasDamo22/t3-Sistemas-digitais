module wrapper 
(
  input clock_1,
  input clock_2,
  input reset,
  input data_1_en,
  input [15:0] data_1,

  output buffer_empty,
  output buffer_full,
  output data_2_valid, 
  output  [15:0] data_2
);


  reg [15:0] t_buffer [0:7];

  reg [2:0] t_read_pointer, t_write_pointer;
  reg data_2_valid_int;
  wire empty, full;

  always @(posedge clock_1 or posedge reset) begin
      if(reset) begin
        t_write_pointer <= 0;

      end else begin
        if (data_1_en && ~full) begin
          t_buffer[t_write_pointer] <= data_1;
          t_write_pointer <= t_write_pointer + 1;
        end
      end
  end

  always @(posedge clock_2 or posedge reset) begin
      if(reset) begin
        t_read_pointer <= 0;
      end else begin
        if (~empty) begin
          t_read_pointer <= t_read_pointer + 1;
          //data_2_int <= t_buffer[t_read_pointer];
          data_2_valid_int <= 1;
        end else begin
          data_2_valid_int <= 0;
        end
      end
  end
assign buffer_empty = empty;
assign buffer_full = full;
assign data_2_valid = data_2_valid_int;
assign data_2 = t_buffer[t_read_pointer];
assign full = (t_write_pointer == t_read_pointer - 1) ? 1'b1 : 1'b0;
assign empty = (t_write_pointer == t_read_pointer) ? 1'b1 : 1'b0;

endmodule