module half_adder(input a,b, output cout,sout);
and(cout,a,b);
xor(sout,a,b);
endmodule