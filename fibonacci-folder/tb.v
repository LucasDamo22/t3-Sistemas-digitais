`timescale 1ms/1us 
// `timescale 1ns/1ps 

module tb;
  reg reset;
  reg clock;
  reg f_en;
  wire f_valid;
  wire [15:0] f_out;

fibonacci fibo (.clock(clock), .reset(reset), .f_en(f_en), .f_valid(f_valid), .f_out(f_out));

localparam PERIOD_10HZ = 100;  
// localparam PERIOD_100MHZ = 10;  

  initial begin
    clock = 1'b1;
    forever #(PERIOD_10HZ/2) clock = ~clock;
  end
initial begin
  reset <= 1;
  #1
  reset <= 0;
  f_en <= 1;
end


endmodule
