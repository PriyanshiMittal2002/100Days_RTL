`include "half_adder.v"
module half_adder_tb;
reg a,b;
wire cout,sout;
half_adder DUT(a,b,cout,sout);
initial 
    begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0,half_adder_tb);
        $monitor($time,"a=%b,b=%b,cout=%b,sout=%b",a,b,cout,sout);
        #10 a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;
    end
endmodule