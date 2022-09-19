module register_file #(
    nregs = 8,
    rsize = 32
) (
    input clk_i,
    input rst_i,
    input w_i,
    input d_i[ rsize-1 : 0 ],
    input idx1_i[ $clog2(nregs)-1 : 0 ],
    input idx2_i[ $clog2(nregs)-1 : 0 ],

    output d1_o[ rsize - 1: 0 ],
    output d2_o[ rsize - 1: 0 ]
);
    
    logic [ 0 : nregs - 1 ] [rsize - 1 : 0 ] d_ov;
    logic [ 0 : nregs - 1 ] ld_iv;

    genvar i;
    generate
        for (i = 0; i < nregs ; i++ ) begin
            register #(rsize) reg_i(
                .clk_i(clk_i),
                .rst_i(rst_i),
                .d_i(d_i),
                .d_o(d_ov[i]),
                .ld_i(ld_iv[i] & w_i)
            );

            assign ld_iv[i] = ( idx1_i == i)? 1 : 0;
        end
    endgenerate

    assign d1_o = d_ov[idx1_i];
    assign d2_o = d_ov[idx2_i];

endmodule