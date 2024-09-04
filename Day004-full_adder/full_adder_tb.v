`include "full_adder.v"
module full_adder_tb;
reg a,b,cin;
wire cout,sout;
full_adder DUT(a,b,cin,cout,sout);
initial 
    begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0,full_adder_tb);
        $monitor($time,"a=%b,b=%b,cin=%b,cout=%b,sout=%b",a,b,cin,cout,sout);
        #10 a= 1'b0; b= 1'b0; cin=1'b0;
        #10 a= 1'b0; b= 1'b0; cin=1'b1;
        #10 a= 1'b0; b= 1'b1; cin=1'b0;
        #10 a= 1'b0; b= 1'b1; cin=1'b1;
        #10 a= 1'b1; b= 1'b0; cin=1'b0;
        #10 a= 1'b1; b= 1'b0; cin=1'b1;
        #10 a= 1'b1; b= 1'b1; cin=1'b0;
        #10 a= 1'b1; b= 1'b1; cin=1'b1;
    end
endmodule