module timer
(
    // Declaração das portas
    //------------
    input reset, clock, t_en,
    output [15:0] t_out,
    output t_valid
    //------------
);
   

    reg [15:0] count;
    reg t_valid_int,t_en_int;

    always @(posedge clock or posedge reset) begin
        if(reset) begin
            count <= 16'b0;
            t_valid_int <= 1'b0;
        end else begin
            if(t_en) begin
                count <= count + 1;
            end
            t_en_int = t_en;
            t_valid_int <= t_en_int;
        end
    end
    
    assign t_out = count;
    assign t_valid = t_valid_int;
    
endmodule