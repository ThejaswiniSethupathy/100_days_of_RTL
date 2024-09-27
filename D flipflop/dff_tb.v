module d_ff_tb;
	reg clk, reset, d;
	wire q, qb;

d_ff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
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

task apply_reset;
    begin
        reset = 1'b1;
        #5 reset = 1'b0;
    end
endtask

initial
    begin
        clk = 1'b0;
        reset = 1'b1;
        d = 1'b0;
        apply_reset;
        d = 1'b1;
        apply_clk;
        apply_clk;
        d = 1'b0;
        apply_clk;
        apply_clk;

        $finish;
    end

endmodule
