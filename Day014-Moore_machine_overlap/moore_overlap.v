module moore_overlap (
    input i_x,
    input i_clk,
    input i_reset,
    output reg o_seq_detected
);
localparam p_state_A = 3'b000;
localparam p_state_B = 3'b001;
localparam p_state_C = 3'b010;
localparam p_state_D = 3'b011;
localparam p_state_E = 3'b100;

reg [2:0]r_state;
reg [2:0]r_next_state;


always@(*)
    case (r_state)
        p_state_A:
            if (i_x==1'b1)
                r_next_state=p_state_B;
            else
                r_next_state=p_state_A;

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
            if (i_x==1'b1)
                r_next_state=p_state_E;
            else
                r_next_state=p_state_A;

        p_state_E:
            if (i_x==1'b0)
                r_next_state=p_state_C;
            else
                r_next_state=p_state_B;

    endcase

always@(posedge i_clk or negedge i_reset)
    if (!i_reset)
        r_state<=p_state_A;
    else
        r_state<=r_next_state;

// always@(posedge i_clk or negedge i_reset)begin
//     if (!i_reset)
//         o_seq_detected=1'b0;
//     else
    
//         if(r_state==p_state_E)
//             o_seq_detected<=1'b1;
//         else
//             o_seq_detected<=1'b0;
// end
always@(*)begin
    if(!i_reset)
    begin
      o_seq_detected=1'b0;
    end
    else begin
      case (r_state)
        p_state_A:
        begin
          o_seq_detected=1'b0;
        end
        p_state_B:
        begin
          o_seq_detected=1'b0;
        end
        p_state_C:
        begin
          o_seq_detected=1'b0;
        end
        p_state_D:
        begin
          o_seq_detected=1'b0;
        end
        p_state_E: 
        begin
          o_seq_detected=1'b1;
        end
        
      endcase
    end
        
end
    


endmodule