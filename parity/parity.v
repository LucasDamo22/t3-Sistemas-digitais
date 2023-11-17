module parity_check(input [15:0] data, output reg parity);
    always @* begin
        parity = ((data[0]  ^ data[1])^
                  (data[2]  ^ data[3])^
                  (data[4]  ^ data[5])^
                  (data[6]  ^ data[7])^
                  (data[8]  ^ data[9])^
                  (data[10] ^ data[11])^
                  (data[12] ^ data[13])^
                  (data[14] ^ data[15]));
    end
endmodule