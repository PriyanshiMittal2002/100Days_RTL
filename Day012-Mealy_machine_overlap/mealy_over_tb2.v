`include "mealy_over.v"
module mealy_over_tb2();
    reg i_x;
    reg test_clk;
    reg i_rst_b;
    wire o_seq_detected;


    mealy_over DUT(
        .i_x(i_x),
        .i_clk(test_clk),
        .i_rst_b(i_rst_b),
        .o_seq_detected(o_seq_detected)
    );

    always
    begin
        test_clk=!test_clk;
        #10;
    end

    initial begin
        $dumpfile("mealy_over.vcd");
        $dumpvars(0,mealy_over_tb2);
    end

    initial begin
        i_x=1'bx;
        test_clk=1'bx;
        i_rst_b=1'bx;
        #10;
        test_clk=1'b1;
        #10
        i_rst_b=1'b1;
        #10
        i_rst_b=1'b0;
        i_x=1'b1;
        #10
        i_rst_b=1'b1;
        #21 i_x=1'b0;
        #40
        i_x=1'b1;
        #10 i_x=1'b0;
        #40 i_x=1'b1;
        #100;$finish;
    end

endmodule

/*
_________________________________________________________________
|                   testbench                              |
|                    _____________________                      |
|                    |                   |                      |
|  input ports------>|                   |------>output ports   |
|  input ports------>|                   |------>output ports   |
|  input ports------>|   fsm             |------>output ports   |
|  input ports------>|                   |------>output ports   |
|                    |                   |------>output ports   |
|                    |                   |                      |
|                    --------------------                       |
-----------------------------------------------------------------