module ring_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b1000;
        end else begin
            q <= {q[0], q[3:1]};
        end
    end

endmodule
