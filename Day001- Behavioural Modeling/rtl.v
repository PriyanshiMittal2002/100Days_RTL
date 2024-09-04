module rtl(a,b,not_g,nor_g,or_g,and_g,nand_g,xor_g,xnor_g);
    input a,b;
    output not_g,nor_g,or_g,and_g,nand_g,xor_g,xnor_g;

    assign not_g=~a;
    assign nor_g=~(a|b);
    assign or_g=a|b;
    assign and_g=a&b;
    assign nand_g=~(a&b);
    assign xor_g=a^b;
    assign xnor_g=~(a^b);

endmodule