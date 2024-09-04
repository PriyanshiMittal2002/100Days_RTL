`include "moore_nonoverlap.v"
module moore_nonoverlap_tb ();
    reg i_x;
    reg test_clk;
    reg i_rst_b;
    wire o_seq_detected;


    moore_nonoverlap DUT(
        .i_x(i_x),
        .i_clk(test_clk),
        .i_reset(i_rst_b),
        .o_seq_detected(o_seq_detected)
    );

    always
    begin
        test_clk=!test_clk;
        #10;
    end

    initial begin
        $dumpfile("moore_nonoverlap.vcd");
        $dumpvars(0,moore_nonoverlap_tb);
    end

    initial begin
        i_x=1'bx;
        test_clk=1'bx;
        i_rst_b=1'bx;
        #10;
        test_clk=1'b1;
        #10
        i_rst_b=1'b1;
        #10 i_rst_b=1'b0;
        i_x=1'b1;
        #10 i_rst_b=1'b1;
        #21 i_x=1'b0;
        #40 i_x=1'b1;
        #40 i_x=1'b0;
        #40 i_x=1'b1;
        #100;$finish;
    end

endmodule
