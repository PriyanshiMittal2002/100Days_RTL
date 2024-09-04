`include "rtl_logic.v"
module rtl_logic_tb;
reg a,b;
wire not_g,nor_g,or_g,and_g,nand_g,xor_g,xnor_g;
rtl_logic DUT(a,b,not_g,nor_g,or_g,and_g,nand_g,xor_g,xnor_g);
initial 
    begin
        $dumpfile("rtl_logic.vcd");
        $dumpvars(0,rtl_logic_tb);
        $monitor($time,"a=%b,b=%b,not_g=%b,nor_g=%b,or_g=%b,and_g=%b,nand_g=%b,xor_g=%b,xnor_g=%b",a,b,not_g,nor_g,or_g,and_g,nand_g,xor_g,xnor_g);
        #10 a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;
    end
endmodule