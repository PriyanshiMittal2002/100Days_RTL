`include "four_bit_full_adder.v"
module four_bit_full_adder_tb;
reg [3:0]A,B;
reg carry_in;
wire [3:0]sum;
wire carry;
four_bit_full_adder DUT(A,B,carry_in,sum,carry);

always
    begin        
        A= $random;
        B= $random;
        carry_in= $random;
        #10; 
    end

initial 
    begin
        $dumpfile("four_bit_full_adder.vcd");
        $dumpvars(0,four_bit_full_adder_tb);
        $monitor($time,"A=%b,B=%b,carry_in=%b,sum=%b,carry=%b",A,B,carry_in,sum,carry);
        #60 $finish;
    end
endmodule
