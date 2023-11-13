`timescale 1ns/1ps 
// `timescale 1ns/1ps 

module tb;
reg clock, reset, t_en;
wire [15:0] t_out;
wire t_valid;

initial begin
    clock = 0;
    reset = 1;
    t_en = 0;
    #20 reset = 0;
    #40 t_en = 1;
    #180 t_en = 0;
end
always @(*) begin
    forever begin
        #5 clock = ~clock;
    end
end
timer timer_tb(.clock(clock), .reset(reset),
                .t_en(t_en), .t_out(t_out), .t_valid(t_valid));

endmodule
