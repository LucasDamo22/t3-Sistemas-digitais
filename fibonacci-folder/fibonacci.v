module fibonacci 
(
    // Declaração das portas
    //------------
    input reset, clock, f_en,
    output f_valid,
    output [15:0] f_out
    //------------
);

// regs
//------------
parameter MAX_FIBO = 'd46368;
reg [15:0] soma_b, resultado, f_out_int;
reg f_valid_int;



//------------
always @(posedge clock or posedge reset)
    begin
        if(reset) begin
            f_valid_int <= 'd0;
            f_out_int <= 'd0;
            soma_b <= 'd1;
            resultado <= 'd0;
                end
        else begin
            if (f_en == 1) begin

                f_valid_int = 'd1;

                if (resultado == MAX_FIBO) begin
                    soma_b <= 'd1;
                    resultado <= 'd0;
                end

                else begin
                resultado <= resultado + soma_b;
                soma_b <= resultado;
                end 
                f_out_int <= resultado;
            end
            else
            f_valid_int = 'd0;
        end
    end
assign f_valid = f_valid_int;
assign f_out = f_out_int;

endmodule