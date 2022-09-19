module register #(
    parameter size = 64
) (
    input [size-1:0] d_i,
    input ld_i,
    input clk_i,
    input rst_i,
    output reg [size-1:0] d_o
);
    always_ff @( posedge clk_i ) begin : proc
        if ( rst_i == 1 ) begin
            d_o <= '0;
        end 

        if (ld_i == 1 && rst_i != 1) begin
            d_o <= d_i;
        end
    end
endmodule