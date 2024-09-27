module jk_ff(
    input clk, j, k,
    output reg q, qb
);

parameter HOLD = 2'b00;
parameter TOGGLE = 2'b01;
parameter SET = 2'b10;
parameter RESET = 2'b11;

always @(posedge clk)
    case ({j, k})
        HOLD: {q, qb} <= {q, qb};
        TOGGLE: {q, qb} <= ~{q, qb};
        SET: {q, qb} <= 2'b10;
        RESET: {q, qb} <= 2'b01;
    endcase

endmodule
