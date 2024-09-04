`include "even_parity_che.v"
module even_parity_che_tb;
reg [7:0]data_in,parity_in;
wire error;
even_parity_che DUT(data_in,parity_in,error);
initial 
    begin
        $dumpfile("even_parity_che.vcd");
        $dumpvars(0,even_parity_che_tb);
        $monitor($time,"data_in=%b,parity_in=%b,error=%b",data_in,parity_in,error);
        #10 data_in=8'b00000000;parity_in=1;
        #10 data_in=8'b01010101;parity_in=1;
        #10 data_in=8'b01110010;parity_in=1;
        #10 data_in=8'b00001111;parity_in=0;
        #10 data_in=8'b01010101;parity_in=1;

        
    end
endmodule