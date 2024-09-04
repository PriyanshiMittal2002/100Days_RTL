module even_parity_che(input [7:0]data_in,parity_in,output error);
assign error=^({parity_in,data_in});
endmodule