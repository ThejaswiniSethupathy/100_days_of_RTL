module d_ff(
    input clk, reset, d,
    output reg q, qb
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 1'b0;
        qb <= 1'b1;
    end else begin
        q <= d;
        qb <= ~d;
    end
end

endmodule
