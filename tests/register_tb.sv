module register_tb ();
    
    parameter lsize = 8;

    reg clk;
    reg [lsize-1:0] data;
    wire [lsize-1:0] out;
    reg ld;
    reg rst;

    register #(lsize) myreg (
        .clk_i(clk),
        .d_i(data),
        .d_o(out),
        .rst_i(rst),
        .ld_i(ld)
    );


    always #10 clk <= !clk;

    initial #0 begin

        $dumpfile("out.vcd");
        $dumpvars(0,register_tb);
        clk = 0;
        data = 0;
        ld = 1;
        rst = 1;

        #10 rst = 0;

        
        #200 $finish;
    end

    always @(posedge clk) begin
        data <= data + 1;
    end

endmodule