module full_adder(input a,b,cin,output cout,sout);
wire t1,t2,t3;
and(t2,a,b);
xor(t1,a,b);
and(t3,t1,cin);
or(cout,t2,t3);
xor(sout,t1,cin);
endmodule