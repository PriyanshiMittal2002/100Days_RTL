module half_sub(input a,b, output bout,diff);
and(bout,~a,b);
xor(diff,a,b);
endmodule