//`timescale 1ns/1ns
`include "d_flipflop.v"
module d_flipflop_tb;
reg d,clk,async_reset_b;
wire q;
d_flipflop DUT(d,clk,async_reset_b,q);
initial
    begin
        $dumpfile("d_flipflop.vcd");
        $dumpvars(0,d_flipflop_tb);
        //$monitor($time,"d=%b,q=%b",d,q);
        //#10 d=1'bx; clk=1'bx; async_reset_b=1'bx;
        #10 d=$random; clk=1'b0; async_reset_b=1'b1;
       
        #500;
        $finish;
    end
always
    begin
        clk=~clk;
        d=$random;
        async_reset_b=$random;
        #10;
    end
endmodule
