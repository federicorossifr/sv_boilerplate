module register_tb ();
    
    parameter nregs = 8;
    parameter rsize = 8;

    reg clk;
    reg [rsize-1:0] data;
    reg w;
    wire [rsize-1:0] out1,out2;
    reg [$clog2(nregs) - 1: 0 ] rs1,rs2;
    reg ld;
    reg rst;

    register_file #(nregs,rsize) myregfile (
        .clk_i(clk),
        .rst_i(rst),
        .w_i(w),
        .d_i(data),
        .d1_o(out1),
        .d2_o(out2),   
        .idx1_i(rs1),
        .idx2_i(rs2)
    );


    always #10 clk <= !clk;

    initial #0 begin

        $dumpfile("out.vcd");
        $dumpvars(0,register_tb);
        clk = 0;
        data = 0;
        rs1 = 0-1;
        rs2 = 0-1;
        w = 0;
        rst = 1;

        #20 rst = 0; w = 1;
    
        #200 $finish;
    end

    always @(posedge clk) begin
        data <= data + 1;
        rs1 <= (rs1 + 1) % nregs;
        rs2 <= rs1;
    end

endmodule