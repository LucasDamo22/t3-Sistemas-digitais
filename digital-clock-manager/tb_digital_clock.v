`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module tb;


reg clock;
reg reset;
reg update_clock;
reg [2:0] prog_in;
wire[2:0] prog_out;
wire clock_1;
wire clock_2;

dcm #(500)mod(.clock  (clock),
        .reset  (reset),
        .update_clock   (update_clock),
        .prog_in    (prog_in),
        .prog_out   (prog_out),
        .clock_1    (clock_1),
        .clock_2    (clock_2));


initial begin
    clock <= 1'b1;
    forever #5 clock <= ~clock;
    
end
initial begin
    reset <= 1;
    #10
    reset <= 0;
    #10
    prog_in <= 0;
    update_clock <= 0;
    #80000
    prog_in <= 3'd5;
    #20000
    update_clock <= 'b1;
    #50
    update_clock <= 'b0;

end

endmodule