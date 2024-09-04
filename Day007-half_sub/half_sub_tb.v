`include "half_sub.v"
module half_sub_tb;
reg a,b;
wire cout,sout;
half_sub DUT(a,b,bout,diff);
initial 
    begin
        $dumpfile("half_sub.vcd");
        $dumpvars(0,half_sub_tb);
        $monitor($time,"a=%b,b=%b,bout=%b,diff=%b",a,b,bout,diff);
        #10 a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;
    end
endmodule