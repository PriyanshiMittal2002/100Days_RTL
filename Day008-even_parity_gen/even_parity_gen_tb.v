`include "even_parity_gen.v"
module even_parity_gen_tb;
reg [7:0]data_in;
wire parity;
even_parity_gen DUT(data_in,parity);
initial 
    begin
        $dumpfile("even_parity_gen.vcd");
        $dumpvars(0,even_parity_gen_tb);
        $monitor($time,"data_in=%b,parity=%b",data_in,parity);
        #10 data_in=8'b00000000;
        #10 data_in=8'b01010101;
        #10 data_in=8'b01110010;
        #10 data_in=8'b00001111;
        #10 data_in=8'b01010101;

        
    end
endmodule