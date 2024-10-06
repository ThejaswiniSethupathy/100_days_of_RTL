module sequence_detector(
    input clk,
    input rst,
    input X,
    output reg Z1
);
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    reg [1:0] current_state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        next_state = current_state;
        Z1 = 0;

        case (current_state)
            S0: begin
                if (X)
                    next_state = S1;
            end
            S1: begin
                if (!X)
                    next_state = S2;
            end
            S2: begin
                if (X)
                    next_state = S3;
                else
                    next_state = S0;
            end
            S3: begin
                Z1 = 1;
                next_state = S1;
            end
            default: next_state = S0;
        endcase
    end
endmodule
