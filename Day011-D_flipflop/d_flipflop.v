module d_flipflop(input d,clk,async_reset_b, output q);
reg q;

always @(posedge clk or negedge async_reset_b)
    begin
      if(!async_reset_b)
        q<=0;
      else
        q<=d;
    end

endmodule
