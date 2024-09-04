`include "full_sub.v"
module full_sub_tb;
reg a,b,bin;
wire bout,diff;
full_sub DUT(a,bin,b,bout,diff);
initial 
    begin
        $dumpfile("full_sub.vcd");
        $dumpvars(0,full_sub_tb);
        $monitor($time,"a=%b,bin=%b,b=%b,bout=%b,diff=%b",a,bin,b,bout,diff);
        #10 a= 1'b0; bin= 1'b0; b=1'b0;
        #10 a= 1'b0; bin= 1'b0; b=1'b1;
        #10 a= 1'b0; bin= 1'b1; b=1'b0;
        #10 a= 1'b0; bin= 1'b1; b=1'b1;
        #10 a= 1'b1; bin= 1'b0; b=1'b0;
        #10 a= 1'b1; bin= 1'b0; b=1'b1;
        #10 a= 1'b1; bin= 1'b1; b=1'b0;
        #10 a= 1'b1; bin= 1'b1; b=1'b1;
    end
endmodule