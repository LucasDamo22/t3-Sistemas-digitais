`timescale 1ns/1ps 
// `timescale 1ns/1ps 

module tb;
reg clock_1, clock_2, reset, data_1_en;
reg [15:0] data_1;
wire [15:0] data_2;
wire buffer_empty, buffer_full, data_2_valid;

initial begin
    clock_1 = 0;
    clock_2 = 0;
    reset = 1;
    data_1_en = 0;
    data_1 = 0;
    #20 reset = 0;
    #40 data_1_en = 1;
    #180 data_1_en = 0;
end
always @(*)begin
    forever #3 data_1 = data_1 + 1;
end




always @(*) begin
    forever begin
        #20 clock_2 = ~clock_2;
    end
end
always @(*) begin
    forever begin
        #5 clock_1 = ~clock_1;
    end
end
wrapper wrapped(.clock_1(clock_1),.clock_2(clock_2), .reset(reset), .data_1_en(data_1_en), .data_1(data_1),
                .buffer_empty(buffer_empty), .buffer_full(buffer_full),
                .data_2_valid(data_2_valid), .data_2(data_2));

endmodule
