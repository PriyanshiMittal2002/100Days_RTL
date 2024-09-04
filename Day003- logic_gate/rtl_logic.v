module rtl_logic(a,b,not_g,nor_g,or_g,and_g,nand_g,xor_g,xnor_g);
    input a,b;
    output not_g,nor_g,or_g,and_g,nand_g,xor_g,xnor_g;
    not (not_g,a);
    nor (nor_g,a,b);
    or (or_g,a,b);
    and(and_g,a,b);
    nand (nand_g,a,b);
    xor (xor_g,a,b);
    xnor (xnor_g,a,b);
endmodule
