module jk_ff_tb;

reg clk, j, k;
wire q, qb;
jk_ff uut (
    .clk(clk),
    .j(j),
    .k(k),
    .q(q),
    .qb(qb)
);

task apply_clk;
    begin
        clk = 1'b0;
        #5 clk = 1'b1;
        #5 clk = 1'b0;
    end
endtask

initial
    begin
        // Initialize
        j = 1'b0;
        k = 1'b0;
        clk = 1'b0;

        // Test HOLD
        apply_clk;
        #10;

        // Test TOGGLE
        j = 1'b1;
        k = 1'b0;
        apply_clk;
        #10;

        // Test SET
        j = 1'b1;
        k = 1'b1;
        apply_clk;
        #10;

        // Test RESET
        j = 1'b0;
        k = 1'b1;
        apply_clk;
        #10;
        $finish;
    end

endmodule
