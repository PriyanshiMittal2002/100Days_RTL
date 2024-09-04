module full_sub(input a,bin,b,output bout,diff);
wire t1,t2,t3,t4;
xor (t1,b,bin);
and(t2,~a,t1);
and(t3,b,bin);
xor(t4,a,b);
or(bout,t2,t3);
xor(diff,bin,t4);
endmodule