module parity_check(input [15:0] data, output reg parity);
    always @* begin
        parity = ^data;
    end
endmodule