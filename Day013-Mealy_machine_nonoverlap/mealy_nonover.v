module mealy_nonover(
    input i_x,
    input i_reset,
    input i_clk,
    output reg o_seq_detected
);

localparam p_state_A=2'b00;
localparam p_state_B=2'b01;
localparam p_state_C=2'b10;
localparam p_state_D=2'b11;

reg [1:0] r_state;
reg [1:0] r_next_state;

always @(*)begin
    if (!i_reset)
        r_next_state=p_state_A;
    else
        case (r_state)
            p_state_A:
            if (i_x==1'b0)
                r_next_state=p_state_A;
            else
                r_next_state=p_state_B;

            p_state_B:
            if (i_x==1'b0)
                r_next_state=p_state_C;
            else
                r_next_state=p_state_B;

            p_state_C:
            if (i_x==1'b0)
                r_next_state=p_state_D;
            else
                r_next_state=p_state_B;

            p_state_D:
                r_next_state=p_state_A;
                
        endcase
end

always @(posedge i_clk or negedge i_reset)begin
    if (!i_reset)
        r_state<=p_state_A;
    else
        r_state<=r_next_state;
end

always @(posedge i_clk or negedge i_reset)begin
    if (!i_reset)
        o_seq_detected=1'b0;
    else
        case (r_state)
            p_state_A:
                o_seq_detected<=1'b0;
            p_state_B:
                o_seq_detected<=1'b0;
            p_state_C:
                o_seq_detected<=1'b0;
            p_state_D:
                if(i_x==1'b1)
                    o_seq_detected<=1'b1;
                else
                    o_seq_detected<=1'b0;
        endcase
end

endmodule