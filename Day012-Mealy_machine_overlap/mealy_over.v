/*
**rule 1: always use non blocking in sequential block
**rule 2: always use blocking in combo block
**rule 3: you can not set a wire to a variable. i.e 
wire w_test_wire;
w_test_wire = r_test_register; //wrong
assign w_test_wire = r_test_register; //correct
assign will only be used to assign wire. 
**rule 4: always be mindful which parameter is local or paramter.
*/


module mealy_over(
    input i_x,
    input i_clk,
    input i_rst_b,
    output reg o_seq_detected);

localparam p_state_A = 2'd0 ;
localparam p_state_B = 2'd1 ;
localparam p_state_C = 2'd2 ;
localparam p_state_D = 2'd3 ;

reg [1:0] r_state;  //sequential register;

reg [1:0] r_next_state;   //combinational register;

// assign wire= wire or register

always @(*)         //combinational next state logic?
begin
    if(!i_rst_b)
    begin
        r_next_state=p_state_A;
    end
    else
    begin
        case(r_state)  //r_state is sequencial 
        
        p_state_A:
        begin
            if(i_x==1'b0)
            begin
                r_next_state    =   p_state_A;
            end
            else
            begin
                r_next_state    =   p_state_B;
            end
        end
        p_state_B:
        begin
            if(i_x==1'b0)
            begin
                r_next_state    =   p_state_C;
            end
            else
            begin
                r_next_state    =   p_state_B;
            end
        end
        p_state_C:
        begin
            if(i_x==1'b0)
            begin
                r_next_state    =   p_state_D;
            end
            else
            begin
                r_next_state    =   p_state_B;
            end
        end
        p_state_D:
        begin
            if(i_x==1'b0)
            begin
                r_next_state    =   p_state_A;
            end
            else
            begin
                r_next_state    =   p_state_B;
            end
        end
        endcase
    end
end


always @(posedge i_clk or negedge i_rst_b) begin  //sequentional state assignment is only done. //current state logic
    if(!i_rst_b)
    begin
        r_state<=p_state_A;
    end
    else
    begin
        r_state<=r_next_state;
    end
end

always @(posedge i_clk or negedge i_rst_b) begin    //output logic.. this is also sequential logic...because i need my output to change with respect to clk.
    if(!i_rst_b)
    begin
        o_seq_detected<=1'b0;
    end
    else
    begin
        case(r_state)
        p_state_A:
        begin
            o_seq_detected<=1'b0;
        end
        p_state_B:
        begin
            o_seq_detected<=1'b0;
        end
        p_state_C:
        begin
            o_seq_detected<=1'b0;
        end
        p_state_D:
        begin
            if(i_x==1'b1)
            begin
                o_seq_detected<=1'b1;
            end
            else
            begin
                o_seq_detected<=1'b0;
            end
        end
        endcase
    end
end
endmodule